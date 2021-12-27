from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from sqlalchemy.engine.url import URL


connect_url = URL(
    "oracle+cx_oracle",
    username="system",
    password="ka29kai9",
    host="localhost",
    port="1521",
    database="XE"
)

engine = create_engine(connect_url, max_identifier_length=128)

SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()