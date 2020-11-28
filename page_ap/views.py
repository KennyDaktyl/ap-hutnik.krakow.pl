from django.http import HttpResponse, HttpResponseRedirect
from django.template.response import TemplateResponse
# from django.shortcuts import render
from django.template import RequestContext
from django.views import View
from django.views.generic.edit \
    import CreateView, UpdateView, DeleteView,FormView
from django.urls import reverse_lazy
from django.shortcuts import render
from django.contrib.auth import login, logout, authenticate
from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import PermissionRequiredMixin, PermissionRequiredMixin
# from .forms import LoginForm, UserRegistrationForm, UserEditForm, ProfileEditForm
# from .models import Profile
from django.contrib import messages
from django.shortcuts import get_object_or_404, redirect
from django.contrib.auth.models import User
from django.contrib.auth.models import Group
from calendar import HTMLCalendar
import datetime
from django.utils.dates import WEEKDAYS, WEEKDAYS_ABBR
from .models import *
from django.core.paginator import Paginator
from account.forms import *
from .forms import *
from .functions import *
from django import forms
from account.task import send_email_task, send_email_task_file

from PIL import Image
import glob, os
import json

from django.core.mail import send_mail, EmailMessage

import redis
from django.conf import settings
r = redis.StrictRedis(host=settings.REDIS_HOST,
                      port=settings.REDIS_PORT,
                      db=settings.REDIS_DB)



# Create your views here.
class MainView(View):
    def get(self, request):
        news = Post.objects.all().order_by('-publish')
        news_2 = news[4:8]
        news = news[1:4]
        new_first = Post.objects.first()
        teams = YearBook.objects.all()
        teams_on_page = Teams.objects.all()[:8]
        trainers = Profile.objects.filter(role=1).filter(
            employe_position=1)[:8]
        trainig_base = BaseBuildings.objects.all()[:8]
        post_ranking = r.zrange('post_ranking', 0, -1, desc=False)[:10]
        post_ranking_ids = [int(id) for id in post_ranking]
        most_viewed = list(Post.objects.filter(pk__in=post_ranking_ids))
        most_viewed.sort(key=lambda x: post_ranking_ids.index(x.id))
        total_views = r.incr('page')
        ctx = {
            'teams': teams,
            'news': news,
            'news_2': news_2,
            'post_first': new_first,
            'trainers': trainers,
            'trainig_base': trainig_base,
            'teams_on_page': teams_on_page,
            'total_views': total_views
        }
        return render(request, 'page_ap/main_page.html', ctx)


@method_decorator(login_required, name='dispatch')
class ProfileView(PermissionRequiredMixin, View):
    permission_required = 'page_ap.view_profile'

    def get(self, request, pk):
        profile = Profile.objects.get(user=request.user)
        ctx = {'profile': profile}

        if profile.role == 0:
            return render(request, 'page_ap/profile_player_details.html', ctx)
        if profile.role == 1:
            return render(request, 'page_ap/profile_employe_details.html', ctx)
        if profile.role == 2:
            return render(request, 'page_ap/profile_worker_details.html', ctx)

    def post(self, request, pk):
        player = request.POST.get('player')
        if player:
            player = Profile.objects.get(pk=player)
            if player.rodo == False:
                player.rodo = True
            else:
                player.rodo = False
            player.save()
        return redirect('profile', pk=player.id)


@method_decorator(login_required, name='dispatch')
class UserUpdateView(PermissionRequiredMixin, UpdateView):
    permission_required = 'page_ap.change_profile'
    raise_exception = True
    model = User

    fields = ['username', 'first_name', 'last_name', 'email']
    template_name_suffix = ('_update_form')
    success_url = ('profile')

    def get_success_url(self):
        return f"/profile/{self.object.id}"


@method_decorator(login_required, name='dispatch')
class ProfileEmployeUpdateView(PermissionRequiredMixin, UpdateView):
    permission_required = 'page_ap.change_profile'
    raise_exception = True
    model = Profile
    form_class = ProfileEmployeUpdateForm
    template_name_suffix = ('_update_form')
    success_url = ('profile')

    def get_success_url(self):
        return f"/profile/{self.object.user.id}"


