# Generated by Django 3.0.6 on 2020-12-16 20:24

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Coach',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('last_name', models.CharField(max_length=64, verbose_name='Nazwisko')),
            ],
        ),
        migrations.CreateModel(
            name='Members',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('year', models.CharField(max_length=4, verbose_name='Rocznik np: 2008')),
                ('first_name', models.CharField(max_length=32, verbose_name='Imię')),
                ('last_name', models.CharField(max_length=64, verbose_name='Nazwisko')),
                ('declaration', models.BooleanField(blank=True, default=False, null=True, verbose_name='Czy jest deklaracja?')),
                ('declaration_date', models.DateField(verbose_name='Data złażenia deklaracji')),
                ('medical_exam', models.DateField(verbose_name='Badania lekarskie')),
                ('address', models.CharField(max_length=128, verbose_name='Adres')),
                ('pesel', models.CharField(max_length=12, verbose_name='Pesel')),
                ('born_date', models.DateField(verbose_name='Data urodzenia')),
                ('parent_name', models.CharField(max_length=64, verbose_name='Opiekun')),
                ('phone_number', models.CharField(max_length=32, verbose_name='Kontakt telefoniczny')),
                ('email', models.EmailField(max_length=254, verbose_name='Emial')),
                ('info', models.CharField(max_length=128, verbose_name='Info')),
                ('coach', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='administration.Coach')),
            ],
        ),
    ]