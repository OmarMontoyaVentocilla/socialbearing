from django.shortcuts import render
from django.http import HttpResponse
from django.http import JsonResponse
from django.core import serializers
import requests
import json
from .models import Persona, Positivo, Neutro, Negativo
from django.contrib.auth.decorators import login_required


# Create your views here.
@login_required(login_url="/accounts/login")
def createpersona(request):
    if(request.method == 'POST'):
        valor = json.loads(request.body.decode("utf-8"))
        nombre = valor['nombre'].strip()
        apodo = valor['apodo'].strip()
        mensaje = {}
        if(nombre != ''):
            persona = Persona.objects.create(nombre=nombre, apodo=apodo)
            if(persona):
                mensaje['success'] = "Se guardo exitosamente"
            else:
                mensaje['fail'] = "No se guardo"
        else:
            mensaje['fail'] = "No se guardo"
    return JsonResponse(mensaje)


@login_required(login_url="/accounts/login")
def createpositivo(request):
    if(request.method == 'POST'):
        valor = json.loads(request.body.decode("utf-8"))
        nombre = valor['nombre'].strip()
        mensaje = {}
        if(nombre != ''):
            positivo = Positivo.objects.create(nombre=nombre)
            if(positivo):
                mensaje['success'] = "Se guardo exitosamente"
            else:
                mensaje['fail'] = "No se guardo"
        else:
            mensaje['fail'] = "No se guardo"
    return JsonResponse(mensaje)


@login_required(login_url="/accounts/login")
def createneutro(request):
    if(request.method == 'POST'):
        valor = json.loads(request.body.decode("utf-8"))
        nombre = valor['nombre'].strip()
        mensaje = {}
        if(nombre != ''):
            neutro = Neutro.objects.create(nombre=nombre)
            if(neutro):
                mensaje['success'] = "Se guardo exitosamente"
            else:
                mensaje['fail'] = "No se guardo"
        else:
            mensaje['fail'] = "No se guardo"
    return JsonResponse(mensaje)


@login_required(login_url="/accounts/login")
def createnegativo(request):
    if(request.method == 'POST'):
        valor = json.loads(request.body.decode("utf-8"))
        nombre = valor['nombre'].strip()
        mensaje = {}
        if(nombre != ''):
            negativo = Negativo.objects.create(nombre=nombre)
            if(negativo):
                mensaje['success'] = "Se guardo exitosamente"
            else:
                mensaje['fail'] = "No se guardo"
        else:
            mensaje['fail'] = "No se guardo"
    return JsonResponse(mensaje)


@login_required(login_url="/accounts/login")
def deletepersona(request, id):
    persona = Persona.objects.get(id=id)
    persona.estado = '0'
    persona.save()
    mensaje = {}
    mensaje['message'] = "Se elimno exitosamente"
    return JsonResponse(mensaje)


@login_required(login_url="/accounts/login")
def deletepositivo(request, id):
    positivo = Positivo.objects.get(id=id)
    positivo.estado = '0'
    positivo.save()
    mensaje = {}
    mensaje['message'] = "Se elimno exitosamente"
    return JsonResponse(mensaje)


@login_required(login_url="/accounts/login")
def deleteneutro(request, id):
    neutro = Neutro.objects.get(id=id)
    neutro.estado = '0'
    neutro.save()
    mensaje = {}
    mensaje['message'] = "Se elimno exitosamente"
    return JsonResponse(mensaje)


@login_required(login_url="/accounts/login")
def deletenegativo(request, id):
    negativo = Negativo.objects.get(id=id)
    negativo.estado = '0'
    negativo.save()
    mensaje = {}
    mensaje['message'] = "Se elimno exitosamente"
    return JsonResponse(mensaje)


@login_required(login_url="/accounts/login")
def editpersona(request, id):
    persona = Persona.objects.get(id=id)
    valor = json.loads(request.body.decode("utf-8"))
    nombre = valor['nombre'].strip()
    apodo = valor['apodo'].strip()
    persona.nombre = nombre
    persona.apodo = apodo
    persona.save()
    msg = {}
    msg['message'] = "Se edito exitosamente"
    return JsonResponse(msg)


@login_required(login_url="/accounts/login")
def editpositivo(request, id):
    positivo = Positivo.objects.get(id=id)
    valor = json.loads(request.body.decode("utf-8"))
    nombre = valor['nombre'].strip()
    positivo.nombre = nombre
    positivo.save()
    msg = {}
    msg['message'] = "Se edito exitosamente"
    return JsonResponse(msg)


@login_required(login_url="/accounts/login")
def editneutro(request, id):
    neutro = Neutro.objects.get(id=id)
    valor = json.loads(request.body.decode("utf-8"))
    nombre = valor['nombre'].strip()
    neutro.nombre = nombre
    neutro.save()
    msg = {}
    msg['message'] = "Se edito exitosamente"
    return JsonResponse(msg)


@login_required(login_url="/accounts/login")
def editnegativo(request, id):
    negativo = Negativo.objects.get(id=id)
    valor = json.loads(request.body.decode("utf-8"))
    nombre = valor['nombre'].strip()
    negativo.nombre = nombre
    negativo.save()
    msg = {}
    msg['message'] = "Se edito exitosamente"
    return JsonResponse(msg)


@login_required(login_url="/accounts/login")
def listpersona(request):
    personas = Persona.objects.all()
    return render(request, 'persona.html', {'personas': personas})
