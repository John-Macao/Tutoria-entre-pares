from sqlalchemy.orm import Session
from sqlalchemy import func, or_

from model import models

from connection import database as db

def get_usuario(usu_correo):
    return db.session.query(models.Usuario).filter(
            models.Usuario.usu_correo == usu_correo
        ).first()

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

def update_usuario_telefono(usu_id, usu_telefono):
    comprobacion = get_usuario(usu_id)

    comprobacion.usu_telefono = usu_telefono
    db.session.commit()
    return True
