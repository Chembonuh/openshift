FROM centos/python-35-centos7

# Upgrade pip and setuptools to avoid compatibility issues
RUN pip install --upgrade pip setuptools
# Upgrade pip

WORKDIR /usr/src/app

COPY . .

RUN pip install  -r requirements.txt

EXPOSE 5000

ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

CMD ["flask", "run"]
