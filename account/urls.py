from django.urls import path, include
from django.contrib.auth import views as auth_views
from account.views import *
from django.conf import settings
from django.conf.urls.static import static
from django.conf.urls import url

urlpatterns = [
    # previous login view
    # path('login/', views.user_login, name='login'),
    path('login/', auth_views.LoginView.as_view(), name='login'),
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),
    # path('', MainView.as_view(), name='main'),
    # change password urls
    path('password_change/',
         auth_views.PasswordChangeView.as_view(),
         name='password_change'),
    path('password_change/done/',
         auth_views.PasswordChangeDoneView.as_view(),
         name='password_change_done'),
    # reset password urls
    path('password_reset/',
         auth_views.PasswordResetView.as_view(),
         name='password_reset'),
    path('password_reset/done/',
         auth_views.PasswordResetDoneView.as_view(),
         name='password_reset_done'),
    path('reset/<uidb64>/<token>/',
         auth_views.PasswordResetConfirmView.as_view(),
         name='password_reset_confirm'),
    path('reset/done/',
         auth_views.PasswordResetCompleteView.as_view(),
         name='password_reset_complete'),
    # alternative way to include authentication views
    # path('', include('django.contrib.auth.urls')),
    path('rejestracja', RegisterView.as_view(), name='register'),
    path('rejestracja_zawodnika/',
         RegisterPlayerView.as_view(),
         name='register_player'),
    path('rejestracja_pracownika/',
         RegisterEmployeView.as_view(),
         name='register_employe'),
    path('activate/<slug:uidb64>/<slug:token>/',
         Activate.as_view(),
         name='activate'),
    #     path('register/', Register.as_view(), name='register'),
    path('edit/', EditUser.as_view(), name='edit'),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL,
                          document_root=settings.MEDIA_ROOT)
