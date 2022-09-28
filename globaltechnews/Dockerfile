FROM python:3.9-alpine3.13

ENV PYTHONUNBUFFERED=1
#copy our app dependecies to the container env
COPY requirements.txt /tmp/requirements.txt
COPY requirements.dev.txt /tmp/requirements.dev.txt
COPY . /app


WORKDIR /app
EXPOSE 8000
ARG DEV=false
#create virtual env
#upgrade pip
#Install dependencies
#create django system user with no home directory or password
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    if [ $DEV = "true" ]; \
        then /py/bin/pip install install -r /tmp/requirements.dev.txt; \
    fi && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        djangoUser

ENV PATH="/py/bin:$PATH"

#letting whooever running the file whoch port will be used by the container

USER djangoUser



