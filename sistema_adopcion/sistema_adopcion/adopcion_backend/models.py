from django.db import models

# Create your models here.

class User(models.Model):
    idUser = models.AutoField(primary_key=True)
    rut = models.CharField(max_length = 13, unique=True)
    mail = models.CharField(max_length = 100, unique=True)
    password = models.CharField(max_length = 200)
    firstName = models.CharField(max_length = 30)
    lastName = models.CharField(max_length = 30)
    userType = models.CharField(max_length = 30)
    imgUrl = models.CharField(max_length = 100)


    
class Pet(models.Model):
    idPet = models.AutoField(primary_key=True)
    name = models.CharField(max_length=30)
    type = models.CharField(max_length=30)
    description = models.CharField(max_length = 200)
    age = models.CharField(max_length = 30, null=True)
    urlImg = models.CharField(max_length = 100)
    # user_id = models.ForeignKey(User, on_delete = models.CASCADE)


# class Adoption(models.Model):
#     id = models.IntegerField(primary_key=True, auto_created = True)
#     ubication = models.CharField(max_length = 200)
#     pet = models.ForeignKey(Pet, on_delete = models.CASCADE)
#     user = models.ForeignKey(User, on_delete = models.CASCADE)
    

# class Donation(models.Model):
#         id = models.IntegerField(primary_key=True , auto_created = True)