@method_decorator(login_required, name='dispatch')
class ProfilePlayerUpdateView(PermissionRequiredMixin, UpdateView):
    permission_required = 'page_ap.view_profile'
    raise_exception = True
    model = Profile
    form_class = ProfilePlayerUpdateForm
    template_name_suffix = ('_update_form')
    success_url = ('profile')

    def get_success_url(self):
        return f"/profile/{self.object.id}"


class PostsView(View):
    def get(self, request):
        posts = Post.objects.all().order_by('-publish')
        teams = YearBook.objects.all()
        page = request.GET.get('page')
        page_records = 12
        paginator = Paginator(posts, page_records)
        posts = paginator.get_page(page)
        ctx = {
            'posts': posts,
            'teams': teams,
        }
        return render(request, 'page_ap/posts.html', ctx)


class PostsTeamView(View):
    def get(self, request, slug, pk):
        team = Teams.objects.get(pk=pk)
        posts = Post.objects.filter(team=team).order_by('-id')
        teams = YearBook.objects.all()
        page = request.GET.get('page')
        page_records = 12
        paginator = Paginator(posts, page_records)
        posts = paginator.get_page(page)
        ctx = {
            'posts': posts,
            'teams': teams,
            'team': team,
        }
        return render(request, 'page_ap/posts.html', ctx)


class PostsTeamByYearView(View):
    def get(self, request, slug, pk):
        year = YearBook.objects.get(pk=pk)
        teams = Teams.objects.filter(yearbook=year)
        posts = Post.objects.filter(team__in=teams).order_by('-id')
        page = request.GET.get('page')
        page_records = 12
        paginator = Paginator(posts, page_records)
        posts = paginator.get_page(page)
        ctx = {
            'posts': posts,
            'teams': teams,
            'year': year,
        }
        return render(request, 'page_ap/posts_by_year.html', ctx)


class PostDetailView(View):
    def get(self, request, slug, pk):
        post = Post.objects.get(pk=pk)
        total_views = r.incr('post:{}:views'.format(post.id))
        r.zincrby('post_ranking', 1, post.id)
        images_post = Images.objects.filter(post=post)
        page = request.GET.get('page')
        page_records = 12
        paginator = Paginator(images_post, page_records)
        images_post = paginator.get_page(page)
        app_id = os.environ.get('APP_ID')
        ctx = {
            'post': post,
            'images_post': images_post,
            'app_id': app_id,
            'total_views': total_views
        }
        return render(request, 'page_ap/post_details.html', ctx)


class CoachsView(View):
    def get(self, request):
        coachs = Profile.objects.filter(role=1).filter(
            employe_position__in=[1, 2, 3, 4, 5, 6])[:8]
        teams = Teams.objects.all()
        page = request.GET.get('page')
        page_records = 15
        paginator = Paginator(coachs, page_records)
        coachs = paginator.get_page(page)
        ctx = {'coachs': coachs, 'teams': teams}
        return render(request, 'page_ap/coachs.html', ctx)


class CoachDetailView(View):
    def get(self, request, slug, pk):
        coach = Profile.objects.get(pk=pk)
        teams = Teams.objects.filter(coach=pk)
        contact_form = ContactForm(initial={'person': coach})
        ctx = {'coach': coach, 'teams': teams, 'contact_form': contact_form}
        return render(request, 'page_ap/coach_details.html', ctx)

    def post(self, request, slug, pk):
        coach = Profile.objects.get(pk=pk)
        teams = Teams.objects.filter(coach=pk)
        contact_form = ContactForm(request.POST)
        if contact_form.is_valid():
            email = request.POST.get("email")
            subject = request.POST.get("subject")
            message = request.POST.get("message")
            captcha = request.POST.get("captcha")

            message += "\n" + "Email kontaktowy - " + str(email)
            send_mail(
                subject,
                message,
                settings.EMAIL_HOST_USER,
                [coach.user.email],
            )
            messages.success(request,
                             'Wysysłanie email zakończnono poprawnie.')
            print('hello')
            return redirect('coach_details', slug=coach.slug, pk=coach.id)
        else:
            print('hello2')
            messages.error(request, 'Wypełnij wszystkie pola formularza.')
            return redirect('coach_details', slug=coach.slug, pk=coach.id)


