# Generated by Django 3.0.6 on 2020-05-28 13:57

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('page_ap', '0002_images'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='images',
            options={'ordering': ('image',), 'verbose_name_plural': 'Galeria'},
        ),
        migrations.RenameField(
            model_name='images',
            old_name='team_image',
            new_name='team',
        ),
    ]