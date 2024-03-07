FROM ubunutu:16.04
RUN apt-get update -y && apt-get install -y python python-pip

WORKDIR /usr/src/app

COPY . .

RUN pip install  -r requirements.txt

EXPOSE 5000

ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

CMD ["flask", "run"]
