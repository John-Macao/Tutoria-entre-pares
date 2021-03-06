from typing import List
import secrets
import requests
import json

from fastapi import Depends, FastAPI, HTTPException, Response, status, Path, Request
from fastapi.security import HTTPBasic, HTTPBasicCredentials
from sqlalchemy.sql.sqltypes import Integer

from starlette.status import HTTP_404_NOT_FOUND, HTTP_401_UNAUTHORIZED, \
        HTTP_503_SERVICE_UNAVAILABLE
from sqlalchemy.orm import Session

from controller import  menu_controller, usuario_controller, materia_oferta_controller, horario_controller, asistencia_controller, coordinacion_controller
from model import models
from connection.database import SessionLocal, engine

from connection.database import Base, engine 

from fastapi.middleware.cors import CORSMiddleware

#Base.metadata.drop_all(bind=engine)
Base.metadata.create_all(bind=engine)

 
origins = ['*']


app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

security = HTTPBasic()

# Dependency
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


def is_authenticated(credentials: HTTPBasicCredentials = Depends(security)):
    correct_username = secrets.compare_digest(credentials.username, "user")
    correct_password = secrets.compare_digest(credentials.password, "pass")
    if not (correct_username and correct_password):
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Incorrect login credentials",
            headers={"WWW-Authenticate": "Basic"},
        )
    return True

# @app.get(
#     '/menu',
# )
# def get_menus():
#     res = menu_controller.get_menus()
#     if not res:
#         return Response(
#             'NO hay menus para este usuario',
#             media_type="text/plain",
#             status_code=HTTP_404_NOT_FOUND
#         )
#     return res

# @app.put('/put-menu/{descripcion}',)
# def deshabilitar_materia_tutor(descripcion:str,db:Session=Depends(get_db),):
#     res = menu_controller.put_menu(descripcion)
#     return res

# @app.put('/update-menu/{id}-{descripcion}',)
# def deshabilitar_materia_tutor(id:str,descripcion:str,db:Session=Depends(get_db),):
#     res = menu_controller.update_menu(int(id),descripcion)
#     return res


######################################################################
################################ MENU ################################
######################################################################
@app.get(
    '/menu/{usu_correo}',
)
def get_menus(usu_correo: str):
    res = menu_controller.get_menu_correo(usu_correo)
    if not res:
        return Response(
            'NO hay menus para este usuario',
            media_type="text/plain",
            status_code=HTTP_404_NOT_FOUND
        )

    return res

@app.get('/menu-hijo/{men_fkid}',)
def get_menus_hijos(men_fkid: int,):
    res = menu_controller.get_menu_hijos(men_fkid)
    if not res:
        return Response(
            'NO hay menus para este usuario',
            media_type="text/plain",
            status_code=HTTP_404_NOT_FOUND
        )
    return res


#########################################################################
################################ USUARIO ################################
#########################################################################
@app.get('/usuarios/{usu_correo}',)
def get_usuario(usu_correo: str):
    res = menu_controller.get_usuario(usu_correo)
    if res is None:
        raise HTTPException(status_code=404, detail="User not found")
    return res

@app.get('/usuario_obtener_tutores/',)
def get_usuario():
    res = usuario_controller.get_usuario_tutores()
    if res is None:
        raise HTTPException(status_code=404, detail="User not found")
    return res
    
@app.get('/usuario_por_cedula/{usu_cedula}',)
def get_usuario(usu_cedula: str):
    res = usuario_controller.get_usuario_por_cedula(usu_cedula)
    if res is None:
        raise HTTPException(status_code=404, detail="User not found")
    return res

@app.get('/usuario_por_id/{usu_id}',)
def get_usuario(usu_id: int):
    res = usuario_controller.get_usuario_por_id(usu_id)
    if res is None:
        raise HTTPException(status_code=404, detail="User not found")
    return res

@app.get('/usuario_nombre/{usu_correo}',)
def get_usuario(usu_correo: str):
    res = usuario_controller.get_usuario_nombre(usu_correo)
    if res is None:
        raise HTTPException(status_code=404, detail="User not found")
    return res

@app.get('/usuario_telefono/{usu_correo}',)
def get_usuario(usu_correo: str):
    res = usuario_controller.get_usuario_telefono(usu_correo)
    if res is None:
        raise HTTPException(status_code=404, detail="User not found")
    return res

@app.get('/usuario_rol/{usu_correo}',)
def get_usuario_rol(usu_correo: str,):
    res = usuario_controller.get_usuario_rol(usu_correo)
    if res is None:
        raise HTTPException(status_code=404, detail="User not found")
    return res

@app.get('/usuario_id/{usu_correo}',) 
def get_usuario_id(usu_correo: str,):
    res = usuario_controller.get_usuario_id(usu_correo)
    if res is None:
        raise HTTPException(status_code=404, detail="User not found")
    return res

