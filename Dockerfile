FROM python:3-slim-buster

RUN apt-get update && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /tmp
RUN pip3 install --no-cache-dir -r /tmp/requirements.txt

COPY exporter.py /usr/local/bin/homematic_exporter

ENTRYPOINT [ "/usr/local/bin/homematic_exporter" ]

EXPOSE 8010
