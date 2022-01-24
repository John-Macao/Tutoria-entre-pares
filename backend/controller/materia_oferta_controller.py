from sqlalchemy.orm import Session
from sqlalchemy import func, or_
from model import models

from model import models
from controller import usuario_controller

from connection import database as db

def get_materias_unica():
    return db.session.query(models.MateriaOferta).distinct(models.MateriaOferta.id_materia_api).all()

def get_materias_por_materia(id_materia_api):
    return db.session.query(models.MateriaOferta).filter(
            models.MateriaOferta.id_materia_api == id_materia_api,
            models.MateriaOferta.ma_of_estado == 'A'
        ).all()

def get_materia_por_id(ma_of_id):
    res = db.session.query(models.MateriaOferta).get(ma_of_id)
    return res

def get_materias_tutor(usu_correo):
    return db.session.query(models.MateriaOferta).filter(
            models.MateriaOferta.usu_id == models.Usuario.usu_id,
            models.Usuario.usu_correo == usu_correo,
            models.MateriaOferta.ma_of_estado == 'A'
        ).all()

def comprobar_materia(id_materia_api, usu_id):
    return db.session.query(models.MateriaOferta).filter(
            models.MateriaOferta.id_materia_api == id_materia_api,
            models.MateriaOferta.usu_id == usu_id
        ).first()

def put_materias_tutor(id_materia_api, usu_correo):
    usu_id = usuario_controller.get_usuario_id(usu_correo)[0]
    comprobacion = comprobar_materia(id_materia_api, usu_id)

    if comprobacion is None:
        materia = models.MateriaOferta()
        materia.usu_id = usu_id
        materia.id_materia_api = id_materia_api
        materia.ma_of_estado = 'A'
        
        db.session.add(materia)
        db.session.commit()
    else:
        comprobacion.ma_of_estado = 'A'
        db.session.commit()
    return True

def deshabilitar_materias_tutor(id_materia_api, usu_correo):
    usu_id = usuario_controller.get_usuario_id(usu_correo)[0]
    comprobacion = comprobar_materia(id_materia_api, usu_id)

    if comprobacion is not None:
        comprobacion.ma_of_estado = 'D'
        db.session.commit()
    return True

