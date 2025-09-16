# Node.js 베이스 이미지 사용
FROM node:18-alpine

# 필요한 패키지 설치
RUN apk add --no-cache \
    ca-certificates \
    bash \
    tini \
    su-exec \
    git

# n8n 설치
RUN npm install -g n8n

# n8n 사용자 생성
RUN addgroup -g 1000 n8n && \
    adduser -D -u 1000 -G n8n n8n && \
    mkdir -p /home/n8n/.n8n && \
    chown -R n8n:n8n /home/n8n

# 사용자 전환
USER n8n

# 작업 디렉토리
WORKDIR /home/n8n

# 환경 변수
ENV NODE_ENV=production \
    N8N_HOST=0.0.0.0 \
    N8N_PORT=5678 \
    N8N_PROTOCOL=https \
    N8N_BASIC_AUTH_ACTIVE=true \
    N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false \
    N8N_USER_FOLDER=/home/n8n/.n8n \
    GENERIC_TIMEZONE=Asia/Seoul \
    TZ=Asia/Seoul

# 포트
EXPOSE 5678

# tini를 사용한 실행
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["n8n", "start"]
