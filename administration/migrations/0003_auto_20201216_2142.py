# Generated by Django 3.0.6 on 2020-12-16 20:42

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('administration', '0002_auto_20201216_2136'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='coach2',
            options={'ordering': ('last_name',), 'verbose_name_plural': 'Trenerzy'},
        ),
        migrations.AlterModelOptions(
            name='members',
            options={'ordering': ('last_name',), 'verbose_name_plural': 'Zawodnicy'},
        ),
    ]
