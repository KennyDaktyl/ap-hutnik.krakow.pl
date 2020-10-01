"""ap_hutnik URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.conf.urls import url
from django.views.generic import TemplateView
from django.conf import settings
from django.conf.urls.static import static
from page_ap.views import CookiesView, error404, error500
from django.conf.urls import handler404, handler500

urlpatterns = [
    path('admin/', admin.site.urls),
    path('konto/', include('account.urls')),
    path('', include('page_ap.urls')),
    path('tinymce/', include('tinymce.urls')),
    path('polityka_cookies/', CookiesView.as_view(), name='cookies'),
    url(
        r'^robots\.txt$',
        TemplateView.as_view(template_name="page_ap/robots.txt",
                             content_type='text/plain')),

    # path('social-auth/', include('social_django.urls', namespace='social')),
    # path('images/', include('images.urls', namespace='images')),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL,
                          document_root=settings.MEDIA_ROOT)

handler404 = error404
handler500 = error500
# handler403 = 'page_ap.views.my_custom_permission_denied_view'
# handler400 = 'page_ap.views.my_custom_bad_request_view'