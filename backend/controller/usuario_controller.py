from sqlalchemy.orm import Session
from sqlalchemy import func, or_

from model import models

from connection import database as db

def get_usuario(usu_correo):
    return db.session.query(models.Usuario).filter(
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