import string
from django.conf import settings
# from django.contrib.auth.models import User
from django.utils.crypto import get_random_string
from celery import shared_task
from django.core.mail import send_mass_mail, send_mail, EmailMultiAlternatives
from django.core import mail


@shared_task
def send_email_task(emails, subject, message):
    emails_address = emails
    subject = subject
    message = message
    emails_tab = []
    for em in emails_address:
        emails = EmailMultiAlternatives(subject, message,
                                        'miktelgsm@miktelgsm.pl', [
                                            em,
                                        ])
        # emails.attach_file(
        #     '/home/kenny/Pulpit/AP-Hutnik.krakow.pl/ap_hutnik/media/images/2.jpg'
        # )
        emails.send()
    return None


@shared_task
def send_email_task_file(emails, subject, message, file_str):
    emails_address = emails
    subject = subject
    message = message
    emails_tab = []
    for em in emails_address:
        emails = EmailMultiAlternatives(subject, message,
                                        'miktelgsm@miktelgsm.pl', [
                                            em,
                                        ])
        emails.attach_file(
            '/home/kenny/Pulpit/AP-Hutnik.krakow.pl/ap_hutnik/media/' +
            str(file_str))
        emails.send()
    return None
