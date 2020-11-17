FROM python:3.7-alpine
WORKDIR /code
ENV FLASK_APP app.py
ENV FLASK_RUN_HOST 0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
RUN pip3.7 config set global.index-url https://pypi.douban.com/simple/ && pip3.7 install -r requirements.txt
COPY . .
CMD ["flask", "run"]
