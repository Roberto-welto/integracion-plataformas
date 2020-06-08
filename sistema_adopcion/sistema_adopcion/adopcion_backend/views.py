from django.http import HttpResponse, JsonResponse
from django.shortcuts import render
from django.views.generic import TemplateView

# Create your views here.

from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework.utils import json
from rest_framework.parsers import JSONParser
from rest_framework import serializers
from rest_framework import viewsets


from .serializers import UserSerializer, PetSerializer
from .models import Pet, User

class HomePageView(TemplateView):
    def get(self, request, **kwargs):
        return render(request, 'index.html', context=None)

class LinksPageView(TemplateView):
    def get(self, request, **kwargs):
        return render(request, 'links.html', context=None)

class Pets(TemplateView):
    def getPet(request):
        name='liran'
        return HttpResponse('{" name";}"' + name + '", "age":31, "city":"New York" }')




# Example method
@api_view(["POST"])
def CalcTest(x1):
    try:
        x=json.loads(x1.body)
        # print(x["data"], 'Value of x')                                                                                  
        y=str(x * 100)
        return JsonResponse("Result:"+y, safe=False)
    except ValueError as e:
        return Response(e.args[0],status.HTTP_400_BAD_REQUEST)



@api_view(['GET', 'POST'])
def user_list(req):
    if req.method == 'GET':
        users = User.objects.all()
        serializer = UserSerializer(users, many=True)
        return JsonResponse(serializer.data, safe=False)

    if req.method == 'POST':
        data = JSONParser().parse(req)
        serializer = UserSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data)
        return JsonResponse(serializer.errors, status=400)

@api_view(['GET', 'PUT', 'DELETE'])
def user_detail(req, pk):   
    try:
        user = User.objects.get(pk=pk)

    except User.DoesNotExist:
            return HttpResponse(status=404)

    if req.method == 'GET':
        serializer = UserSerializer(user)
        return JsonResponse(serializer.data)

    elif req.method == 'PUT':
        data = JSONParser().parse(req)
        serializer = UserSerializer(user,data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data)
        return JsonResponse(serializer.errors, status=400)

    elif req.method == "DELETE":
        user.delete()
        return HttpResponse(status=204)


@api_view(['GET', 'POST'])
def pet_list(req):
    if req.method == 'GET':
        Pets = Pet.objects.all()
        serializer = PetSerializer(Pets, many=True)
        return JsonResponse(serializer.data, safe=False)

    if req.method == 'POST':
        data = JSONParser().parse(req)
        serializer = PetSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data)
        return JsonResponse(serializer.errors, status=400)


@api_view(['GET', 'PUT', 'DELETE'])
def pet_detail(req, pk):   
    try:
        pet = Pet.objects.get(pk=pk)

    except Pet.DoesNotExist:
            return HttpResponse(status=404)

    if req.method == 'GET':
        serializer = PetSerializer(pet)
        return JsonResponse(serializer.data)

    elif req.method == 'PUT':
        data = JSONParser().parse(req)
        serializer = PetSerializer(pet,data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data)
        return JsonResponse(serializer.errors, status=400)

    elif req.method == "DELETE":
        pet.delete()
        return HttpResponse(status=204)


@api_view(['GET'])
def user_pets(req, idUser):   
    try:
        pet = Pet.objects.filter(user=idUser)

    except Pet.DoesNotExist:
            return HttpResponse(status=404)


    if req.method == 'GET':
        serializer = PetSerializer(pet, many= True)
        return JsonResponse(serializer.data, safe= False)




