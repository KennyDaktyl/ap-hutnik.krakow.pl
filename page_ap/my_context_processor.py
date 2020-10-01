from page_ap.models import Images
from .models import YearBook, Teams, Profile, User, Sponsors, Post
from django.conf import settings
import redis
r = redis.StrictRedis(host=settings.REDIS_HOST,
                      port=settings.REDIS_PORT,
                      db=settings.REDIS_DB)
import os
from datetime import datetime


def cookielaw(request):
    cookielaw = request.COOKIES.get('cookielaw_accepted')
    return {'cookielaw': cookielaw}


def values(request):
    e = r.get('page')
    s = str(e)
    s = s.replace("b'", "")
    s = s.replace("'", "")
    c = Profile.objects.all().count()
    app_id = os.environ.get('APP_ID')

    dt = datetime.now().date()
    dt_views = r.get(str(dt))
    dt_views = str(dt_views)
    dt_views = dt_views.replace("b'", "")
    dt_views = dt_views.replace("'", "")
    ctx = {
        "e": s,
        "c": c,
        "dt_views": dt_views,
        'app_id': app_id,
        "logo": logo,
        "version": "1.0",
    }
    return ctx


def logo(request):
    try:
        logo = Images.objects.get(pk=1)
    except:
        logo = None
    ctx = {
        "logo": logo,
        "version": "1.0",
    }
    return ctx


def teams(request):
    years = YearBook.objects.filter(archive=False)
    ctx = {
        "years": years,
        "version": "1.0",
    }
    return ctx


def profile(request):
    profile = Profile.objects.filter(user=request.user)
    ctx = {
        "profile": profile,
        "version": "1.0",
    }
    return ctx


def sponsors(request):
    main_sp = Sponsors.objects.filter(role=0)
    patrons = Sponsors.objects.filter(role=1)
    media_partners = Sponsors.objects.filter(role=2)
    partners = Sponsors.objects.filter(role=3)

    ctx = {
        "main_sp": main_sp,
        "patrons": patrons,
        "media_partners": media_partners,
        "partners": partners,
        "version": "1.0",
    }
    return ctx


def last_posts(request):
    news = Post.objects.all().order_by('-publish')
    last_posts = news[0:4]
    ctx = {
        "last_posts": last_posts,
    }
    return ctx


# from django import template

# register = template.Library()

# @register.simple_tag(takes_context=True)
# def query_transform(context, **kwargs):
#     query = context['request'].GET.copy()
#     for k, v in kwargs.items():
#         query[k] = v
#     return query.urlencode()
