from django.contrib.sitemaps import Sitemap
from django.urls import reverse
from .models import *


class UserUpdateSiteView(Sitemap):
    priority = 0.5
    changefreq = 'weekly'
    protocol = 'https'

    def items(self):
        return User.objects.all()

    def location(self, items):
        return reverse("user_update", kwargs={
            "pk": items.id,
        })


class ProfileSiteView(Sitemap):
    priority = 0.5
    changefreq = 'weekly'
    protocol = 'https'

    def items(self):
        return Profile.objects.all()

    def location(self, items):
        return reverse("profile", kwargs={
            "pk": items.id,
        })


class ProfileEmployeesSiteView(Sitemap):
    priority = 0.5
    changefreq = 'weekly'
    protocol = 'https'

    def items(self):
        return Profile.objects.filter(role=1)

    def location(self, items):
        return reverse("profile_employee_update", kwargs={
            "pk": items.id,
        })


class MyPlayersSiteView(Sitemap):
    priority = 0.5
    changefreq = 'weekly'
    protocol = 'https'

    def items(self):
        return Teams.objects.all()

    def location(self, items):
        return reverse("my_players_list", kwargs={
            "pk": items.coach.id,
        })


class ProfilePlayersSiteView(Sitemap):
    priority = 0.5
    changefreq = 'weekly'
    protocol = 'https'

    def items(self):
        return Profile.objects.filter(role=1)

    def location(self, items):
        return reverse("profile_player_update", kwargs={
            "pk": items.id,
        })


class PostSiteView(Sitemap):
    priority = 0.9
    changefreq = 'daily'
    protocol = 'https'

    def items(self):
        return Post.objects.all()

    def lastmod(self, obj):
        return obj.updated


class PostsTeamsSiteView(Sitemap):
    priority = 0.5
    changefreq = 'weekly'
    protocol = 'https'

    def items(self):
        return Teams.objects.all()

    def location(self, items):
        return reverse("posts_team",
                       kwargs={
                           "slug": items.slug,
                           "pk": items.id,
                       })


class PostsTeamsByYearSiteView(Sitemap):
    priority = 0.5
    changefreq = 'weekly'
    protocol = 'https'

    def items(self):
        return Teams.objects.all()

    def location(self, items):
        return reverse("posts_team_by_year",
                       kwargs={
                           "slug": items.yearbook.slug,
                           "pk": items.id,
                       })


class CoachsSiteView(Sitemap):
    priority = 0.5
    changefreq = 'weekly'
    protocol = 'https'

    def items(self):
        return Profile.objects.filter(role=1)

    def location(self, items):
        return reverse("coach_details",
                       kwargs={
                           "slug": items.slug,
                           "pk": items.id,
                       })


class PlayersSiteView(Sitemap):
    priority = 0.5
    changefreq = 'weekly'
    protocol = 'https'

    def items(self):
        return Profile.objects.filter(role=0)

    def location(self, items):
        return reverse("player_details",
                       kwargs={
                           "slug": items.slug,
                           "pk": items.id,
                       })


class TeamsSiteView(Sitemap):
    priority = 0.5
    changefreq = 'weekly'
    protocol = 'https'

    def items(self):
        return Teams.objects.all()


class TeamsByYearSiteView(Sitemap):
    priority = 0.5
    changefreq = 'weekly'
    protocol = 'https'

    def items(self):
        return Teams.objects.all()

    def location(self, items):
        return reverse("teams_by_year",
                       kwargs={
                           "slug": items.yearbook.slug,
                           "pk": items.id,
                       })


class UpdateTrainingSiteView(Sitemap):
    priority = 0.5
    changefreq = 'weekly'
    protocol = 'https'

    def items(self):
        return Trainings.objects.all()

    def location(self, items):
        return reverse("update_training", kwargs={
            "pk": items.id,
        })


class DeleteTrainingSiteView(Sitemap):
    priority = 0.5
    changefreq = 'weekly'
    protocol = 'https'

    def items(self):
        return Trainings.objects.all()

    def location(self, items):
        return reverse("del_training", kwargs={
            "pk": items.id,
        })


class BaseBuildingsSiteView(Sitemap):
    priority = 0.5
    changefreq = 'weekly'
    protocol = 'https'

    def items(self):
        return BaseBuildings.objects.all()


class StaticViewSiteMap(Sitemap):
    def items(self):
        return [
            'main', 'posts', 'teams', 'coachs', 'buildings', 'teams_list',
            'contact'
        ]

    def location(self, items):
        return reverse(items)


# class PhoneMainSiteView(Sitemap):
#     def items(self):
#         return ['store_gsm_phones_main_view']

#     def location(self, items):
#         return reverse(items)

# class PhoneSearchSiteView(Sitemap):
#     def items(self):
#         return ['store_gsm_phones_search_view']

#     def location(self, items):
#         return reverse(items)

# class ItemsSiteView(Sitemap):
#     def items(self):
#         return Czesc.objects.all()

# class ItemMainSiteView(Sitemap):
#     def items(self):
#         return ['store_gsm_serwis_main_view']

#     def location(self, items):
#         return reverse(items)

# class ItemSearchSiteView(Sitemap):
#     def items(self):
#         return ['store_gsm_serwis_search_view']

#     def location(self, items):
#         return reverse(items)

# class CategorysGSMSiteView(Sitemap):
#     def items(self):
#         # return ['categorys']
#         return Categorys.objects.all()

# class CategorysAutoMarkSiteView(Sitemap):
#     def items(self):
#         # return ['categorys']
#         return Marka.objects.filter(keys=True)

# class ProductsSiteView(Sitemap):
#     def items(self):
#         return Products.objects.all()

# class ContactSiteView(Sitemap):
#     def items(self):
#         return Sklep.objects.filter(serwis_zew=False)

# class StaticViewSiteMap(Sitemap):
#     def items(self):
#         return [
#             'store_view', 'store_gsm_view', 'store_grav_view',
#             'store_keys_view', 'auto-marks', 'store_stamp_view',
#             'store_gsm_phones_main_view', 'store_gsm_serwis_main_view',
#             'store_gsm_accessories_main_view',
#             'store_gsm_engraving_metal_cat_view', 'cookies'
#         ]

#     def location(self, items):
#         return reverse(items)
