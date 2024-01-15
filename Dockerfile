FROM alpine:latest

RUN apk add --update --no-cache python3 py-pip tzdata && ln -sf python3 /usr/bin/python
WORKDIR /app
COPY fireflyiii-monobank-importer/requirements .
RUN pip install -r requirements
RUN rm requirements

COPY fireflyiii-monobank-importer/main.py .
COPY fireflyiii-monobank-importer/fireflyiii.py .
COPY fireflyiii-monobank-importer/monobank.py .

COPY cronconfig /etc/crontabs/root

CMD ["crond", "-f"]
