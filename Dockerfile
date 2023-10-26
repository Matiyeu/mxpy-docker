FROM python:3.10 AS builder

RUN apt update && apt install -y libncurses5

RUN useradd -m mx
WORKDIR /home/mx

USER mx

FROM builder

RUN wget -O mxpy-up.py https://raw.githubusercontent.com/multiversx/mx-sdk-py-cli/main/mxpy-up.py
RUN pip3 install wheel
RUN python mxpy-up.py --not-interactive --verbose

ENV PATH="/home/mx/multiversx-sdk:${PATH}"
