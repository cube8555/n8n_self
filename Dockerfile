FROM n8nio/n8n:latest

# 작업 디렉토리 설정
WORKDIR /home/node

# 환경 변수 설정
ENV NODE_ENV=production
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV GENERIC_TIMEZONE=Asia/Seoul
ENV TZ=Asia/Seoul


# n8n 실행
# 포트 노출
EXPOSE 5678

# n8n 실행 (전체 경로 지정)
CMD ["node", "/usr/local/lib/node_modules/n8n/bin/n8n", "start"]
