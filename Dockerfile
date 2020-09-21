FROM buildpack-deps:buster

RUN apt-get update && apt-get install -y --no-install-recommends \
        texinfo \
        yasm \
	&& rm -rf /var/lib/apt/lists/*

RUN set -ex \
        \
        && mkdir -p /usr/src/mpir \
        && git clone https://github.com/wbhart/mpir.git /usr/src/mpir \
	    \
        && cd /usr/src/mpir \
        && ./autogen.sh \
        && mkdir /usr/local/mpir \
	    && ./configure --enable-cxx --prefix=/usr/local/mpir \
	    && make install \
	    && make check \
        && rm -rf /usr/src/mpir
