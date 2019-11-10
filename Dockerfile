FROM alpine:3.10.3
ENV PYTHON_VERSION 3.8.0
RUN apk update \
    && apk add build-base zlib-dev openssl-dev libffi-dev \
    && wget -O python.tar.xz "https://www.python.org/ftp/python/${PYTHON_VERSION%%[a-z]*}/Python-$PYTHON_VERSION.tar.xz" \
    && mkdir -p /usr/src/python \
    && tar -xJC /usr/src/python --strip-components=1 -f python.tar.xz \
    && rm python.tar.xz \
    && cd /usr/src/python \
    && ./configure --enable-optimizations \
    && make \
    && make install \
    && wget -O get-pip.py "https://bootstrap.pypa.io/get-pip.py" \
    && python3 get-pip.py \
    && rm get-pip.py
