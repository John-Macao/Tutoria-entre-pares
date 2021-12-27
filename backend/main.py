from typing import List
import secrets
import requests
import json

from fastapi import Depends, FastAPI, HTTPException, Response, status, Path
from fastapi.security import HTTPBasic, HTTPBasicCredentials

from starlette.status import HTTP_404_NOT_FOUND, HTTP_401_UNAUTHORIZED, \
        HTTP_503_SERVICE_UNAVAILABLE
from sqlalchemy.orm import Session

from controller import menu_controller, usuario_controller
from model import models
from connection.database import SessionLocal, engine


from fastapi.middleware.cors import CORSMiddleware


origins = ['*']


app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

security = HTTPBasic()

# Dependency
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

def is_authenticated(credentials: HTTPBasicCredentials = Depends(security)):
    correct_username = secrets.compare_digest(credentials.username, "user")
    correct_password = secrets.compare_digest(credentials.password, "pass")
    if not (correct_username and correct_password):
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Incorrect login credentials",
            headers={"WWW-Authenticate": "Basic"},
        )
    return True


@app.get(
    '/menu/{usu_correo}',
)
def get_menus(
        usu_correo: str,
        db: Session = Depends(get_db),
        #auth: bool = Depends(is_authenticated),
):
    res = menu_controller.get_menu_correo(db, usu_correo)
    if not res:
        return Response(
            'NO hay menus para este usuario',
            media_type="text/plain",
            status_code=HTTP_404_NOT_FOUND
        )

    return res

@app.get(
    '/menu-hijo/{men_fkid}',
)
def get_menus_hijos(
        men_fkid: int,
        db: Session = Depends(get_db),
        #auth: bool = Depends(is_authenticated),
):
    res = menu_controller.get_menu_hijos(db, men_fkid)
    if not res:
        return Response(
            'NO hay menus para este usuario',
            media_type="text/plain",
            status_code=HTTP_404_NOT_FOUND
        )

    return res


@app.get(
    '/usuarios/{usu_correo}', 
)
def get_usuario(
    usu_correo: str,
    db: Session = Depends(get_db),
    #auth: bool= Depends(is_authenticated)
):
    res = menu_controller.get_usuario(db, usu_correo)
    if res is None:
        raise HTTPException(status_code=404, detail="User not found")
    return res


@app.get(
    '/usuario_rol/{usu_correo}', 
)
def get_usuario_rol(
    usu_correo: str,
    db: Session = Depends(get_db),
    #auth: bool= Depends(is_authenticated)
):
    res = usuario_controller.get_usuario_rol(db, usu_correo)
    if res is None:
        raise HTTPException(status_code=404, detail="User not found")
    return res
