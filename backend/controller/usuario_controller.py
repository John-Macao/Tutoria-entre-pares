from sqlalchemy.orm import Session
from sqlalchemy import func, or_

from model import models

from connection import database as db

def get_usuario(usu_correo):
    return db.session.query(models.Usuario).filter(
            models.Usuario.usu_correo == usu_correo
        ).first()

def get_usuario_por_id(usu_id):
    res = db.session.query(models.Usuario).get(usu_id)
    return res

def get_usuario_por_cedula(usu_cedula):
    res = db.session.query(models.Usuario).filter(
            models.Usuario.usu_cedula == usu_cedula
        ).first()
    return res

def get_usuario_tutores():
    res = db.session.query(models.Usuario).filter(
            models.Usuario.tu_id == 2
        ).all()
    return res

def get_usuario_nombre(usu_correo):
    return db.session.query(models.Usuario.usu_nombre).filter(
            models.Usuario.usu_correo == usu_correo
        ).first()

def get_usuario_telefono(usu_correo):
    return db.session.query(models.Usuario.usu_telefono).filter(
            models.Usuario.usu_correo == usu_correo
        ).first()

def get_usuario_rol(usu_correo):
    return db.session.query(models.TipoUsuario.tu_descripcion).filter(
            models.Usuario.usu_correo == usu_correo,
            models.Usuario.tu_id == models.TipoUsuario.tu_id
        ).first()

def get_usuario_id(usu_correo):
    return db.session.query(models.Usuario.usu_id).filter(
            models.Usuario.usu_correo == usu_correo
        ).first()

def update_usuario_telefono(usu_correo, usu_telefono):
    comprobacion = get_usuario(usu_correo)

    comprobacion.usu_telefono = usu_telefono
    db.session.commit()
    return True

def update_usuario_razon(usu_correo, usu_razon):
    comprobacion = get_usuario(usu_correo)

    comprobacion.usu_razon = usu_razon
    db.session.commit()
    return True

def update_usuario_a_tutor(usu_id, usu_beca, usu_nivel,usu_carrera,tu_id):
    comprobacion = get_usuario_por_id(usu_id)
    comprobacion.usu_beca = usu_beca
    comprobacion.usu_nivel = usu_nivel
    comprobacion.usu_carrera = usu_carrera
    comprobacion.tu_id = tu_id

    db.session.commit()
    return True

def update_usuario_a_tutorado(usu_id):
    comprobacion = get_usuario_por_id(usu_id)
    comprobacion.tu_id = 3

    db.session.commit()
    return True

def put_usuario(res):
    usuario = models.Usuario()
    usuario.usu_correo = res["usu_correo"]
    usuario.usu_nombre = res["usu_nombre"]
    usuario.usu_cedula = res["usu_cedula"]
    usuario.usu_estado = 'A'
    usuario.usu_telefono = res["usu_telefono"]
    usuario.usu_beca = res['usu_beca']
    usuario.usu_nivel = res["usu_nivel"]
    usuario.usu_carrera = res['usu_carrera']
    usuario.usu_razon = res["usu_razon"]
    usuario.tu_id = res['tu_id']

    db.session.add(usuario)
    db.session.commit()

    return True