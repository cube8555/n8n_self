FROM n8nio/n8n:latest

# 작업 디렉토리 설정
WORKDIR /home/node

# 환경 변수 설정
ENV NODE_ENV=production \
    N8N_HOST=0.0.0.0 \
    N8N_PORT=5678 \
    N8N_PROTOCOL=https \
    N8N_BASIC_AUTH_ACTIVE=true \
    N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false \
    GENERIC_TIMEZONE=Asia/Seoul \
    TZ=Asia/Seoul

# 포트 노출
EXPOSE 5678

# npx를 사용하여 n8n 실행
CMD ["npx", "n8n", "start"]
