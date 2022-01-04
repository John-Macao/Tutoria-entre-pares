from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from sqlalchemy.engine.url import URL


connect_url = URL(
    "postgresql+psycopg2",
    username="postgres",
    password="ka29kai9",
    host="localhost",
    port="5432",
    database="Tutorias"
)

engine = create_engine(connect_url, max_identifier_length=128)

SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()