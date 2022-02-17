from fastapi.security import base
from sqlalchemy import create_engine, MetaData
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from sqlalchemy.engine.url import URL
from sqlalchemy.ext.automap import automap_base

from sqlalchemy.pool import NullPool


connect_url = URL(
    "postgresql+psycopg2",
    username="postgres",
    password="Sistemas123",
    host="localhost",
    port="5432",
    database="base"
)

engine = create_engine(connect_url, max_identifier_length=128, poolclass=NullPool)

SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
session = SessionLocal()


Base = declarative_base()





