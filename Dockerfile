FROM python:alpine3.19

ARG VERSION=0.0.0

RUN mkdir -p /open3e
WORKDIR /open3e

RUN pip install --index-url https://test.pypi.org/simple/ --extra-index-url https://pypi.org/simple open3e-lgraf==${VERSION}

CMD open3e @args
