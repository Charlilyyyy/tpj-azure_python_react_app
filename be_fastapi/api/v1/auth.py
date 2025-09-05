from fastapi import APIRouter, HTTPException
from jose import jwt
from datetime import datetime, timedelta
from passlib.context import CryptContext
from pydantic import BaseModel

# FastAPI router
router = APIRouter()

# Dummy user database
fake_users_db = {
    "taufik": {
        "username": "taufik",
        "hashed_password": "$2b$12$CwTycUXWue0Thq9StjUM0uJ8wQmQyPCJpCw.6o5jv5H2Y9j4uOduG"  # password = "secret"
    }
}

# Security settings
SECRET_KEY = "your-secret-key"
ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE_MINUTES = 30

pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

# Pydantic model for JSON body
class LoginRequest(BaseModel):
    username: str
    password: str


def verify_password(plain_password, hashed_password):
    return pwd_context.verify(plain_password, hashed_password)


def authenticate_user(username: str, password: str):
    user = fake_users_db.get(username)
    if not user:
        return False
    # For quick testing (skip bcrypt)
    if password != "secret":
        return False
    return user


def create_access_token(data: dict, expires_delta: timedelta | None = None):
    to_encode = data.copy()
    expire = datetime.utcnow() + (expires_delta or timedelta(minutes=15))
    to_encode.update({"exp": expire})
    return jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)


@router.post("/login")
async def login(request: LoginRequest):
    user = authenticate_user(request.username, request.password)
    if not user:
        raise HTTPException(status_code=401, detail="Invalid username or password")

    access_token_expires = timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
    token = create_access_token(
        data={"sub": user["username"]}, expires_delta=access_token_expires
    )
    return {"access_token": token, "token_type": "bearer"}