@app.put('/actualizar-usuario-telefono/{usu_correo}-{usu_telefono}',)
def put_materia_tutor(usu_correo:str,usu_telefono:str,db:Session=Depends(get_db),):
    res = usuario_controller.update_usuario_telefono(usu_correo,usu_telefono)
    return res

@app.put('/usuario-agregar-razon/{usu_correo}-{usu_razon}',)
def put_materia_tutor(usu_correo:str,usu_razon:str,db:Session=Depends(get_db),):
    res = usuario_controller.update_usuario_razon(usu_correo,usu_razon)
    return res

@app.put('/usuario-actualizar-a-tutor/',)
async def actualizar_horario_fijo(usuario:Request,):
    res = await usuario.json()
    usu_id = res['usu_id']
    usu_beca = res['usu_beca']
    usu_nivel = res["usu_nivel"]
    usu_carrera = res['usu_carrera']
    tu_id = res['tu_id']
    
    res2 = usuario_controller.update_usuario_a_tutor(usu_id, usu_beca, usu_nivel,usu_carrera,tu_id)

    return res2

@app.put('/usuario-actualizar-a-tutorado/{usu_id}',)
async def actualizar_horario_fijo(usu_id:int,):
    
    res2 = usuario_controller.update_usuario_a_tutorado(usu_id)

    return res2

@app.put('/usuario-agregar/',)
async def put_materia_tutor(usuario:Request,):
    res = await usuario.json()
    res = usuario_controller.put_usuario(res)
    return res

################################################################################
################################ MATERIA OFERTA ################################
################################################################################
@app.get('/obtener-materias-unicas/',)
def get_materias_usuario():
    res = materia_oferta_controller.get_materias_unica()
    if res is None:
        raise HTTPException(status_code=404, detail="No se encontraron materias para este tutor")
    return res

@app.get('/obtener-materias-por_materia/{id_materia_api}',)
def get_materias_usuario(id_materia_api:int):
    res = materia_oferta_controller.get_materias_por_materia(id_materia_api)
    if res is None:
        raise HTTPException(status_code=404, detail="No se encontraron materias")
    return res

@app.get('/obtener-materia-por-id/{ma_of_id}',)
def get_materias_usuario(ma_of_id: int,):
    res = materia_oferta_controller.get_materia_por_id(ma_of_id)
    if res is None:
        raise HTTPException(status_code=404, detail="No se encontraron materias para este tutor")
    return res

@app.get('/obtener-materias/{usu_correo}',)
def get_materias_usuario(usu_correo: str,):
    res = materia_oferta_controller.get_materias_tutor(usu_correo)
    if res is None:
        raise HTTPException(status_code=404, detail="No se encontraron materias para este tutor")
    return res

@app.put('/agregar-materia-tutor/{usu_correo}-{id_materia_api}',)
def put_materia_tutor(usu_correo:str,id_materia_api:str,db:Session=Depends(get_db),):
    res = materia_oferta_controller.put_materias_tutor(id_materia_api, usu_correo)
    return res

@app.put('/deshabilitar-materia-tutor/{usu_correo}-{id_materia_api}',)
def deshabilitar_materia_tutor(usu_correo:str,id_materia_api:str,db:Session=Depends(get_db),):
    res = materia_oferta_controller.deshabilitar_materias_tutor(id_materia_api, usu_correo)
    return res

#########################################################################
################################ HORARIO ################################
#########################################################################
#horario fijo
@app.get('/obtener-un-horario/{hor_id}',)
def get_horario_fijo(hor_id: str,):
    res = horario_controller.get_horario(hor_id)
    if res is None:
        raise HTTPException(status_code=404, detail="No se encontraron horarios para este tutor")
    return res

@app.get('/obtener-ultimo-horario/{usu_correo}',)
def get_horario_fijo(usu_correo: str,):
    res = horario_controller.get_ultimo_horario(usu_correo)
    if res is None:
        raise HTTPException(status_code=404, detail="No se encontraron horarios para este tutor")
    return res

@app.get('/obtener-horario-fijo/{usu_correo}',)
def get_horario_fijo(usu_correo: str):
    res = horario_controller.get_horarios_fijos(usu_correo)
    if res is None:
        raise HTTPException(status_code=404, detail="No se encontraron horarios para este tutor")
    return res

@app.get('/obtener-horario-fijo-de-materia_y_usuario/{usu_id}-{ma_of_id}',)
def get_horario_fijo(usu_id:int, ma_of_id: int):
    res = horario_controller.get_horarios_fijos_de_materia_y_usuario(usu_id, ma_of_id)
    if res is None:
        raise HTTPException(status_code=404, detail="No se encontraron horarios para este tutor")
    return res

