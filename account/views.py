from django.http import HttpResponse
from django.template.response import TemplateResponse
from django.views import View
from django.views.generic.edit \
    import CreateView, UpdateView, DeleteView
from django.urls import reverse_lazy
from django.shortcuts import render
from django.contrib.auth import login, logout, authenticate
from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import PermissionRequiredMixin, LoginRequiredMixin
# from .forms import LoginForm, UserRegistrationForm, UserEditForm, ProfileEditForm
# from .models import Profile
from django.contrib import messages
from django.shortcuts import get_object_or_404, redirect
from django.contrib.auth.models import User, Group
from calendar import HTMLCalendar
import datetime
from django.utils.dates import WEEKDAYS, WEEKDAYS_ABBR
from account.forms import PlayerRegistrationForm, RegistrationEmployeForm
from page_ap.models import Profile
from django.utils.text import slugify

from django.contrib.auth import views
from django.shortcuts import render, redirect
from django.contrib.sites.shortcuts import get_current_site
from django.utils.encoding import force_bytes, force_text
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.template.loader import render_to_string
from account.tokens import account_activation_token
from django.core.mail import EmailMessage
import six
from django.contrib.auth.models import Group


# Create your views here.
class MainView(View):
    pass


class RegisterPlayerView(View):
    def get(self, request):
        form = PlayerRegistrationForm()
        ctx = {'form': form}
        return render(request, 'account/register_player.html', ctx)

    def post(self, request):
        form = PlayerRegistrationForm(request.POST)
        group = Group.objects.get(name='Piłkarze')

        if form.is_valid():
            new_user = form.save(commit=False)
            new_user.set_password(form.cleaned_data['password'])
            new_user.is_active = False
            new_user.save()
            group.user_set.add(new_user)
            current_site = get_current_site(request)
            mail_subject = 'Aktywacja konta w Akademii Piłkarskiej Hutnika Kraków.'
            message = render_to_string(
                'account/acc_active_email.html',
                {
                    'user': new_user,
                    'domain': current_site.domain,
                    'uid': urlsafe_base64_encode(force_bytes(new_user.id)),
                    # 'uid': form.cleaned_data['username'],
                    'token': account_activation_token.make_token(new_user),
                })
            to_email = form.cleaned_data.get('email')
            message = strip_tags(message)
            email = EmailMessage(mail_subject, message, to=[to_email])
            email.send()
            my_profile = Profile()
            my_profile.user = new_user
            my_profile.role = 0
            my_profile.date_of_birth = form.cleaned_data['date_of_birth']
            my_profile.phone_number = form.cleaned_data['phone_number']
            my_profile.team = form.cleaned_data['team']
            my_profile.position = form.cleaned_data['position']
            my_profile.slug = slugify(new_user.first_name + "-" +
                                      new_user.last_name)
            my_profile.rodo = form.cleaned_data['rodo']
            my_profile.save()
            return render(request,
                          "registration/activate_send.html",
                          context={
                              'user': new_user,
                          })
        else:
            PlayerRegistrationForm()
            messages.error(request,
                           'Wystąpił błąd podczas rejestracji użytkownika.')
            return render(request,
                          "account/register_player.html",
                          context={
                              'form': form,
                          })


class RegisterView(View):
    def get(self, request):
        return render(request, 'account/choice_register.html')


from django.utils.html import strip_tags


class RegisterEmployeView(View):
    def get(self, request):
        form = RegistrationEmployeForm()
        ctx = {'form': form}
        return render(request, 'account/register_employe.html', ctx)

    def post(self, request):
        form = RegistrationEmployeForm(request.POST)
        group = Group.objects.get(name='Pracownicy')
        if form.is_valid():
            new_user = form.save(commit=False)
            new_user.set_password(form.cleaned_data['password'])
            new_user.is_active = False
            new_user.is_staff = True
            new_user.save()
            group.user_set.add(new_user)
            current_site = get_current_site(request)
            mail_subject = 'Aktywacja konta w Akademii Piłkarskiej Hutnika Kraków.'
            message = render_to_string(
                'account/acc_active_email.html',
                {
                    'user': new_user,
                    'domain': current_site.domain,
                    'uid': urlsafe_base64_encode(force_bytes(new_user.id)),
                    # 'uid': form.cleaned_data['username'],
                    'token': account_activation_token.make_token(new_user),
                })
            message = strip_tags(message)
            to_email = form.cleaned_data.get('email')
            email = EmailMessage(mail_subject, message, to=[to_email])
            email.send()
            my_profile = Profile()
            my_profile.user = new_user
            my_profile.role = 1
            my_profile.date_of_birth = form.cleaned_data['date_of_birth']
            my_profile.phone_number = form.cleaned_data['phone_number']
            my_profile.employe_position = form.cleaned_data['employe_position']
            my_profile.slug = slugify(new_user.first_name + "-" +
                                      new_user.last_name)
            my_profile.save()
            return render(request,
                          "registration/activate_send.html",
                          context={
                              'user': new_user,
                          })

        else:
            messages.error(request,
                           'Wystąpił błąd podczas rejestracji użytkownika.')
            return render(request,
                          "account/register_employe.html",
                          context={
                              'form': form,
                          })


class EditUser(View):
    pass


class Activate(View):
    def get(self, request, uidb64, token):
        try:
            uid = force_text(urlsafe_base64_decode(uidb64))
            user = User.objects.get(pk=uid)
        except (TypeError, ValueError, OverflowError, User.DoesNotExist):
            user = None
        if user is not None and account_activation_token.check_token(
                user, token):
            user.is_active = True
            user.save()
            login(request, user)
            # return redirect('home')
            return render(request,
                          "registration/activate_done.html",
                          context={
                              'user': user,
                          })

            return HttpResponse(
                'Dziękujemy za potwierdzenie twoje konta email. Teraz możesz zalogować się do Akademii'
            )
        else:
            return render(request,
                          "registration/activate_failed.html",
                          context={
                              'user': user,
                          })
            return HttpResponse('Aktywacyjny link jest wadliwy!')


from django.shortcuts import render
from django.template import RequestContext
from django.template import Context, loader


def error404(request, *args, **argv):
    response = render('page_ap/404.html', {},
                      context_instance=RequestContext(request))
    response.status_code = 404
    return response


def error500(request, *args, **argv):
    response = render('page_sp/500.html', {},
                      context_instance=RequestContext(request))
    response.status_code = 500
    return response