from sqlalchemy import (Boolean, Column, DateTime, ForeignKey, Integer,
                        Numeric, String)
from sqlalchemy.ext.declarative import declared_attr
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
from sqlalchemy.sql.expression import column, null
from sqlalchemy.sql.sqltypes import Date

from connection.database import Base

class Menu(Base):
    __tablename__ = 'menu'

    men_id = Column(Integer, primary_key=True, autoincrement=True, index=True)
    men_descripcion = Column(String)
    men_url = Column(String)
    men_icono = Column(String)
    men_estado = Column(String)
    men_tipo = Column(String)

    men_fkid = Column(Integer, ForeignKey('menu.men_id', ondelete="CASCADE"), nullable=True)
    
class TipoUsuario(Base):
    __tablename__ = "tipo_usuario"

    tu_id = Column(Integer, primary_key=True, autoincrement=True, index=True)
    tu_descripcion = Column(String)
    tu_estado = Column(String)


class Usuario(Base):
    __tablename__ = 'usuario'

    usu_id = Column(Integer, primary_key=True, autoincrement=True, index=True)
    usu_correo = Column(String)
    usu_nombre = Column(String)
    usu_cedula = Column(String)
    usu_estado = Column(String)
    usu_telefono = Column(String, nullable=True)
    usu_beca = Column(String)
    usu_nivel = Column(Integer)
    usu_carrera = Column(String)
    usu_razon = Column(String, nullable=True)
    tu_id = Column(Integer, ForeignKey(
        'tipo_usuario.tu_id', ondelete='CASCADE'))
    tipo = relationship("TipoUsuario", foreign_keys=[tu_id])

class Acceso(Base):
    __tablename__ = 'acceso'

    acc_id = Column(Integer, primary_key=True, autoincrement=True, index=True)
    acc_estado = Column(String)
    acc_acceso = Column(String)
    men_id = Column(Integer, ForeignKey('menu.men_id', ondelete="CASCADE"))
    tu_id = Column(Integer, ForeignKey('tipo_usuario.tu_id', ondelete="CASCADE"))

class MateriaOferta(Base):
    __tablename__ = 'materia_oferta'

    ma_of_id = Column(Integer, primary_key=True, autoincrement=True, index=True)
    ma_of_estado = Column(String)
    id_materia_api = Column(Integer)
    usu_id = Column(Integer, ForeignKey('usuario.usu_id'))
    # usuario = relationship('Usuario',foreign_keys=[usu_id])

class Horario(Base):
    __tablename__ = 'horario'

    hor_id = Column(Integer, primary_key=True, autoincrement=True, index=True)
    hor_dia = Column(String)
    hor_hora = Column(String)
    hor_fecha = Column(Date, nullable=True)
    hor_tipo = Column(String)
    ma_of_id = Column(Integer, ForeignKey('materia_oferta.ma_of_id'))
    # materia = relationship('MeteriaOferta',foreign_keys=[ma_of_id])
    usu_id = Column(Integer, ForeignKey('usuario.usu_id'))
    # usuario = relationship('Usuario', foreign_keys=[usu_id])


class Asistencia(Base):
    __tablename__ = 'asistencia'

    asi_id = Column(Integer, primary_key=True, autoincrement=True, index=True)
    asi_tema = Column(String)
    asi_horas = Column(Integer)
    asi_tipo = Column(String)
    doc_id_api = Column(Integer)
    hor_id = Column(Integer, ForeignKey('horario.hor_id'))
    #horario = relationship('Horario', foreign_keys=[hor_id])
    usu_id = Column(Integer, ForeignKey('usuario.usu_id'))
    #usuario = relationship('Usuario', foreign_keys=[usu_id]) 

class Coordinacion(Base):
    __tablename__ = 'coordinacion'

    coo_id  = Column(Integer, primary_key=True, autoincrement=True, index=True)
    coo_asignatura = Column(String)
    coo_docente = Column(String)
    coo_comentario = Column(String)
    coo_fecha = Column(Date)
    usu_id = Column(Integer, ForeignKey('usuario.usu_id'))
