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
