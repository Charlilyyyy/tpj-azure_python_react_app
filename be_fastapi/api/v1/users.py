# from fastapi import APIRouter, Depends, HTTPException
# from sqlalchemy.orm import Session
# from app.schemas.user import UserCreate, UserRead
# from app.services.user_service import create_user
# from app.api.deps import get_db

# router = APIRouter()

# @router.post("/", response_model=UserRead)
# def register_user(user_in: UserCreate, db: Session = Depends(get_db)):
#     user = create_user(db, user_in)
#     if not user:
#         raise HTTPException(status_code=400, detail="User registration failed")
#     return user

from fastapi import APIRouter
from schemas import User
from seeders import users_data

router = APIRouter()

@router.get("/", response_model=list[User])
def get_users():
    return users_data
