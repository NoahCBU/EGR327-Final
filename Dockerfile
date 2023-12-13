FROM alpine:latest
RUN apk update
RUN apk add py-pip
RUN apk add --no-cache python3-dev


RUN python3 -m venv /opt/venv


RUN . /opt/venv/bin/activate && pip install --upgrade pip
WORKDIR /app
COPY . /app
RUN . /opt/venv/bin/activate && pip --no-cache-dir install -r requirements.txt
CMD ["python3", "app.py"]