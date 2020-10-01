from django.db import models
from django.utils.text import slugify
from django.urls import reverse
from django.conf import settings
from django.contrib.auth.models import User
from django.utils import timezone
from tinymce.models import HTMLField
# from images.models import Images
from django.forms.widgets import SelectDateWidget
from django import forms

from PIL import Image
from io import StringIO

from PIL import Image
from io import BytesIO
from django.core.files.uploadedfile import InMemoryUploadedFile
import sys
from django_resized import ResizedImageField

from django.core.exceptions import ValidationError


def file_size(value):
    limit = 3 * 1024 * 1024
    if value.size > limit:
        raise ValidationError(
            'Plik który chcesz wrzucić jest większy niż 3MB.')


USER_STATUS = ((0, "Piłkarz"), (1, "Pracownik akademii"), (2, "Administrator"))
USER_STATUS = sorted(USER_STATUS)

OBJECT_STATUS = ((0, "Boisko"), (1, "Boisko sztuczne"), (2, "Boisko dzielone"),
                 (3, "Salka"), (4, "Szatnia"), (5, "Stadion główny"), (6,
                                                                       "Hala"))
OBJECT_STATUS = sorted(OBJECT_STATUS)

PLAYER_POSITIONS = (
    (0, "Bramkarz"),
    (1, "Obrońca"),
    (2, "Pomocnik"),
    (3, "Napastnik"),
)
PLAYER_POSITIONS = sorted(PLAYER_POSITIONS)

EMPLOYE_POSITIONS = ((1, "Trener"), (2, "II Trener"), (3, "Trener bramkarzy"),
                     (4, "Trener przygotowania fizycznego"),
                     (5, "Kierownik drużyny"), (6, "Masażysta"),
                     (7, "Pracownik administracyjny"),
                     (8, "Prezez Akademii Piłarskiej"),
                     (9, "Skarbnik Akademii Piłarskiej"))
EMPLOYE_POSITIONS = sorted(EMPLOYE_POSITIONS)

SPONSOR_STATUS = ((0, "Główny"), (1, "Patron"), (2, "Partner medialny"),
                  (3, "Partner"))
SPONSOR_STATUS = sorted(SPONSOR_STATUS)


class Profile(models.Model):
    user = models.OneToOneField(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
    )
    role = models.IntegerField(
        verbose_name="Status osoby",
        choices=USER_STATUS,
    )
    team = models.ForeignKey("Teams",
                             verbose_name="Drużyna",
                             on_delete=models.CASCADE,
                             db_index=True,
                             blank=True,
                             null=True)
    date_of_birth = models.DateField(
        verbose_name="Data urodzenia (01.01.1950)", blank=True, null=True)
    # photo = models.ImageField(upload_to='users/%Y/%m/%d', blank=True)
    photo = ResizedImageField(size=[960, 1280],
                              upload_to='users/%Y/%m/%d',
                              blank=True,
                              validators=[file_size])
    slug = models.SlugField(verbose_name="Slug",
                            blank=True,
                            null=True,
                            max_length=64)
    is_player = models.BooleanField(
        verbose_name="Czy jest czynnym zawodnikiem?", blank=True, null=True)
    is_pupil = models.BooleanField(verbose_name="Czy jest wychowankiem?",
                                   blank=True,
                                   null=True)
    from_team = models.CharField(
        verbose_name="Poprzedni klub",
        max_length=32,
        blank=True,
        null=True,
    )
    date_of_start = models.DateField(
        verbose_name="Data rozpoczęcia szkolenia w akademii",
        blank=True,
        null=True)
    team_name = models.CharField(
        verbose_name="Aktualnie zawodnikiem w ...",
        max_length=32,
        blank=True,
        null=True,
    )
    position = models.IntegerField(verbose_name="Pozycja zawodnika",
                                   choices=PLAYER_POSITIONS,
                                   null=True,
                                   blank=True)
    employe_position = models.IntegerField(
        verbose_name="Tytuł pracownika akademii",
        choices=EMPLOYE_POSITIONS,
        null=True,
        blank=True)
    certyficate = models.CharField(
        verbose_name="Certyfikaty",
        max_length=128,
        blank=True,
        null=True,
    )
    phone_number = models.CharField(
        verbose_name="Numer telefonu",
        max_length=12,
        blank=True,
        null=True,
    )

    text = models.TextField(
        verbose_name="Kariera",
        blank=True,
        null=True,
    )

    is_activated = models.BooleanField(
        verbose_name="Czy jest aktywowany przez trenera?", default=False)

    rodo = models.BooleanField(
        verbose_name="Zgoda na wyświetlanie danych osobowych", default=False)

    def get_absolute_url(self):
        return reverse("profile", kwargs={
            "pk": self.id,
        })

    def teams(self):
        teams = Teams.objects.filter(coach=self).filter(archive=False)
        if teams:
            return teams

    def no_image(self):
        no_image = Images.objects.filter(no_image=True).first()
        return no_image

    def save(self, *args, **kwargs):
        if self.role != None:
            if self.rodo:
                self.slug = slugify(self.user.first_name + "-" +
                                    self.user.last_name)
            else:
                self.slug = slugify(self.user.first_name + "-" +
                                    self.user.last_name[0])

        if self.photo:
            im = Image.open(self.photo)
            output = BytesIO()
            im.save(output, format='WEBP', quality=80)
            output.seek(0)
            self.photo = InMemoryUploadedFile(
                output, 'ImageField',
                "%s.webp" % self.photo.name.split('.')[0], 'image/webp',
                sys.getsizeof(output), None)
        super(Profile, self).save()

    class Meta:
        ordering = (
            'employe_position',
            'user__last_name',
        )
        verbose_name_plural = "Profile użytkowników"

    def __str__(self):
        return self.user.first_name + " " + self.user.last_name + " " + str(
            self.get_employe_position_display())


