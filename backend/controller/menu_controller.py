from sqlalchemy.orm import Session
from sqlalchemy import func, or_

from model import models

from connection import database as db

# def get_menus():
#     return db.session.query(models.Menu).all()

# def put_menu(descripcion):
#     menu = models.Menu()
#     menu.men_descripcion = descripcion
#     menu.men_url = 'url'
#     menu.men_icono = 'icono'
#     menu.men_estado = 'A'

#     db.session.add(menu)
#     db.session.commit()
#     return True

# def update_menu(id, descripcion):
#     menu = db.session.query(models.Menu).get(id)

#     menu.men_descripcion = descripcion

#     db.session.commit()


def get_menu_correo(usu_correo):
    res= db.session.query(models.Menu).filter(
            models.Acceso.men_id == models.Menu.men_id,
            models.Acceso.tu_id == models.TipoUsuario.tu_id,
            models.TipoUsuario.tu_id == models.Usuario.tu_id,
            models.Usuario.usu_correo == usu_correo,
            models.Menu.men_tipo != 'H',
        ).order_by(models.Menu.men_id).all()

    return res

def get_menu_hijos(men_fkid):
    res= db.session.query(models.Menu).filter(
            models.Menu.men_fkid == men_fkid,
        ).all()
    return res

def get_usuario(usu_correo):
    return db.session.query(models.Usuario).filter(
            models.Usuario.usu_correo == usu_correo
        ).first()

