from django.contrib import admin
from .models import *

# Register your models here.


@admin.register(Images)
class Images(admin.ModelAdmin):
    list_display = ('image', 'post', 'team', 'building')
    list_filter = ('post', 'team', 'building')
    search_fields = ('post', 'team', 'building')
    # prepopulated_fields = {'slug': ('name', )}
    # raw_id_fields = ('author', )
    ordering = ('-id', )


@admin.register(Profile)
class ProfileAdmin(admin.ModelAdmin):
    list_display = ['user', 'date_of_birth', 'photo']


@admin.register(YearBook)
class YearBookAdmin(admin.ModelAdmin):
    list_display = [
        'title',
    ]


@admin.register(Teams)
class TeamsAdmin(admin.ModelAdmin):
    list_display = ['yearbook', 'name', 'photo']


@admin.register(Post)
class PostAdmin(admin.ModelAdmin):
    list_display = ('title', 'slug', 'author', 'publish', 'status')
    list_filter = ('status', 'created', 'publish', 'author')
    search_fields = ('title', 'body')
    prepopulated_fields = {'slug': ('title', )}
    raw_id_fields = ('author', )
    date_hierarchy = 'publish'
    ordering = ('-publish', )


@admin.register(BaseBuildings)
class BaseBuildings(admin.ModelAdmin):
    list_display = (
        'name',
        'status',
        'size',
    )
    list_filter = ('status', )
    search_fields = ('name', 'status')
    prepopulated_fields = {'slug': ('name', )}
    # raw_id_fields = ('author', )
    ordering = ('status', 'name')


@admin.register(BaseObjects)
class BaseObjects(admin.ModelAdmin):
    list_display = (
        'name',
        'main_object',
        'status',
        'size',
    )
    list_filter = (
        'status',
        'main_object',
    )
    search_fields = ('title', 'body')
    prepopulated_fields = {'slug': ('name', )}
    # raw_id_fields = ('author', )
    ordering = (
        'status',
        'main_object',
    )


@admin.register(Sponsors)
class Sponsors(admin.ModelAdmin):
    list_display = ('role', 'image', 'url')
    list_filter = ('role', 'image')
    search_fields = ('role', )
    ordering = ('role', )


@admin.register(Trainings)
class Trainings(admin.ModelAdmin):
    list_display = ('team', 'date_start', 'date_end')
    list_filter = ('team', )
    search_fields = ('team', )
    ordering = ('team', )


@admin.register(File)
class Files(admin.ModelAdmin):
    list_display = (
        'title',
        'file',
    )
    list_filter = ('file', )
    search_fields = ('title', )
    ordering = ('title', )