class YearBook(models.Model):
    title = models.CharField(verbose_name="Rocznik np: 2008", max_length=4)
    archive = models.BooleanField(verbose_name="Czy rocznik jest archiwalny?",
                                  blank=True,
                                  null=True,
                                  default=False)
    slug = models.SlugField(verbose_name="Slug",
                            blank=True,
                            null=True,
                            max_length=32)

    def teams(self):
        teams = Teams.objects.filter(yearbook=self).filter(archive=False)
        return teams

    class Meta:
        ordering = ("title", )
        verbose_name_plural = "Roczniki"

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        super(YearBook, self).save()

    def __str__(self):
        return self.title


class Teams(models.Model):
    name = models.CharField(verbose_name="Nazwa drużyny", max_length=32)
    yearbook = models.ForeignKey("YearBook",
                                 verbose_name="Rocznik drużyny",
                                 on_delete=models.CASCADE,
                                 db_index=True)
    coach = models.ForeignKey(
        "Profile",
        on_delete=models.CASCADE,
        db_index=True,
    )
    team_persons = models.ManyToManyField(
        Profile,
        verbose_name="Sztab drużyny",
        related_name="team_persons",
        blank=True,
    )
    photo = models.ImageField(upload_to='teams/%Y/%m/%d',
                              blank=True,
                              validators=[file_size])
    archive = models.BooleanField(verbose_name="Drużuna archiwalna?",
                                  default=False)
    slug = models.SlugField(verbose_name="Slug",
                            blank=True,
                            null=True,
                            max_length=32)

    class Meta:
        ordering = (
            "yearbook",
            "name",
        )
        verbose_name_plural = "Drużyny"

    def save(self, *args, **kwargs):
        self.slug = slugify(self.yearbook.title + "-" + self.name)
        super(Teams, self).save()

    def players(self):
        players = Profile.objects.filter(team=self).filter(
            user__is_active=True)
        return players

    def goalkippers(self):
        players = Profile.objects.filter(team=self).filter(
            position="0").filter(user__is_active=True).filter(
                is_activated=True)
        return players

    def defenders(self):
        players = Profile.objects.filter(team=self).filter(
            position="1").filter(user__is_active=True).filter(
                is_activated=True)
        return players

    def middfields(self):
        players = Profile.objects.filter(team=self).filter(
            position="2").filter(user__is_active=True).filter(
                is_activated=True)
        return players

    def attacks(self):
        players = Profile.objects.filter(team=self).filter(
            position="3").filter(user__is_active=True).filter(
                is_activated=True)
        return players

    def no_image(self):
        no_image = Images.objects.filter(no_image=True).first()
        return no_image

    def trainings(self):
        trainings = Trainings.objects.filter(team=self)
        return trainings

    def get_absolute_url(self):
        return reverse("team_details",
                       kwargs={
                           "slug": self.slug,
                           "pk": self.id,
                       })

    def __str__(self):
        return self.yearbook.title + "-" + self.name


