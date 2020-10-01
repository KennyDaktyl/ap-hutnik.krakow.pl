from django import forms
from django.contrib.auth.models import User
from page_ap.models import Profile, Teams, PLAYER_POSITIONS, EMPLOYE_POSITIONS, YearBook, Post, BaseBuildings, Trainings
from page_ap.models import Images
from crispy_forms.helper import FormHelper
from django.utils.timezone import timezone
from django.conf import settings
from captcha.fields import ReCaptchaField
from tinymce.widgets import TinyMCE
from datetime import datetime
import os
import calendar

from string import Template
from django.utils.safestring import mark_safe

# DAYS = list(calendar.day_name)


class LoginForm(forms.Form):
    username = forms.CharField()
    password = forms.CharField(widget=forms.PasswordInput)


class PlayerRegistrationForm(forms.ModelForm):
    helper = FormHelper()
    # helper.form_show_labels = False

    team = forms.ModelChoiceField(label="Wybierz drużynę",
                                  queryset=Teams.objects.filter(archive=False),
                                  required=True,
                                  help_text='*')
    position = forms.ChoiceField(choices=PLAYER_POSITIONS,
                                 label="Pozycja zawodnika",
                                 widget=forms.Select(),
                                 required=True,
                                 help_text='*')
    date_of_birth = forms.DateField(
        label="Data urodzenia",
        widget=forms.SelectDateWidget(years=range(1950, (datetime.now().year) +
                                                  1)))
    password = forms.CharField(label='Hasło',
                               widget=forms.PasswordInput,
                               max_length=12)
    password2 = forms.CharField(label='Powtórz hasło',
                                widget=forms.PasswordInput,
                                max_length=12)
    phone_number = forms.CharField(label='Telefon kontaktowy',
                                   required=True,
                                   help_text='*',
                                   max_length=12)
    rodo = forms.BooleanField(
        label='Zgoda na wyświetlanie danych osobowych',
        required=False,
    )

    captcha = ReCaptchaField(required=True)

    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'email')

    def clean_password2(self):
        cd = self.cleaned_data
        if cd['password'] != cd['password2']:
            raise forms.ValidationError('Hasła nie są identyczne.')
        return cd['password2']


class RegistrationEmployeForm(forms.ModelForm):
    password = forms.CharField(label='Hasło',
                               widget=forms.PasswordInput,
                               max_length=12)
    employe_position = forms.ChoiceField(choices=EMPLOYE_POSITIONS,
                                         label="Status pracownika akademii",
                                         widget=forms.Select(),
                                         required=True,
                                         help_text='*')
    date_of_birth = forms.DateField(
        label="Data urodzenia",
        widget=forms.SelectDateWidget(years=range(1950, (datetime.now().year) +
                                                  1)))

    password2 = forms.CharField(label='Powtórz hasło',
                                widget=forms.PasswordInput,
                                max_length=12)
    phone_number = forms.CharField(label='Telefon kontaktowy',
                                   required=True,
                                   help_text='*',
                                   max_length=12)
    hidden_password = forms.CharField(label='Wpisz tajne hasło',
                                      widget=forms.PasswordInput())
    captcha = ReCaptchaField(required=True)

    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'email')

    def clean_password2(self):
        cd = self.cleaned_data
        if cd['password'] != cd['password2']:
            raise forms.ValidationError('Hasła nie są identyczne.')
        return cd['password2']

    def clean_hidden_password(self):
        cd = self.cleaned_data
        if cd['hidden_password'] != os.environ.get('HIDDEN_PASSWORD'):
            raise forms.ValidationError('Hasło nie jest poprawne.')
        return cd['hidden_password']


class ProfileEditForm(forms.Form):
    is_player = forms.BooleanField(label="Czy jesteś czynnym zawodnikiem?")
    team_name = forms.CharField(label="Aktualnie zawodnikiem w ...",
                                max_length=32,
                                required=False)
    date_of_birth = forms.DateField(label="Data urodzenia",
                                    widget=forms.SelectDateWidget)
    certyficate = forms.CharField(label='Certyfikaty zawodowe- opis',
                                  required=True,
                                  help_text='*',
                                  max_length=128)
    phone_number = forms.CharField(label='Telefon kontaktowy',
                                   required=True,
                                   help_text='*',
                                   min_length=9,
                                   max_length=12)
    # text = forms.CharField(label="Krótki opis kariery lub motto",
    #                        widget=TinyMCE(attrs={
    #                            'cols': 80,
    #                            'rows': 30
    #                        }))
    text = forms.CharField(label="Krótki opis kariery lub motto",
                           widget=forms.Textarea(attrs={
                               "rows": 15,
                               "cols": 160
                           }),
                           max_length=256)

    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'email')
        widgets = {
            'date_of_birth': forms.SelectDateWidget(),
            'team_name': forms.Textarea(attrs={
                'cols': 80,
                'rows': 20
            })
        }


class ProfileEmployeUpdateForm(forms.ModelForm):
    class Meta:
        model = Profile
        fields = (
            'photo',
            'employe_position',
            'is_player',
            'team_name',
            'date_of_birth',
            'phone_number',
            'certyficate',
            'text',
        )
        widgets = {
            'date_of_birth':
            forms.SelectDateWidget(years=range(1950, (datetime.now().year) +
                                               1))
        }


class ProfilePlayerUpdateForm(forms.ModelForm):
    class Meta:
        model = Profile
        fields = (
            'photo',
            'team',
            'date_of_start',
            'position',
            'is_pupil',
            'from_team',
            'date_of_birth',
            'phone_number',
            'text',
        )
        widgets = {
            'date_of_birth':
            forms.SelectDateWidget(years=range(1950, (datetime.now().year) +
                                               1)),
            'date_of_start':
            forms.SelectDateWidget(years=range(1950, (datetime.now().year) +
                                               1))
        }
