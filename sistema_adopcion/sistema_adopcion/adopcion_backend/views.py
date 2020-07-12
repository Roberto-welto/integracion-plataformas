import psycopg2
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render
from django.views.generic import TemplateView
from io import BytesIO
import json
import boto3
import jwt
import datetime
import os
# Create your views here.
import stripe
#

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
        return HttpResponse('{" name": "'+ name + '", "age":3, "city":"New York" }')




# Example method
@api_view(["GET", "POST", "PUT"])
def get_petbd(req):
  try:

    if req.method == 'GET':  
      connection = psycopg2.connect(
        user='postgres',
        password="1303",
        host="localhost",
        port="5432",
        database = "sistema_adopcion")

      cursor = connection.cursor()

      cursor.execute(f"SELECT * FROM sistema_adopcion.f_obtener_mascotas(next_set := CAST ({50} AS INTEGER), off  := CAST ({0} AS INTEGER), sort := CAST('{'DESC'}' AS VARCHAR));")

      mascotaGet = cursor.fetchone()
      mascotaGet = mascotaGet[0]

      return Response(mascotaGet)

    elif req.method == 'POST':
      mascota = json.loads(req.body)
      print(mascota)
      connection = psycopg2.connect(
        user='postgres',
        password="1303",
        host="localhost",
        port="5432",
        database = "sistema_adopcion")

      cursor = connection.cursor()

      cursor.execute(f"""INSERT INTO sistema_adopcion.mascota(nombre, tipo_mascota_id, descripcion, edad, usuario_id, fecha_creacion) 
                       VALUES('{mascota['nombre']}', {mascota['tipo_mascota_id']}, '{mascota['descripcion']}', {mascota['edad']}, {1}, CURRENT_TIMESTAMP)
                       RETURNING id;""")
  
  
      mascotaId = cursor.fetchone()

      mascotaId = mascotaId[0]

      connection.commit()

      cursor.execute(f"SELECT * FROM sistema_adopcion.f_obtener_mascota_por_id({mascotaId})")

      mascotaInserted = cursor.fetchone()

      mascotaInserted = mascotaInserted[0]

      return Response(mascotaInserted)
    
    elif req.method == 'PUT':

      mascota = json.loads(req.body)
      print(mascota)
      connection = psycopg2.connect(
        user='postgres',
        password="1303",
        host="localhost",
        port="5432",
        database = "sistema_adopcion")

      cursor = connection.cursor()

      if req.query_params.get('img') != "" :

        query_update = f"""INSERT INTO sistema_adopcion.mascotas_img (nombre_archivo, mascota_id, ruta_s3) 
                        VALUES ('{mascota['documento']['name']}', {mascota['id']}, '{mascota['documento']['ruta_s3']}') RETURNING id;"""
        
        print(query_update)

        cursor.execute(query_update)

        mascotaImg = cursor.fetchone()

        print(mascotaImg)

        connection.commit()

        cursor.execute(f"""SELECT * FROM sistema_adopcion.f_obtener_mascota_por_id({mascota['id']})""")

        mascota = cursor.fetchone()

        mascota = mascota[0]

        return Response(mascota)

  except Exception as e:

    print(str(e))

@api_view(['GET'])
def get_tipo_mascota(req):

  if req.method == 'GET':

    connection = psycopg2.connect(
        user='postgres',
        password="1303",
        host="localhost",
        port="5432",
        database = "sistema_adopcion")

    cursor = connection.cursor()

    cursor.execute(f"""SELECT * FROM sistema_adopcion.f_obtener_tipo_mascotas(next_set := CAST ({50} AS INTEGER), off  := CAST ({0} AS INTEGER), sort := CAST('{'DESC'}' AS VARCHAR));""")

    tipo_mascota = cursor.fetchone()[0]

    return Response(tipo_mascota)


@api_view(["PUT"])
def get_doc(req):
  try:

    if req.method == 'PUT':
        mascota = json.loads(req.body)
        mascota = mascota
        print(mascota)
        region_name = 'us-east-1'

        session = boto3.session.Session()
        client = session.client(
          service_name='s3',
          region_name=region_name
        )

        try:

          print(mascota['documento'])
          response = client.generate_presigned_post('sistema.adopcion', mascota['documento'].get('objKey'),
                                                    Fields=None,
                                                    Conditions=None,
                                                    ExpiresIn=3600)

          print(response)

          return Response(response)
        except Exception as e:

          raise Exception(str(e))
  
  except Exception as e:
    print(str(e))

@api_view(["GET"])
def comunas(req):
  
  if req.method == 'GET':

      connection = psycopg2.connect(
        user='postgres',
        password="1303",
        host="localhost",
        port="5432",
        database = "sistema_adopcion")

      cursor = connection.cursor()

      cursor.execute(f"SELECT * FROM sistema_adopcion.f_obtener_comunas(next_set := CAST ({50} AS INTEGER), off  := CAST ({0} AS INTEGER), sort := CAST('{'DESC'}' AS VARCHAR));")

      comunas = cursor.fetchone()
      comunas = comunas[0]

      return Response(comunas)

