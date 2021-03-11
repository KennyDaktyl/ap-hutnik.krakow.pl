import os

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SECRET_KEY = os.environ.get('SECRET_KEY')
DEBUG = False
ALLOWED_HOSTS = [
    '51.75.127.94',
]

INSTALLED_APPS = [
    'account.apps.AccountConfig',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'captcha',
    'sorl.thumbnail',
    'administration',
    'page_ap',
    'crispy_forms',
    'tinymce',
    'django_webp',
    'six',
    'django_social_share',
    # 'datetimewidget',
    'django.contrib.sitemaps',
    #    'djcelery_email',
    'cookielaw',
    'webp_converter',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'django.middleware.locale.LocaleMiddleware'
]

ROOT_URLCONF = 'ap_hutnik.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'django.template.context_processors.media',
                "page_ap.my_context_processor.cookielaw",
                "page_ap.my_context_processor.logo",
                "page_ap.my_context_processor.teams",
                "page_ap.my_context_processor.sponsors",
                "page_ap.my_context_processor.values",
                "page_ap.my_context_processor.last_posts",
                'django_webp.context_processors.webp',
                'webp_converter.context_processors.webp_support',
            ],
        },
    },
]
# CRISPY_TEMPLATE_PACK = 'uni_form'
CRISPY_TEMPLATE_PACK = 'bootstrap3'

DJANGO_WYSIWYG_FLAVOR = "yui_advanced"
TINYMCE_DEFAULT_CONFIG = {
    'mode':
    "textareas",
    'theme':
    "advanced",
    'plugins':
    '''pagebreak, style, layer, table, save, advhr, advimage, advlink,
               emotions, iespell, inlinepopups, insertdatetime, preview, media, 
               searchreplace, print, contextmenu, paste, directionality, 
               fullscreen, noneditable, visualchars, nonbreaking, xhtmlxtras, 
               template, wordcount, advlist, autosave''',
    'theme_advanced_buttons1':
    '''bold, italic, underline, strikethrough, |,
                               justifyleft, justifycenter, justifyright,
                               justifyfull, fontselect, fontsizeselect,
                               fullscreen, code''',
    'theme_advanced_buttons2':
    '''bullist, numlist, |, outdent, indent,
                               blockquote, |, undo, redo, |, link, unlink, |,
                               forecolor, backcolor''',
    'theme_advanced_buttons3':
    '''tablecontrols, |, hr, sub, sup, |, charmap''',
    'theme_advanced_toolbar_location':
    "top",
    'theme_advanced_toolbar_align':
    "left",
    'theme_advanced_statusbar_location':
    "bottom",
    'theme_advanced_resizing':
    "true",
    'template_external_list_url':
    "lists/template_list.js",
    'external_link_list_url':
    "lists/link_list.js",
    'external_image_list_url':
    "lists/image_list.js",
    'media_external_list_url':
    "lists/media_list.js",
    'style_formats': [{
        'title': 'Bold text',
        'inline': 'strong'
    }, {
        'title': 'Red text',
        'inline': 'span',
        'styles': {
            'color': '#ff0000'
        }
    }, {
        'title': 'Help',
        'inline': 'strong',
        'classes': 'help'
    }, {
        'title': 'Table styles'
    }, {
        'title': 'Table row 1',
        'selector': 'tr',
        'classes': 'tablerow'
    }],
    'width':
    '100%',
    'height':
    300
}

REDIS_HOST = 'localhost'
REDIS_PORT = '6379'
REDIS_DB = 0

WSGI_APPLICATION = 'ap_hutnik.wsgi.application'

# Database
# https://docs.djangoproject.com/en/3.0/ref/settings/#databases

DATABASES = {
    "default": {
        "NAME": "aphutnik_1",
        "ENGINE": "django.db.backends.postgresql",
        "USER": os.environ.get('DB_USER'),
        "PASSWORD": os.environ.get('DB_PASSWORD'),
        "HOST": "localhost",
    }
}

# Password validation
# https://docs.djangoproject.com/en/3.0/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME':
        'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME':
        'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME':
        'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME':
        'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

# Internationalization
# https://docs.djangoproject.com/en/3.0/topics/i18n/