@method_decorator(login_required, name='dispatch')
class My_Players_list_View(PermissionRequiredMixin, View):
    permission_required = 'page_ap.view_profile'

    def get(self, request, pk):
        profile = Profile.objects.get(pk=pk)
        teams = Teams.objects.filter(coach=profile)
        ctx = {'teams': teams}
        return render(request, 'page_ap/my_players_list.html', ctx)

    def post(self, request, pk):
        profile = Profile.objects.get(pk=pk)
        teams = Teams.objects.filter(coach=profile)

        player = request.POST.get('player')
        player = Profile.objects.get(pk=player)
        if player.is_activated == False:
            player.is_activated = True
        else:
            player.is_activated = False
        player.save()
        ctx = {'teams': teams}
        return render(request, 'page_ap/my_players_list.html', ctx)


class PlayerDetailView(View):
    def get(self, request, slug, pk):
        profile = Profile.objects.get(pk=pk)
        ctx = {'profile': profile}
        return render(request, 'page_ap/player_details.html', ctx)


@method_decorator(login_required, name='dispatch')
class TeamsListView(PermissionRequiredMixin, View):
    permission_required = 'page_ap.add_teams'

    def get(self, request):
        teams = Teams.objects.all()
        ctx = {
            'teams': teams,
        }
        return render(request, 'page_ap/teams_list.html', ctx)

    def post(self, request):
        person = request.POST.get('person')
        team = request.POST.get('team')
        if person:
            person = Profile.objects.get(pk=person)
            team = Teams.objects.get(pk=team)
            if person in team.team_persons.all():
                team.team_persons.remove(person)
            else:
                team.team_persons.add(person)
            team.save()
        return redirect('teams_list')


class TeamsView(View):
    def get(self, request):
        teams = Teams.objects.all()
        page = request.GET.get('page')
        page_records = 12
        paginator = Paginator(teams, page_records)
        teams = paginator.get_page(page)
        ctx = {
            'teams': teams,
        }
        return render(request, 'page_ap/teams.html', ctx)


class TeamsByYearView(View):
    def get(self, request, slug, pk):
        year = YearBook.objects.get(pk=pk)
        teams = Teams.objects.filter(yearbook=year).filter(archive=False)
        page = request.GET.get('page')
        page_records = 12
        paginator = Paginator(teams, page_records)
        teams = paginator.get_page(page)
        ctx = {
            'teams': teams,
        }
        return render(request, 'page_ap/teams.html', ctx)


class TeamDetailsView(View):
    def get(self, request, slug, pk):
        team = Teams.objects.get(pk=pk)
        team_gallery = Images.objects.filter(team=team)
        page = request.GET.get('page')
        page_records = 12
        paginator = Paginator(team_gallery, page_records)
        team_gallery = paginator.get_page(page)
        ctx = {'team': team, 'team_gallery': team_gallery}
        return render(request, 'page_ap/team_details.html', ctx)


class BuildingsView(View):
    def get(self, request):
        buildings = BaseBuildings.objects.all()
        page = request.GET.get('page')
        page_records = 12
        paginator = Paginator(buildings, page_records)
        buildings = paginator.get_page(page)
        ctx = {
            'buildings': buildings,
        }
        return render(request, 'page_ap/buildings.html', ctx)


class BuildingDetailsView(View):
    def get(self, request, slug, pk):
        building = BaseBuildings.objects.get(pk=pk)
        images_building = Images.objects.filter(building=building)
        ctx = {'building': building, 'images_building': images_building}
        return render(request, 'page_ap/building_details.html', ctx)


class ContactView(View):
    def get(self, request):
        contact_form = ContactViewForm()
        profile = Profile.objects.filter(role=1)
        ctx = {'profile': profile, 'contact_form': contact_form}
        return render(request, 'page_ap/contact.html', ctx)

    def post(self, request):
        contact_form = ContactViewForm(request.POST)
        if contact_form.is_valid():
            person = request.POST.get("persons")
            email = request.POST.get("email")
            subject = request.POST.get("subject")
            message = request.POST.get("message")
            captcha = request.POST.get("captcha")

            message += "\n" + "Email kontaktowy - " + str(email)
            profile = Profile.objects.get(pk=int(person))
            send_mail(
                subject,
                message,
                settings.EMAIL_HOST_USER,
                [profile.user.email],
            )
            messages.success(request, 'Wysyłanie email zakończnono poprawnie.')
            return redirect('contact', )
        else:
            messages.error(request, 'Wypełnij wszystkie pola formularza.')
            return redirect('contact', )


