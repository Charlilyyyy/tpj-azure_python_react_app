# app/main.py

from fastapi import FastAPI
from api.router import api_router
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(
    title="My FastAPI App",
    version="1.0.0",
)

# Allow requests from your frontend
origins = [
    "http://localhost:5173",  # React dev server
    "http://127.0.0.1:5173",  # sometimes React runs here
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,         # or ["*"] to allow all origins
    allow_credentials=True,
    allow_methods=["*"],           # GET, POST, PUT, DELETE etc.
    allow_headers=["*"],           # Authorization, Content-Type etc.
)

app.include_router(api_router, prefix="/api/v1")