LANGUAGE_CODE = 'pl-PL'
TIME_ZONE = 'UTC'
USE_I18N = True
USE_L10N = True
USE_TZ = True
DATETIME_FORMAT = "d-m-Y H:M:S"
DATE_INPUT_FORMATS = ['%d-%m-%Y', '%Y-%m-%d']
TIME_ZONE = "Poland"

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.0/howto/static-files/

STATIC_URL = '/static/'

STATIC_ROOT = "static"
SITE_ROOT = os.path.dirname(os.path.realpath(__file__))
STATICFILES_DIRS = (os.path.join(SITE_ROOT, "static/"), )
MEDIA_URL = '/media/'
# MEDIA_URL = f'http://127.0.0.1:8000/static/media/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'media/')
ALLOWED_UPLOAD_IMAGES = ('webp', 'png', 'bmp', 'jpeg')

# TINYMCE_JS_URL = os.path.join(SITE_ROOT, "admin/django_tinymce/tiny_mce.js")

LOGIN_REDIRECT_URL = 'main'
LOGIN_URL = 'login'
LOGOUT_URL = 'logout'

EMAIL_USE_TLS = True
EMAIL_HOST = 'smtp.server458609.nazwa.pl'
EMAIL_HOST_USER = os.environ.get('EMAIL_USER')
EMAIL_HOST_PASSWORD = os.environ.get('EMAIL_PASSWORD')
EMAIL_PORT = 587
EMAIL_USE_TLS = True
SERVER_EMAIL = os.environ.get('EMAIL_USER')
DEFAULT_FROM_EMAIL = 'Miktel Store <miktelgsm@miktelgsm.pl>'
EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
# EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'

AUTHENTICATION_BACKENDS = (
    'django.contrib.auth.backends.ModelBackend',
    'social_core.backends.facebook.FacebookOAuth2',
)

AUTHENTICATION_BACKENDS = ('django.contrib.auth.backends.ModelBackend', )

SOCIAL_AUTH_FACEBOOK_SCOPE = ['email']
SOCIAL_AUTH_FACEBOOK_KEY = os.environ.get('SOCIAL_AUTH_FACEBOOK_KEY')
SOCIAL_AUTH_FACEBOOK_SECRET = os.environ.get('SOCIAL_AUTH_FACEBOOK_SECRET')

RECAPTCHA_PUBLIC_KEY = os.environ.get('RECAP_PUBKEY')
RECAPTCHA_PRIVATE_KEY = os.environ.get('RECAP_PRIVKEY')

TINYMCE_JS_URL = 'tinymce/tinymce.min.js'
TINYMCE_DEFAULT_CONFIG = {
    'plugins': "table,spellchecker,paste,searchreplace",
    'theme': "advanced",
    'cleanup_on_startup': True,
    'custom_undo_redo_levels': 10,
}
TINYMCE_SPELLCHECKER = True
# TINYMCE_COMPRESSOR = True
# TINYMCE_EXTRA_MEDIA = {
#     'css': {
#         'all': [...],
#     },
#     'js': [...],
# }
TINYMCE_JS_URL = os.path.join(MEDIA_URL, "tiny_mce/tiny_mce.js")
TINYMCE_JS_ROOT = os.path.join(MEDIA_ROOT, "tiny_mce")

DJANGORESIZED_DEFAULT_SIZE = [1920, 1080]
DJANGORESIZED_DEFAULT_QUALITY = 75
DJANGORESIZED_DEFAULT_KEEP_META = True
DJANGORESIZED_DEFAULT_FORCE_FORMAT = 'WEBP'
DJANGORESIZED_DEFAULT_FORMAT_EXTENSIONS = {'WEBP': ".webp"}
DJANGORESIZED_DEFAULT_NORMALIZE_ROTATION = True

# CELERY_BROKER_URL = 'amqp://kenny:Tofik123!@localhost'
CELERY_BROKER_URL = 'amqp://localhost'
CELERY_EMAIL_TASK_CONFIG = {
    'queue': 'email',
    'rate_limit': '50/m',  # * CELERY_EMAIL_CHUNK_SIZE (default: 10)
}
