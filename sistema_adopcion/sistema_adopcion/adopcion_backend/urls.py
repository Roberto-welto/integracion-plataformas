from django.conf.urls import url
from django.urls import path, include

from rest_framework import routers
from .views import user_list, user_detail, pet_list, pet_detail, user_pets

urlpatterns = [
    path('user/', user_list),
    path('user/<int:pk>', user_detail),
    path('pet/', pet_list),
    path('pet/<int:pk>', pet_detail),
    path('user_pets/<int:idUser>', user_pets),
]