# Generated by Django 3.0.6 on 2020-06-15 13:08

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('page_ap', '0023_trainings_day_time'),
    ]

    operations = [
        migrations.RenameField(
            model_name='trainings',
            old_name='data_end',
            new_name='date_end',
        ),
        migrations.RenameField(
            model_name='trainings',
            old_name='data_start',
            new_name='date_start',
        ),
    ]