@api_view(['GET', 'POST'])
def user_list(req):
    if req.method == 'GET':
        
        user = json.loads(req.body)

        print(user)
        connection = psycopg2.connect(
        user='postgres',
        password="1303",
        host="localhost",
        port="5432",
        database = "sistema_adopcion")

        cursor = connection.cursor()
        

        cursor.execute(f"""SELECT * FROM sistema_adopcion.usuarios WHERE pass = '{user['pass']}'""")
        

        userData = cursor.fetchone()
        userData = userData[0]


        jwtpayload = jwt.encode({'payload': userData, 'exp': datetime.datetime.utcnow() + datetime.timedelta(hours=6)}, 'secret', algorithm='HS256')

        print(jwtpayload)

        return Response(userData)

    if req.method == 'POST':
        
        if req.query_params.get('login') != "":

          user = json.loads(req.body)

          connection = psycopg2.connect(
          user='postgres',
          password="1303",
          host="localhost",
          port="5432",
          database = "sistema_adopcion")

          cursor = connection.cursor()


          cursor.execute(f"""SELECT ROW_TO_JSON(usuario) FROM (SELECT * FROM sistema_adopcion.usuarios WHERE pass = '{user['pass']}') usuario""")


          userData = cursor.fetchone()
          print(userData)

          if userData != None:
            
            userData = userData[0]
            jwtpayload = jwt.encode({'payload': userData, 'exp': datetime.datetime.utcnow() + datetime.timedelta(hours=6)}, 'secret', algorithm='HS256')

            return Response(jwtpayload)
  
          else:
            
            userData = 'No user matches the provided information'

            return Response(userData)


        else:

          user = json.loads(req.body)
          print(user)
          connection = psycopg2.connect(
          user='postgres',
          password="1303",
          host="localhost",
          port="5432",
          database = "sistema_adopcion")

          cursor = connection.cursor()

          # print(f"""INSERT INTO sistema_adopcion.usuarios (rut, nombre, email, direccion, comuna_id, tipo_usuario_id, fecha_creacion, pass)
          #                  VALUES ('{user['rut']}', '{user['nombre']}', '{user['email']}', '{user['direccion']}', {user['comuna_id']}, 1, CURRENT_TIMESTAMP, '{user['password']}') RETURNING id;""")
          cursor.execute(f"""INSERT INTO sistema_adopcion.usuarios (rut, nombre, email, direccion, comuna_id, tipo_usuario_id, fecha_creacion, pass, telefono)
                           VALUES ('{user['rut']}', '{user['nombre']}', '{user['email']}', '{user['direccion']}', {user['comuna_id']}, 1, CURRENT_TIMESTAMP, '{user['password']}', '{user['telefono']}') RETURNING id;""")

          userId = cursor.fetchone()
          userId = userId[0]

          connection.commit()

          cursor.execute(f"""SELECT * FROM sistema_adopcion.f_obtener_usuario_por_id({userId})""")

          userData = cursor.fetchone()
          userData = userData[0]

          return Response(userData)

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
        print(serializer)
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



# def load_commerce_data(commerce_code):
#     print(f"{os.getcwd()}/commerces/597020000541.key")
#     CERTIFICATES_DIR = os.path.join(os.path.dirname(__file__), "commerces")
#     print(CERTIFICATES_DIR)
#     with open(r"C:\Users\timel\Desktop\V\Integracion de Plataformas\integracion-plataformas\sistema_adopcion\sistema_adopcion\commerces\597020000541.key", "r") as file:
#         key_data = file.read()
#     with open(r'C:\Users\timel\Desktop\V\Integracion de Plataformas\integracion-plataformas\sistema_adopcion\sistema_adopcion\sistema_adopcion\commerces\597020000541.crt', "r") as file:
#         cert_data = file.read()
#     with open(r'C:\Users\timel\Desktop\V\Integracion de Plataformas\integracion-plataformas\sistema_adopcion\sistema_adopcion\sistema_adopcion\commerces\tbk.pem', "r") as file:
#         tbk_cert_data = file.read()

#     return {
#         "key_data": key_data,
#         "cert_data": cert_data,
#         "tbk_cert_data": tbk_cert_data,
#     }


@api_view(['GET'])
def donate(req):
  
  if req.method == 'GET':

    stripe.api_key = 'sk_test_51H4C4TF9yxhZlW6nhNfbXVZvC7LuYKZx0XRou95dJjgC6cb4WEoHRp7OzI1RJ6MaEqshfAqsnPJivifYYljTKXtC00oKgfX81T'

    intent = stripe.PaymentIntent.create(
      amount=1099,
      currency='clp'

      metadata={'integration_check': 'accept_a_payment'}
    )
    transaction = []


    return Response(transaction)