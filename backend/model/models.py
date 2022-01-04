from sqlalchemy import Boolean, Column, ForeignKey, Integer, String, Date
from sqlalchemy.orm import relationship

from connection.database import Base

class Menu(Base):
    __tablename__ = 'menu'

    men_id = Column(Integer, primary_key=True, index=True)
    men_descripcion = Column(String(length=50))
    men_url = Column(String(length=200))
    men_icono = Column(String(length=100))
    men_estado = Column(String(length=1))
    men_tipo = Column(String(length=1))
    men_fkid = Column(Integer, ForeignKey('menu.men_id'))

    acc_ref = relationship('Acceso', back_populates='men_ref')
    # men_ref = relationship('Menu', back_populates='men_ref')


class TipoUsuario(Base):
    __tablename__ = 'tipo_usuario'

    tu_id = Column(Integer, primary_key=True, index=True)
    tu_descripcion = Column(String(length=20))
    tu_estado = Column(String(length=1))

    usu_ref = relationship('Usuario', back_populates='tu_ref')
    acc_ref = relationship('Acceso', back_populates='tu_ref')

class Usuario(Base):
    __tablename__ = 'usuario'

    usu_id = Column(Integer, primary_key=True, index=True)
    usu_correo = Column(String(length=50))
    usu_nombre = Column(String(length=60))
    usu_estado = Column(String(length=1))
    usu_telefono = Column(String(length=10))
    usu_beca = Column(String(length=10))
    usu_nivel = Column(Integer)
    usu_carrera = Column(String(length=150))
    usu_razon = Column(String(length=150))
    tu_id = Column(Integer, ForeignKey('tipo_usuario.tu_id'))

    tu_ref = relationship('TipoUsuario', back_populates='usu_ref')


class Acceso(Base):
    __tablename__ = 'acceso'

    acc_id = Column(Integer, primary_key=True, index=True)
    acc_estado = Column(String(length=1))
    acc_acceso = Column(String(length=50))
    men_id = Column(Integer, ForeignKey('menu.men_id'))
    tu_id = Column(Integer, ForeignKey('tipo_usuario.tu_id'))

    men_ref = relationship('Menu', back_populates='acc_ref')
    tu_ref = relationship('TipoUsuario', back_populates='acc_ref')






