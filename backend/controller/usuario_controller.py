from sqlalchemy.orm import Session
from sqlalchemy import func, or_

from model import models

def get_usuario(db: Session, usu_correo):
    return db.query(models.Usuario).filter(
            models.Usuario.usu_correo == usu_correo
        ).first()

def get_usuario_rol(db: Session, usu_correo):
    return db.query(models.TipoUsuario.tu_descripcion).filter(
            models.Usuario.usu_correo == usu_correo,
            models.Usuario.tu_id == models.TipoUsuario.tu_id
        ).first()