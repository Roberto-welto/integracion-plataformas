from django.http import HttpResponse, JsonResponse
from django.shortcuts import render
from django.views.generic import TemplateView

# Create your views here.

from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework.utils import json
from rest_framework import serializers
from rest_framework import viewsets


from adopcion_backend.models import Pet

class HomePageView(TemplateView):
    def get(self, request, **kwargs):
        return render(request, 'index.html', context=None)

class LinksPageView(TemplateView):
    def get(self, request, **kwargs):
        return render(request, 'links.html', context=None)

class Pets(TemplateView):
    def getPet(request):
        name='liran'
        return HttpResponse('{" name": "'+ name + '", "age":3, "city":"New York" }')

@api_view(["POST"])
def PostPet(Pet):
    try:
        pet=json.loads(Pet.body)
        return JsonResponse(pet, safe=False)
    except ValueError as e:
        return Response(e.args[0],status.HTTP_400_BAD_REQUEST)
