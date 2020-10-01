# Generated by Django 3.0.6 on 2020-05-28 13:35

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='BaseBuildings',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('size', models.CharField(blank=True, max_length=50, null=True)),
                ('photo', models.ImageField(blank=True, upload_to='buildings/%Y/%m/%d')),
                ('status', models.IntegerField(blank=True, choices=[(0, 'Boisko'), (1, 'Boisko sztuczne'), (2, 'Boisko dzielone'), (3, 'Salka'), (4, 'Szatnia'), (5, 'Stadion główny'), (6, 'Hala')], null=True, verbose_name='Status obiektu')),
                ('slug', models.SlugField(blank=True, max_length=32, null=True, verbose_name='Slug')),
            ],
            options={
                'verbose_name_plural': 'Główne obiekty',
                'ordering': ('name',),
            },
        ),
        migrations.CreateModel(
            name='Profile',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('role', models.IntegerField(choices=[(0, 'Piłkarz'), (1, 'Pracownik akademii'), (2, 'Administrator')], verbose_name='Status osoby')),
                ('date_of_birth', models.DateField(blank=True, null=True, verbose_name='Data urodzenia (01.01.1950)')),
                ('photo', models.ImageField(blank=True, upload_to='users/%Y/%m/%d')),
                ('slug', models.SlugField(blank=True, max_length=64, null=True, verbose_name='Slug')),
                ('is_player', models.BooleanField(blank=True, null=True, verbose_name='Czy jest czynnym zawodnikiem?')),
                ('is_pupil', models.BooleanField(blank=True, null=True, verbose_name='Czy jest wychowankiem?')),
                ('from_team', models.CharField(blank=True, max_length=32, null=True, verbose_name='Poprzedni klub')),
                ('date_of_start', models.DateField(blank=True, null=True, verbose_name='Data rozpoczęcia szkolenia w akademii')),
                ('team_name', models.CharField(blank=True, max_length=32, null=True, verbose_name='Aktualnie zawodnikiem w ...')),
                ('position', models.IntegerField(blank=True, choices=[(0, 'Bramkarz'), (1, 'Obrońca'), (2, 'Pomocnik'), (3, 'Napastnik')], null=True, verbose_name='Pozycja zawodnika')),
                ('employe_position', models.IntegerField(blank=True, choices=[(0, 'Kierownik drużyny'), (1, 'Trener'), (2, 'II Trener'), (3, 'Trener bramkarzy'), (4, 'Trener przygotowania fizycznego'), (5, 'Masażysta'), (6, 'Pracownik administracyjny')], null=True, verbose_name='Tytuł pracownika akademii')),
                ('certyficate', models.CharField(blank=True, max_length=128, null=True, verbose_name='Certyfikaty')),
                ('phone_number', models.CharField(blank=True, max_length=12, null=True, verbose_name='Numer telefonu')),
                ('text', models.TextField(blank=True, null=True, verbose_name='Kariera')),
            ],
            options={
                'verbose_name_plural': 'Profile użytkowników',
                'ordering': ('user',),
            },
        ),
        migrations.CreateModel(
            name='YearBook',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=4, verbose_name='Rocznik np: 2008')),
                ('slug', models.SlugField(blank=True, max_length=32, null=True, verbose_name='Slug')),
            ],
            options={
                'verbose_name_plural': 'Roczniki',
                'ordering': ('title',),
            },
        ),
        migrations.CreateModel(
            name='Teams',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=32, verbose_name='Nazwa drużyny')),
                ('photo', models.ImageField(blank=True, upload_to='teams/%Y/%m/%d')),
                ('archive', models.BooleanField(default=False, verbose_name='Drużuna archiwalna?')),
                ('slug', models.SlugField(blank=True, max_length=32, null=True, verbose_name='Slug')),
                ('coach', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='page_ap.Profile')),
                ('yearbook', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='page_ap.YearBook', verbose_name='Rocznik drużyny')),
            ],
            options={
                'verbose_name_plural': 'Drużyny',
                'ordering': ('yearbook', 'name'),
            },
        ),
        migrations.AddField(
            model_name='profile',
            name='team',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='page_ap.Teams', verbose_name='Drużyna'),
        ),
        migrations.AddField(
            model_name='profile',
            name='user',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
        migrations.CreateModel(
            name='Post',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=250, verbose_name='Tytuł posta')),
                ('photo', models.ImageField(blank=True, upload_to='news/%Y/%m/%d', verbose_name='Zdjęcie główne')),
                ('slug', models.SlugField(blank=True, max_length=250, null=True, unique_for_date='publish')),
                ('body', models.TextField(verbose_name='Treść posta')),
                ('publish', models.DateTimeField(default=django.utils.timezone.now)),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('updated', models.DateTimeField(auto_now=True)),
                ('status', models.CharField(choices=[('draft', 'Draft'), ('published', 'Published')], default='draft', max_length=10)),
                ('author', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='blog_posts', to=settings.AUTH_USER_MODEL)),
                ('team', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='team_posts', to='page_ap.Teams', verbose_name='Nazwa drużyny')),
            ],
            options={
                'ordering': ('-publish',),
            },
        ),
        migrations.CreateModel(
            name='BaseObjects',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('size', models.CharField(max_length=50)),
                ('photo', models.ImageField(blank=True, upload_to='baseobjects/%Y/%m/%d')),
                ('status', models.IntegerField(blank=True, choices=[(0, 'Boisko'), (1, 'Boisko sztuczne'), (2, 'Boisko dzielone'), (3, 'Salka'), (4, 'Szatnia'), (5, 'Stadion główny'), (6, 'Hala')], null=True, verbose_name='Status obiektu')),
                ('slug', models.SlugField(blank=True, max_length=32, null=True, verbose_name='Slug')),
                ('main_object', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='page_ap.BaseBuildings', verbose_name='Główny obiekt')),
            ],
            options={
                'verbose_name_plural': 'Sale i boiska',
                'ordering': ('name',),
            },
        ),
    ]
