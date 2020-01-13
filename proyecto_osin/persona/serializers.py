from rest_framework import serializers
from .models import Persona
from .models import Positivo
from .models import Neutro
from .models import Negativo

class PersonaSerializer(serializers.ModelSerializer):
    class Meta:
        model=Persona
        fields='__all__'

class PositivoSerializer(serializers.ModelSerializer):
    class Meta:
        model=Positivo
        fields='__all__'

class NeutroSerializer(serializers.ModelSerializer):
    class Meta:
        model=Neutro
        fields='__all__'

class NegativoSerializer(serializers.ModelSerializer):
    class Meta:
        model=Negativo
        fields='__all__'

        

