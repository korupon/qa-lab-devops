FROM python:3.8-slim
RUN pip install pytest
COPY ./tests /tests
CMD ["pytest", "/tests"]