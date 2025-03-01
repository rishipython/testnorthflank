FROM nvidia/cuda:12.2.0-runtime-ubuntu20.04

WORKDIR /app

# Install Python and dependencies
RUN apt-get update && apt-get install -y python3 python3-pip && rm -rf /var/lib/apt/lists/*
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .
CMD ["python3", "main.py"]