@method_decorator(login_required, name='dispatch')
class CreateYearBookView(PermissionRequiredMixin, CreateView):
    permission_required = 'page_ap.add_yearbook'
    model = YearBook
    form_class = YearBookForm
    success_url = reverse_lazy("profile")

    def form_valid(self, form):
        form.instance.creator = Profile.objects.get(user=self.request.user)
        return super(CreateYearBookView, self).form_valid(form)

    def get_success_url(self):
        return reverse_lazy('profile', kwargs={'pk': self.request.user.id})


@method_decorator(login_required, name='dispatch')
class CreateTeamView(PermissionRequiredMixin, CreateView):
    permission_required = 'page_ap.add_teams'
    model = Teams
    form_class = TeamForm
    success_url = reverse_lazy("profile")

    def form_valid(self, form):
        form.instance.coach = Profile.objects.get(user=self.request.user)
        return super(CreateTeamView, self).form_valid(form)

    def get_success_url(self):
        return reverse_lazy('profile', kwargs={'pk': self.request.user.id})


@method_decorator(login_required, name='dispatch')
class CreatePostView(PermissionRequiredMixin, CreateView):
    permission_required = 'page_ap.add_post'
    raise_exception = True
    model = Post
    form_class = PostForm
    success_url = reverse_lazy("profile")

    def get_queryset(self, request):
        self.fields['team'].queryset = Teams.objects.filter(archive=False)

    def form_valid(self, form):
        form.instance.author = self.request.user
        return super(CreatePostView, self).form_valid(form)

    def get_success_url(self):
        return reverse_lazy('add_imgaes_post', kwargs={'pk': self.object.id})


@method_decorator(login_required, name='dispatch')
class CreatePostGalleryView(PermissionRequiredMixin, CreateView):
    permission_required = 'page_ap.add_images'
    raise_exception = True
    model = Images
    form_class = GalleryImagesForm
    context_object_name = 'object'
    success_url = reverse_lazy("add_imgaes_post")

    def form_valid(self, form):
        post = get_object_or_404(Post, pk=self.kwargs['pk'])
        form.instance.post = post
        return super().form_valid(form)

    def get_context_data(self, **kwargs):
        ctx = super(CreatePostGalleryView, self).get_context_data(**kwargs)
        post = Post.objects.get(pk=self.kwargs['pk'])
        ctx['images_post'] = Images.objects.filter(post=int(post.id))
        return ctx

    def get_success_url(self):
        return reverse_lazy('add_imgaes_post',
                            kwargs={'pk': self.object.post.id})


@method_decorator(login_required, name='dispatch')
class CreateTrainingView(PermissionRequiredMixin, CreateView):
    permission_required = 'page_ap.add_trainings'
    raise_exception = True
    model = Trainings
    form_class = AddTrainingForm
    context_object_name = 'object'
    success_url = reverse_lazy("teams_list")

    def form_valid(self, form):
        team = get_object_or_404(Teams, pk=self.kwargs['pk'])
        form.instance.team = team
        return super().form_valid(form)


@method_decorator(login_required, name='dispatch')
class UpdateTrainingView(PermissionRequiredMixin, UpdateView):
    permission_required = 'page_ap.change_trainings'
    raise_exception = True
    model = Trainings
    form_class = AddTrainingForm
    context_object_name = 'object'
    success_url = reverse_lazy("teams_list")


@method_decorator(login_required, name='dispatch')
class DeleteTrainingView(PermissionRequiredMixin, DeleteView):
    permission_required = 'page_ap.delete_trainings'
    raise_exception = True
    model = Trainings
    form_class = AddTrainingForm
    context_object_name = 'object'
    success_url = reverse_lazy("teams_list")


