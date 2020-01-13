from django.urls import path
from .views import createpersona, createpositivo, createneutro, createnegativo, listpersona, deletepersona, deletepositivo, deleteneutro, deletenegativo, editpersona, editpositivo, editneutro, editnegativo

urlpatterns = [
    path('', listpersona, name='listpersona'),
    path('addpersona', createpersona, name='addpersona'),
    path('addpositivo', createpositivo, name='addpositivo'),
    path('addneutro', createneutro, name='addneutro'),
    path('addnegativo', createnegativo, name='addnegativo'),
    path('deletepersona/<int:id>/', deletepersona, name='deletepersona'),
    path('deletepositivo/<int:id>/', deletepositivo, name='deletepositivo'),
    path('deleteneutro/<int:id>/', deleteneutro, name='deleteneutro'),
    path('deletenegativo/<int:id>/', deletenegativo, name='deletenegativo'),
    path('editpersona/<int:id>/', editpersona, name='editpersona'),
    path('editpositivo/<int:id>/', editpositivo, name='editpositivo'),
    path('editneutro/<int:id>/', editneutro, name='editneutro'),
    path('editnegativo/<int:id>/', editnegativo, name='editnegativo')
    #  path('get',getAuto,name='getauto'),
    #  path('getdet',get_details,name='getdet'),
    #  #  path('gettw',gettw,name='gettw'),
    #  path('customsearch',customSearch,name='customsearch'),
    #  path('add', create_auto,name='create_auto'),
    #  path('update/<int:id>/', update_auto,name='update_auto'),
    #  path('delete/<int:id>/', delete_auto,name='delete_auto'),
]
