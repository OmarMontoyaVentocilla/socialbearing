from rest_framework import viewsets
from .models import Persona, Positivo, Neutro, Negativo
from .serializers import PersonaSerializer, PositivoSerializer, NeutroSerializer, NegativoSerializer


class PersonaViewSet(viewsets.ModelViewSet):
    queryset = Persona.objects.filter(estado="1")
    serializer_class = PersonaSerializer

class PositivoViewSet(viewsets.ModelViewSet):
    queryset = Positivo.objects.filter(estado="1")
    serializer_class = PositivoSerializer

class NeutroViewSet(viewsets.ModelViewSet):
    queryset = Neutro.objects.filter(estado="1")
    serializer_class = NeutroSerializer

class NegativoViewSet(viewsets.ModelViewSet):
    queryset = Negativo.objects.filter(estado="1")
    serializer_class = NegativoSerializer