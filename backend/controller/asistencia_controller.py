from sqlalchemy.orm import Session
from sqlalchemy import func, or_

from model import models
from controller import usuario_controller

from connection import database as db


def get_toda_asistencia():
    return db.session.query(models.Asistencia).all()

def get_asisnteica_tutorado(usu_correo):
    usu_id = usuario_controller.get_usuario_id(usu_correo)[0]
    return db.session.query(models.Asistencia).filter(
            models.Asistencia.usu_id == usu_id
        ).order_by(models.Asistencia.asi_id.desc()).all()
    
def get_una_asistencia(asi_id):
    res = db.session.query(models.Asistencia).get(asi_id)
    return res

def get_asisnteica_tutorado_id(usu_correo):
    usu_id = usuario_controller.get_usuario_id(usu_correo)[0]
    return db.session.query(models.Asistencia.asi_id).filter(
            models.Asistencia.usu_id == usu_id
        ).all()

def put_asistencia_tutorado(usu_correo, asistencia:models.Asistencia):
    usu_id = usuario_controller.get_usuario_id(usu_correo)[0]

    cantidad = get_asisnteica_tutorado_id(usu_correo)

    if(len(cantidad)<2):
        asistencia.asi_tipo = 'Consulta'
    else:
        asistencia.asi_tipo = 'Proceso'
        if(len(cantidad)==2):
            for x in range(len(cantidad)):
                actualizar_tipo_asistencia(cantidad[x])
    
    asistencia.usu_id = usu_id

    db.session.add(asistencia)
    db.session.commit()
    return True

def actualizar_tipo_asistencia(asi_id):
    asi = get_una_asistencia(asi_id)
    asi.asi_tipo = 'Proceso'
    db.session.commit()
    return True

