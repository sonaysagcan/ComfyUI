FROM python:3.10-slim

WORKDIR /app

RUN apt-get update && apt-get install -y git g++ build-essential libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

RUN pip install opencv-python


COPY . .

CMD ["python3", "main.py", "--cpu", "--listen=0.0.0.0"]