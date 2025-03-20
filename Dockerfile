# use dedicated builder image to keep final image clean/small
# 1. copy python distribution from build context into image
# 2. install open3e from local distribution in venv, so that the venv can easily be copied to the final image
FROM python:3.13-alpine AS builder

COPY ./dist/ ./dist/

RUN python -m venv /open3e/.venv

ENV PATH="/open3e/.venv/bin:$PATH"
RUN pip install --find-links=./dist/ open3e


FROM python:3.13-alpine

COPY --from=builder /open3e /open3e

WORKDIR /open3e-data

ENV PYTHONUNBUFFERED=1
ENV PATH="/open3e/.venv/bin:$PATH"
ENTRYPOINT ["open3e"]