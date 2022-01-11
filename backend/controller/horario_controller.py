from sqlalchemy.orm import Session
from sqlalchemy import func, or_

from model import models
from controller import usuario_controller

from connection import database as db

def get_horario(hor_id):
    res = db.session.query(models.Horario).get(hor_id)
    return res

def get_horarios_fijos(usu_correo):
    usu_id = usuario_controller.get_usuario_id(usu_correo)[0]
    return db.session.query(models.Horario).filter(
            models.Horario.usu_id == usu_id,
            models.Horario.hor_tipo == 'Fijo'
        ).all()

def get_horarios_sesion(usu_correo):
    usu_id = usuario_controller.get_usuario_id(usu_correo)[0]
    return db.session.query(models.Horario).filter(
            models.Horario.hor_tipo == 'Sesion',
            models.Horario.usu_id == usu_id
        ).all()
    
def put_horario_fijo(usu_correo, horario:models.Horario):
    usu_id = usuario_controller.get_usuario_id(usu_correo)[0]

    hor = models.Horario()
    hor.usu_id = usu_id
    hor.hor_hora = horario.hor_hora
    hor.hor_dia = horario.hor_dia
    hor.hor_tipo = horario.hor_tipo
    hor.ma_of_id = horario.ma_of_id
    # horario.hor_fecha = datetime.today().strftime('%A, %B %d, %Y %H:%M:%S')

    db.session.add(hor)
    db.session.commit()
    return True

def put_horario_sesion(usu_correo, horario:models.Horario):
    usu_id = usuario_controller.get_usuario_id(usu_correo)[0]

    hor = models.Horario()
    hor.usu_id = usu_id
    hor.hor_hora = horario.hor_hora
    hor.hor_dia = horario.hor_dia
    hor.hor_tipo = horario.hor_tipo
    hor.hor_fecha = horario.hor_fecha
    hor.ma_of_id = horario.ma_of_id
    
    db.session.add(hor)
    db.session.commit()
    return True

def update_horario_fijo(hor_id, hor_dia, hor_hora,ma_of_id,usu_id):
    comprobacion = get_horario(hor_id)

    comprobacion.hor_dia = hor_dia
    comprobacion.hor_hora = hor_hora
    comprobacion.ma_of_id = ma_of_id
    db.session.commit()

    return True

def eliminar_horario_fijo(hor_id):
    comprobacion = get_horario(hor_id)

    db.session.delete(comprobacion)
    db.session.commit()

    return True
