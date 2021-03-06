from sqlalchemy.orm import Session
from sqlalchemy import func, or_

from model import models
from controller import usuario_controller

from connection import database as db

def get_coodfinaciones_por_id(id):
    return db.session.query(models.Coordinacion).get(id)

def get_coodfinaciones_tutor(usu_correo):
    usu_id = usuario_controller.get_usuario_id(usu_correo)[0]
    return db.session.query(models.Coordinacion).filter(
            models.Coordinacion.usu_id == usu_id
        ).order_by(models.Coordinacion.coo_id.desc()).all()

def put_coordinacion(res, usu_correo):
    usu_id = usuario_controller.get_usuario_id(usu_correo)[0]
    coordinacion = models.Coordinacion()
    coordinacion.coo_asignatura = res["coo_asignatura"]
    coordinacion.coo_docente = res["coo_docente"]
    coordinacion.coo_comentario = res["coo_comentario"]
    coordinacion.coo_fecha = res["coo_fecha"]
    coordinacion.usu_id = usu_id

    db.session.add(coordinacion)
    db.session.commit()

    return True

def update_coordinacion(res):
    coordinacion = get_coodfinaciones_por_id(res["coo_id"])

    coordinacion.coo_asignatura = res["coo_asignatura"]
    coordinacion.coo_docente = res["coo_docente"]
    coordinacion.coo_comentario = res["coo_comentario"]
    coordinacion.coo_fecha = res["coo_fecha"]

    db.session.commit()

    return True

def delete_coordinacion(res):
    coordinacion = get_coodfinaciones_por_id(res["coo_id"])

    db.session.delete(coordinacion)
    db.session.commit()

    return True