class PublishedManager(models.Manager):
    def get_queryset(self):
        return super(PublishedManager,
                     self).get_queryset().filter(status='published')


class Post(models.Model):
    STATUS_CHOICES = (
        ('draft', 'Draft'),
        ('published', 'Published'),
    )
    title = models.CharField(verbose_name="Tytuł posta", max_length=250)
    photo = ResizedImageField(verbose_name="Zdjęcie główne",
                              size=[1280, 960],
                              upload_to='images/posts/',
                              validators=[file_size])
    slug = models.SlugField(max_length=250,
                            unique_for_date='publish',
                            blank=True,
                            null=True)
    author = models.ForeignKey(User,
                               on_delete=models.CASCADE,
                               related_name='blog_posts')
    team = models.ForeignKey(Teams,
                             verbose_name="Nazwa drużyny",
                             on_delete=models.CASCADE,
                             related_name='team_posts',
                             blank=True,
                             null=True)
    # body = HTMLField()
    body = models.TextField(verbose_name="Treść posta")
    publish = models.DateTimeField(default=timezone.now)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    status = models.CharField(max_length=10,
                              choices=STATUS_CHOICES,
                              default='draft')
    objects = models.Manager()  # manager domy�lny.
    published = PublishedManager()  # W�asny mened�er.

    class Meta:
        ordering = ('-publish', )
        verbose_name_plural = "Artykuły"

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        if self.photo:
            im = Image.open(self.photo)
            output = BytesIO()
            im.save(output, format='WEBP', quality=80)
            output.seek(0)
            self.photo = InMemoryUploadedFile(
                output, 'ImageField',
                "%s.webp" % self.photo.name.split('.')[0], 'image/webp',
                sys.getsizeof(output), None)
        super(Post, self).save()

    def no_image(self):
        no_image = Images.objects.filter(no_image=True).first()
        return no_image

    def get_absolute_url(self):
        return reverse("post_details",
                       kwargs={
                           "slug": self.slug,
                           "pk": self.id,
                       })

    def __str__(self):
        return str(self.title)


class BaseBuildings(models.Model):
    name = models.CharField(max_length=50)
    size = models.CharField(max_length=50, null=True, blank=True)
    photo = models.ImageField(upload_to='buildings/%Y/%m/%d',
                              blank=True,
                              validators=[file_size])
    status = models.IntegerField(verbose_name="Status obiektu",
                                 choices=OBJECT_STATUS,
                                 null=True,
                                 blank=True)
    slug = models.SlugField(verbose_name="Slug",
                            blank=True,
                            null=True,
                            max_length=32)

    class Meta:
        ordering = ("name", )
        verbose_name_plural = "Główne obiekty"

    def get_absolute_url(self):
        return reverse("building_details",
                       kwargs={
                           "slug": self.slug,
                           "pk": self.id,
                       })

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        if self.photo:
            im = Image.open(self.photo)
            output = BytesIO()
            im.save(output, format='WEBP', quality=80)
            output.seek(0)
            self.photo = InMemoryUploadedFile(
                output, 'ImageField',
                "%s.webp" % self.photo.name.split('.')[0], 'image/webp',
                sys.getsizeof(output), None)
        super(BaseBuildings, self).save()

    def __str__(self):
        return self.name + "-" + self.get_status_display()


