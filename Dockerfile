FROM node:18-alpine

RUN apk add --no-cache bash git openssh

RUN npm install -g n8n

RUN mkdir -p /home/node/.n8n && \
    chmod 777 /home/node/.n8n

WORKDIR /home/node

ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV GENERIC_TIMEZONE=Asia/Seoul

EXPOSE 5678

CMD ["n8n", "start"]
