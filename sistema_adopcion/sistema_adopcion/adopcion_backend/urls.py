from django.conf.urls import url
from django.urls import path, include

from adopcion_backend import views
from rest_framework import routers

router = routers.DefaultRouter()
router.register(r'pets', views.Pets, basename="Pets")

urlpatterns = [
    url(r'^$', views.HomePageView.as_view()),
    url(r'^links/$', views.LinksPageView.as_view()),
    url(r'^getpet/$', views.Pets.getPet),
    url(r'^apitest/$', views.CalcTest)
]