from sqlalchemy.orm import Session
from sqlalchemy import func, or_

from model import models


def get_menus(db: Session, menu_id):
    return db.query(models.Menu).filter(
                models.Menu.men_id == menu_id
            ).first()

def get_menu_correo(db: Session, usu_correo):
    res= db.query(models.Menu).filter(
            models.Acceso.men_id == models.Menu.men_id,
            models.Acceso.tu_id == models.TipoUsuario.tu_id,
            models.TipoUsuario.tu_id == models.Usuario.tu_id,
            models.Usuario.usu_correo == usu_correo,
            models.Menu.men_tipo != 'H',
        ).all()

    return res

def get_menu_hijos(db: Session, men_fkid):
    res= db.query(models.Menu).filter(
            models.Menu.men_fkid == men_fkid,
        ).all()

    return res

def get_usuario(db: Session, usu_correo):
    return db.query(models.Usuario).filter(
            models.Usuario.usu_correo == usu_correo
        ).first()

