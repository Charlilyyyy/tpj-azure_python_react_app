from sqlalchemy import Column, String, DateTime, Text, Boolean
from sqlalchemy.dialects.postgresql import UUID
from sqlalchemy.sql import func
from db.base import Base
import uuid

class User(Base):
    __tablename__ = "users"
    
    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    username = Column(String(100), nullable=False, unique=True)
    password = Column(Text, nullable=False)
    country_code = Column(String(5))
    phone = Column(String(20))
    profile_image_url = Column(Text)
    deleted_at = Column(DateTime(timezone=True))
    name = Column(Text)
    email = Column(String(255), nullable=False, unique=True)
    created_at = Column(DateTime(timezone=True), server_default=func.now())
    updated_at = Column(DateTime(timezone=True), server_default=func.now(), onupdate=func.now())
    email_token = Column(String(255))
    
    class Config:
        orm_mode = True
