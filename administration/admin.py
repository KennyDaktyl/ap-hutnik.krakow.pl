from django.contrib import admin

# Register your models here.

from .models import *

# Register your models here.


@admin.register(Members)
class MembersAdmin(admin.ModelAdmin):
    list_display = [f.name for f in Members._meta.fields]
    list_filter = (
        'year',
        'coach',
        'declaration',
    )
    search_fields = ('last_name', 'year', 'coach')


@admin.register(Coach2)
class Coach2(admin.ModelAdmin):
    list_display = [f.name for f in Coach2._meta.fields]

    # prepopulated_fields = {'slug': ('name', )}
    # raw_id_fields = ('author', )
    # ordering = ('-id', )
