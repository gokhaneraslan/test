FROM python:3.12

# 
WORKDIR /code

# 
COPY ./requirements.txt /code/requirements.txt

RUN sudo apt-get update

RUN sudo apt-get upgrade -y

RUN sudo apt-get install python-pip python-venv

RUN python -m venv venv

RUN source venv/bin/activate

# 
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# 
COPY ./ /code/

# 
CMD ["gunicorn", "main:app", "--workers", "4", "--worker-class", "uvicorn.workers.UvicornWorker", "--bind", "0.0.0.0", "--port", "80"]