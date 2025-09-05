from pydantic import BaseModel, EmailStr
from typing import Optional
from datetime import datetime
import uuid

class User(BaseModel):
    username: str
    email: EmailStr
    name: Optional[str] = None
    country_code: Optional[str] = None
    phone: Optional[str] = None
    profile_image_url: Optional[str] = None

class UserCreate(User):
    password: str

class UserLogin(BaseModel):
    username: str
    password: str

class UserResponse(User):
    id: uuid.UUID
    created_at: datetime
    updated_at: datetime
    
    class Config:
        orm_mode = True

class Token(BaseModel):
    access_token: str
    token_type: str

class TokenData(BaseModel):
    username: Optional[str] = None 