class BaseObjects(models.Model):
    main_object = models.ForeignKey("BaseBuildings",
                                    verbose_name="Główny obiekt",
                                    on_delete=models.CASCADE,
                                    db_index=True)
    name = models.CharField(max_length=50)
    size = models.CharField(max_length=50)
    photo = models.ImageField(upload_to='baseobjects/%Y/%m/%d',
                              blank=True,
                              validators=[file_size])
    status = models.IntegerField(verbose_name="Status obiektu",
                                 choices=OBJECT_STATUS,
                                 null=True,
                                 blank=True)
    slug = models.SlugField(verbose_name="Slug",
                            blank=True,
                            null=True,
                            max_length=32)

    class Meta:
        ordering = ("name", )
        verbose_name_plural = "Sale i boiska"

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        if self.photo:
            im = Image.open(self.photo)
            output = BytesIO()
            im.save(output, format='WEBP', quality=80)
            output.seek(0)
            self.photo = InMemoryUploadedFile(
                output, 'ImageField',
                "%s.webp" % self.photo.name.split('.')[0], 'image/webp',
                sys.getsizeof(output), None)
        super(BaseObjects, self).save()

    def no_image(self):
        no_image = Images.objects.filter(no_image=True).first()
        return no_image

    def __str__(self):
        return self.name + "-" + self.size


class Images(models.Model):
    image = ResizedImageField(size=[1280, 960],
                              upload_to='images/',
                              validators=[file_size])
    team = models.ForeignKey("Teams",
                             on_delete=models.CASCADE,
                             blank=True,
                             null=True,
                             related_name='team_gallery')
    post = models.ForeignKey("Post",
                             on_delete=models.CASCADE,
                             blank=True,
                             null=True,
                             related_name='post_gallery')
    building = models.ForeignKey("BaseBuildings",
                                 on_delete=models.CASCADE,
                                 blank=True,
                                 null=True,
                                 related_name='buildings_gallery')

    no_image = models.BooleanField(default=False)

    class Meta:
        ordering = (
            '-id',
            "image",
        )
        verbose_name_plural = "Galeria"

    def save(self):
        im = Image.open(self.image)
        output = BytesIO()
        im.save(output, format='WEBP', quality=80)
        output.seek(0)
        self.image = InMemoryUploadedFile(
            output, 'ImageField', "%s.webp" % self.image.name.split('.')[0],
            'image/webp', sys.getsizeof(output), None)
        super(Images, self).save()

    def __str__(self):
        return str(self.id)


class Sponsors(models.Model):
    image = ResizedImageField(size=[1280, 960], upload_to='images/')
    role = models.IntegerField(
        verbose_name="Status sponsora",
        choices=SPONSOR_STATUS,
    )
    url = models.URLField(max_length=200, )

    class Meta:
        ordering = ("role", )
        verbose_name_plural = "Sponsorzy"

    def __str__(self):
        return str(self.image) + " " + str(self.role)


DAYS = ((1, 'Poniedziałek'), (2, 'Wtorek'), (3, 'Środa'), (4, 'Czwartek'),
        (5, 'Piątek'), (6, 'Sobota'), (7, 'Niedziela'))


class Trainings(models.Model):
    team = models.ForeignKey(Teams,
                             verbose_name="Nazwa drużyny",
                             on_delete=models.CASCADE,
                             related_name='team_trainings',
                             db_index=True)
    date_start = models.TimeField(verbose_name="Data start", )
    date_end = models.TimeField(verbose_name="Data koniec", )
    place = models.ForeignKey(
        BaseBuildings,
        verbose_name="Nazwa boiska",
        on_delete=models.CASCADE,
        related_name='training_place',
    )
    day_time = models.IntegerField(
        verbose_name="Dzień treningu",
        choices=DAYS,
    )

    def __str__(self):
        return str(self.get_day_time_display()) + " " + str(
            self.team) + " " + str(self.date_start) + " : " + str(
                self.date_end) + " - " + (self.place.name)


import uuid
import os


def user_directory_path(instance, filename):
    ext = filename.split('.')[-1]
    filename = '{}.{}'.format(uuid.uuid4().hex[:10], ext)
    return os.path.join("files", filename)


class File(models.Model):
    file = models.FileField(upload_to=user_directory_path,
                            verbose_name="Załaduj plik",
                            null=True,
                            validators=[file_size])
    title = models.CharField(max_length=40, verbose_name="Tytuł pliku")
    email = models.BooleanField(default=False)

    class Meta:
        ordering = ("title", )
        verbose_name_plural = "Pliki do pobrania"
