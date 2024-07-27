FROM python:3.12

# 
WORKDIR /code

# 
COPY ./requirements.txt /code/requirements.txt


RUN python3 -m venv venv

RUN source venv/bin/activate

# 
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# 
COPY ./ /code/

# 
CMD ["gunicorn", "main:app", "--workers", "4", "--worker-class", "uvicorn.workers.UvicornWorker", "--bind", "0.0.0.0", "--port", "80"]