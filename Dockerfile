FROM node:18-alpine

# 시스템 패키지 설치
RUN apk add --no-cache \
    bash \
    ca-certificates \
    curl \
    git \
    openssh \
    python3 \
    make \
    g++ \
    su-exec

# n8n 전역 설치
RUN npm install -g n8n@latest

# 사용자 생성 및 디렉토리 설정
RUN addgroup -g 1000 n8n && \
    adduser -D -u 1000 -G n8n n8n && \
    mkdir -p /home/n8n/.n8n && \
    chown -R n8n:n8n /home/n8n

# 사용자 변경
USER n8n
WORKDIR /home/n8n

# 환경 변수
ENV NODE_ENV=production \
    N8N_HOST=0.0.0.0 \
    N8N_PORT=5678 \
    N8N_PROTOCOL=https \
    N8N_BASIC_AUTH_ACTIVE=true \
    N8N_USER_FOLDER=/home/n8n/.n8n \
    GENERIC_TIMEZONE=Asia/Seoul \
    TZ=Asia/Seoul

# 포트
EXPOSE 5678

# n8n 실행
CMD ["n8n", "start"]
