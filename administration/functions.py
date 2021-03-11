import pandas as pd
import numpy as np

from administration.models import Coach2, Members


def format_date(date):
    if date:
        day = date[0:2]
        month = date[3:5]
        year = date[6:10]
        return year + "-" + month + "-" + day


df = pd.read_csv('members.csv')
df = df.replace({np.nan: None})

for index, row in df.iterrows():
    if row['coach'] != None:
        Coach2.objects.get_or_create(last_name=row['coach'])

for index, row in df.iterrows():
    pl = Members()
    pl.first_name = row['first_name']
    pl.last_name = row['last_name']
    pl.declaration_date = format_date(row['declaration_date'])
    pl.born_date = format_date(row['born_date'])
    pl.address = row['address']
    pl.pesel = row['pesel']
    pl.parent_name = row['parent']
    pl.phone_number = row['phone_number']
    pl.info = row['info']
    pl.year = str(row['year'])[0:4]
    if row['medical_exam']:
        pl.medical_exam = format_date(row['medical_exam'])
    pl.email = row['mail']
    if row['declaration'] == 'True':
        pl.declaration = True
    else:
        pl.declaration = False
    if row['coach'] != None:
        coach = Coach2.objects.get(last_name=row['coach'])
        pl.coach = coach
    pl.save()