def handle_uploaded_file(file):
    ext = file.name.split('.')[-1]
    file_name = '{}.{}'.format(uuid.uuid4().hex[:10], ext)
    file_path = os.path.join('files', file_name)
    absolute_file_path = os.path.join('media', 'files', file_name)

    directory = os.path.dirname(absolute_file_path)
    if not os.path.exists(directory):
        os.makedirs(directory)

    with open(absolute_file_path, 'wb+') as destination:
        for chunk in file.chunks():
            destination.write(chunk)

    return file_path


@method_decorator(login_required, name='dispatch')
class UploadFileView(PermissionRequiredMixin, View):
    permission_required = 'page_ap.add_file'

    def get(self, request):
        upload_form = FileUploadModelForm()
        ctx = {'upload_form': upload_form}
        return TemplateResponse(request, "page_ap/file_form.html", ctx)

    def post(self, request):
        upload_form = FileUploadModelForm(request.POST, request.FILES)
        if upload_form.is_valid():
            title = upload_form.cleaned_data.get("title")
            raw_file = upload_form.cleaned_data.get("file")
            new_file = File()
            new_file.file = handle_uploaded_file(raw_file)
            new_file.title = title
            new_file.save()
            messages.error(request, 'Załadowano plik poprawnie.')
            return redirect("files_list")
        else:
            upload_form = FileUploadModelForm(request.POST, request.FILES)
            ctx = {'upload_form': upload_form}
            messages.error(request, 'Coś poszło nie tak')
            return TemplateResponse(request, "page_ap/file_form.html", ctx)


@method_decorator(login_required, name='dispatch')
class SendingEmailsView(PermissionRequiredMixin, View):
    permission_required = 'page_ap.add_post'

    def get(self, request):
        email_form = EmailSendForm()
        ctx = {'email_form': email_form}
        return TemplateResponse(request, "page_ap/send_email_form.html", ctx)

    def post(self, request):
        email_form = EmailSendForm(request.POST, request.FILES)
        if email_form.is_valid():
            groups = email_form.cleaned_data.get("groups")
            email = email_form.cleaned_data.get("email")
            subject = email_form.cleaned_data.get("subject")
            message = email_form.cleaned_data.get("message")
            capctha = email_form.cleaned_data.get("captcha")
            file_up = email_form.cleaned_data.get("file")
            if file_up:
                new_file = File()
                new_file.file = handle_uploaded_file(file_up)
                new_file.title = "Załącznik email"
                new_file.email = True
                new_file.save()
            message = message + "\n" + "Wysłano od: " + ", " + email + ", " + request.user.first_name + " " + request.user.first_name
            messages.error(request, 'Wysłano wiadomość email.')
            emails = []
            if groups == "0":
                profile = Profile.objects.all()
                for el in profile:
                    emails.append(el.user.email)
            if groups == "1":
                profile = Profile.objects.filter(role=1)
                for el in profile:
                    emails.append(el.user.email)
            if groups == "2":
                profile = Profile.objects.filter(role=0)
                for el in profile:
                    emails.append(el.user.email)
            if groups == "3":
                i_am = Profile.objects.filter(user=request.user)
                teams = Teams.objects.filter(coach__in=i_am)
                profile = Profile.objects.filter(team__in=teams)
                for el in profile:
                    emails.append(el.user.email)
            #celery task
            if file_up:
                file_str = str(new_file.file)
                send_email_task_file.delay(emails, subject, message, file_str)
            else:
                send_email_task.delay(emails, subject, message)
            return redirect("profile", pk=request.user.profile.id)
        else:
            email_form = EmailSendForm(request.POST, request.FILES)
            ctx = {'email_form': email_form}
            messages.error(request, 'Wypełnij wszystkie pola formularza')
            return TemplateResponse(request, "page_ap/send_email_form.html",
                                    ctx)
            # return redirect("sending_email")


class FilesView(View):
    def get(self, request):
        files = File.objects.filter(email=False)
        ctx = {'files': files}
        return TemplateResponse(request, "page_ap/files_list.html", ctx)


class CookiesView(View):
    def get(self, request):
        return TemplateResponse(request, "page_ap/cookies.html")


from django.shortcuts import render
from django.template import RequestContext
from django.template import Context, loader


def error404(request, *args):
    return render(request, 'page_ap/404.html')


def error500(request, *args):
    return render(request, 'page_ap/500.html')