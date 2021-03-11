from django.db import models
from django.conf import settings


class Members(models.Model):
    year = models.CharField(verbose_name="Rocznik np: 2008",
                            max_length=8,
                            null=True,
                            blank=True)
    first_name = models.CharField(verbose_name="Imię",
                                  db_index=True,
                                  max_length=32,
                                  null=True,
                                  blank=True)
    last_name = models.CharField(verbose_name="Nazwisko",
                                 max_length=64,
                                 null=True,
                                 blank=True)
    coach = models.ForeignKey("Coach2",
                              verbose_name="Trener",
                              db_index=True,
                              on_delete=models.CASCADE,
                              null=True,
                              blank=True)
    declaration = models.BooleanField(verbose_name="Czy jest deklaracja?",
                                      db_index=True,
                                      default=False,
                                      null=True,
                                      blank=True)
    declaration_date = models.DateField(
        verbose_name="Data złożenia deklaracji", null=True, blank=True)
    medical_exam = models.DateField(verbose_name="Badania lekarskie",
                                    null=True,
                                    blank=True)
    address = models.CharField(verbose_name="Adres",
                               max_length=128,
                               null=True,
                               blank=True)
    pesel = models.CharField(verbose_name="Pesel",
                             max_length=12,
                             null=True,
                             blank=True)
    born_date = models.DateField(verbose_name="Data urodzenia",
                                 null=True,
                                 blank=True)
    parent_name = models.CharField(verbose_name="Opiekun",
                                   max_length=64,
                                   null=True,
                                   blank=True)
    phone_number = models.CharField(verbose_name="Kontakt telefoniczny",
                                    max_length=32,
                                    null=True,
                                    blank=True)
    email = models.EmailField(verbose_name="Emial",
                              max_length=254,
                              null=True,
                              blank=True)
    info = models.CharField(verbose_name="Info",
                            max_length=128,
                            null=True,
                            blank=True)

    class Meta:
        ordering = ('last_name', )
        verbose_name_plural = "Zawodnicy"

    def __str__(self):
        return self.last_name + ", " + self.first_name


class Coach2(models.Model):
    last_name = models.CharField(verbose_name="Nazwisko", max_length=64)

    class Meta:
        ordering = ('last_name', )
        verbose_name_plural = "Trenerzy"

    def __str__(self):
        return self.last_name
