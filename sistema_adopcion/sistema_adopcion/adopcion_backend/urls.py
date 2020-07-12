from django.conf.urls import url
from django.urls import path, include

from rest_framework import routers
from .views import user_list, user_detail, pet_list, pet_detail, user_pets, get_petbd, get_doc, get_tipo_mascota, comunas, donate

urlpatterns = [
    path('user', user_list),
    path('user/<int:pk>', user_detail),
    path('pet', get_petbd),
    path('tipo_mascota', get_tipo_mascota),
    path('comuna', comunas),
    path('doc', get_doc),
    path('user_pets/<int:idUser>', user_pets),
    path('donar', donate)
]