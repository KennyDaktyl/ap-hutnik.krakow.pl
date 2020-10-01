from django import forms
from django.contrib.auth.models import User
from page_ap.models import Profile, Teams, PLAYER_POSITIONS, EMPLOYE_POSITIONS, YearBook, Post, BaseBuildings, Trainings, File
from page_ap.models import Images
from crispy_forms.helper import FormHelper
from django.utils.timezone import timezone
from django.conf import settings
from captcha.fields import ReCaptchaField
from tinymce.widgets import TinyMCE
from datetime import datetime
import os
import calendar
from django.utils.dates import MONTHS
from django.contrib.admin import widgets
from string import Template
from django.utils.safestring import mark_safe

DAYS = list(calendar.day_name)
GROUPS_EMAIL = ((0, 'Wyślij do wszyskich'),
                (1, 'Wyślij do wszyskich pracowników'),
                (2, 'Wyślij do wszyskich piłkarzy'),
                (3, 'Wyślij tylko moich piłkarzy z drużyn'))


class YearBookForm(forms.ModelForm):
    class Meta:
        model = YearBook
        fields = ('title', )

    def clean(self):
        try:
            YearBook.objects.get(title=self.cleaned_data['title'].lower())
            raise forms.ValidationError('Rocznik już istnieje')
        except YearBook.DoesNotExist:
            pass

        return self.cleaned_data


class TeamForm(forms.ModelForm):
    class Meta:
        model = Teams
        fields = ('yearbook', 'name', 'photo')

    def clean(self):
        try:
            Teams.objects.get(name=self.cleaned_data['name'].lower())
            raise forms.ValidationError('Drużyna już istnieje')
        except Teams.DoesNotExist:
            pass

        return self.cleaned_data


class PostForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(PostForm, self).__init__(*args, **kwargs)
        self.fields['team'].queryset = Teams.objects.filter(archive=False)

    class Meta:
        model = Post
        fields = (
            'title',
            'photo',
            'team',
            'body',
        )
        widgets = {
            'team': forms.Select(choices=Teams.objects.filter(archive=False)),
            # 'body': TinyMCE()
        }


class GalleryImagesForm(forms.ModelForm):
    class Meta:
        model = Images
        fields = ('image', )


class TimeInput(forms.TimeInput):
    input_type = "time"


class AddTrainingForm(forms.ModelForm):
    class Meta:
        model = Trainings
        fields = ('place', 'date_start', 'date_end', 'day_time')

        # widgets = {
        #     'team': forms.Select(choices=Teams.objects.filter(archive=False)),
        # }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields["date_start"].widget = TimeInput()
        self.fields["date_end"].widget = TimeInput()


class ContactForm(forms.Form):
    helper = FormHelper()
    # person = forms.ModelChoiceField(label="Wybierz osobę",
    #                                 queryset=Profile.objects.filter(role=1),
    #                                 required=True,
    #                                 help_text='*')
    email = forms.EmailField(
        label="Podaj swój email kontaktowy",
        widget=forms.EmailInput(),
        required=True,
    )
    subject = forms.CharField(
        label="Temat wiadomości",
        widget=forms.TextInput(),
        required=True,
    )
    message = forms.CharField(
        label="Treść wiadomości",
        widget=forms.Textarea(),
        required=True,
    )

    captcha = ReCaptchaField(required=True)


class EmailSendForm(forms.Form):
    helper = FormHelper()
    groups = forms.ChoiceField(
        label="Wybierz grupę",
        choices=GROUPS_EMAIL,
        required=True,
    )

    email = forms.EmailField(
        label="Podaj swój email kontaktowy",
        widget=forms.EmailInput(),
        required=True,
    )
    subject = forms.CharField(
        label="Temat wiadomości",
        widget=forms.TextInput(),
        required=True,
    )
    message = forms.CharField(
        label="Treść wiadomości",
        widget=forms.Textarea(),
        required=True,
    )
    file = forms.FileField(label="Dodaj załącznik",
                           widget=forms.ClearableFileInput(),
                           required=False)
    captcha = ReCaptchaField(required=True)

    def clean_file(self):
        file = self.cleaned_data['file']
        if file:
            ext = file.name.split('.')[-1].lower()
            if ext not in ["jpg", "jpeg", "png", "doc", "pdf", "xlsx"]:
                raise forms.ValidationError(
                    "Tylko jpg, jpeg, png, doc, pdf i xlsx są dozwolone.")
            return file


class ContactViewForm(forms.Form):
    helper = FormHelper()
    persons = forms.ModelChoiceField(label="Wybierz osobę",
                                     queryset=Profile.objects.filter(role=1),
                                     required=True,
                                     help_text='*')
    email = forms.EmailField(
        label="Podaj swój email kontaktowy",
        widget=forms.EmailInput(),
        required=True,
    )
    subject = forms.CharField(
        label="Temat wiadomości",
        widget=forms.TextInput(),
        required=True,
    )
    message = forms.CharField(
        label="Treść wiadomości",
        widget=forms.Textarea(),
        required=True,
    )

    captcha = ReCaptchaField(required=True)


class FileUploadModelForm(forms.ModelForm):
    class Meta:
        model = File
        fields = (
            'file',
            'title',
        )

        widgets = {
            'title': forms.TextInput(attrs={'class': 'form-control'}),
            'file': forms.ClearableFileInput(attrs={'class': 'form-control'}),
        }

    def clean_file(self):
        file = self.cleaned_data['file']
        ext = file.name.split('.')[-1].lower()
        if ext not in ["jpg", "jpeg", "png", "doc", "pdf", "xlsx"]:
            raise forms.ValidationError(
                "Tylko jpg, png, doc, pdf i xlsx są dozwolone.")
        return file