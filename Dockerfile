FROM scratch
ADD centos-7-x86_64-docker.tar.xz /

LABEL org.label-schema.schema-version="1.0" \
    org.label-schema.name="CentOS Base Image" \
    org.label-schema.vendor="CentOS" \
    org.label-schema.license="GPLv2" \
    org.label-schema.build-date="20190801"

RUN yum install -y libpng12
RUN yum install -y tcsh
RUN yum install -y gcc openssl-devel bzip2-devel
RUN yum install -y wget make

RUN \
  cd /usr/src && \
  wget https://www.python.org/ftp/python/2.7.12/Python-2.7.12.tgz && \
  tar xzf Python-2.7.12.tgz

RUN \
  cd /usr/src/Python-2.7.12 && \
  ./configure && \
  make altinstall

ENV PATH="/usr/src/Python-2.7.12:${PATH}"

CMD ["/bin/bash"]