@app.get('/obtener-horario-sesion/{usu_correo}',)
def get_horario_sesion(usu_correo: str):
    res = horario_controller.get_horarios_sesion(usu_correo)
    if res is None:
        raise HTTPException(status_code=404, detail="No se encontraron horarios para este tutor")
    return res

@app.put('/agregar-horario-tutor-fijo/{usu_correo}',)
async def agregar_horario_fijo(dato:Request,usu_correo:str,db:   Session = Depends(get_db)):
    res = await dato.json()
    # horario = models.Horario
    # horario.hor_dia = res['hor_dia']
    # horario.hor_hora = res['hor_hora']
    # horario.hor_tipo = res['hor_tipo']
    # horario.ma_of_id = res['ma_of_id']
    
    res2 = horario_controller.put_horario_fijo(db,usu_correo,res )

    db.close()

    return res2

@app.put('/agregar-horario-tutor-sesion/{usu_correo}',)
async def agregar_horario_sesion(dato:Request,usu_correo:str,):
    res = await dato.json()
    
    res2 = horario_controller.put_horario_sesion(usu_correo, res)

    return res2

@app.put('/actualizar-horario-tutor-fijo/',)
async def actualizar_horario_fijo(horario:Request,):
    res = await horario.json()
    hor_id = res['hor_id']
    hor_dia = res['hor_dia']
    hor_hora = res["hor_hora"]
    ma_of_id = res['ma_of_id']
    usu_id = res['usu_id']
    
    res2 = horario_controller.update_horario_fijo(hor_id, hor_dia, hor_hora,ma_of_id,usu_id)

    return res2

@app.put('/actualizar-horario-tutor-sesion/',)
async def actualizar_horario_fijo(horario:Request,):
    res = await horario.json()
    hor_id = res['hor_id']
    ma_of_id = res['ma_of_id']
    
    res2 = horario_controller.update_horario_sesion(hor_id,ma_of_id)

    return res2

@app.put('/eliminar-horario-tutor-fijo/',)
async def eliminar_horario_fijo(horario:Request,):
    res = await horario.json()
    hor_id = res['hor_id']
    
    res2 = horario_controller.eliminar_horario_fijo(hor_id)

    return res2

############################################################################
################################ ASISTENCIA ################################
############################################################################
@app.get('/obtener-toda-asistencia/',)
def get_toda_asistencia():
    res = asistencia_controller.get_toda_asistencia()
    if res is None:
        raise HTTPException(status_code=404, detail="No se encontraron asistencias")
    return res

@app.get('/obtener-asistencia-tutorado/{usu_correo}',)
def get_toda_asistencia(usu_correo:str):
    res = asistencia_controller.get_asisnteica_tutorado(usu_correo)
    if res is None:
        raise HTTPException(status_code=404, detail="No se encontraron asistencias para este usuario")
    return res



@app.put('/agregar-asistencia-tutorado/{usu_correo}',)
async def agregar_horario_sesion(dato:Request,usu_correo:str,):
    res = await dato.json()
    asistencia = models.Asistencia()
    asistencia.asi_tema = res["asi_tema"]
    asistencia.asi_horas = res["asi_horas"]
    asistencia.asi_tipo = ""
    asistencia.doc_id_api = res["doc_id_api"]
    asistencia.hor_id = res["hor_id"]

    
    res2 = asistencia_controller.put_asistencia_tutorado(usu_correo, asistencia)

    return res2


##############################################################################
################################ COORDINACION ################################
##############################################################################
@app.get('/obtener-coordinaicon-tutor/{usu_correo}',)
def get_toda_asistencia(usu_correo:str):
    res = coordinacion_controller.get_coodfinaciones_tutor(usu_correo)
    if res is None:
        raise HTTPException(status_code=404, detail="No se encontraron asistencias para este usuario")
    return res
@app.get('/obtener-coordinaicon-por_id/{coo_id}',)
def get_toda_asistencia(coo_id:int):
    res = coordinacion_controller.get_coodfinaciones_por_id(coo_id)
    if res is None:
        raise HTTPException(status_code=404, detail="No se encontraron asistencias para este usuario")
    return res

@app.put('/agregar-coordinaicon/{usu_correo}',)
async def agregar_horario_sesion(dato:Request,usu_correo:str,):
    res = await dato.json()
    res2 = coordinacion_controller.put_coordinacion(res,usu_correo)

    return res2

@app.put('/editar-coordinaicon/',)
async def agregar_horario_sesion(dato:Request):
    res = await dato.json()
    res2 = coordinacion_controller.update_coordinacion(res)

    return res2

@app.put('/eliminar-coordinaicon/',)
async def agregar_horario_sesion(dato:Request):
    res = await dato.json()
    res2 = coordinacion_controller.delete_coordinacion(res)

    return res2



