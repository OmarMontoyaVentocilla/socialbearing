from rest_framework import routers
from persona.viewsets import PersonaViewSet
from persona.viewsets import PositivoViewSet
from persona.viewsets import NeutroViewSet
from persona.viewsets import NegativoViewSet
from search.viewsets import FacebookViewSet
from search.viewsets import TwitterViewSet
from search.viewsets import GoogleViewSet
from search.viewsets import InstagtramViewSet
from search.viewsets import GithubViewSet

# from reporte.viewsets import PersonaRedesViewSet

router = routers.DefaultRouter()
router.register(r'persona', PersonaViewSet)
router.register(r'positivo', PositivoViewSet)
router.register(r'neutro', NeutroViewSet)
router.register(r'negativo', NegativoViewSet)
router.register(r'facebook', FacebookViewSet)
router.register(r'twitter', TwitterViewSet)
router.register(r'google', GoogleViewSet)
router.register(r'instagram', InstagtramViewSet)
router.register(r'github', GithubViewSet)
# router.register(r'listadotodo',PersonaRedesViewSet,base_name='listado')
