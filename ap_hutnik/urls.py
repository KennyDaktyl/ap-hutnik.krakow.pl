from django.contrib import admin
from django.urls import path, include
from django.conf.urls import url
from django.views.generic import TemplateView
from django.conf import settings
from django.conf.urls.static import static
from page_ap.views import error404, error500, CookiesView
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
