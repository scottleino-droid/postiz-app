FROM ghcr.io/gitroomhq/postiz-app:latest

# 1. Force environment variables to allow outside connections
ENV HOSTNAME=0.0.0.0
ENV HOST=0.0.0.0
ENV PORT=4200

# 2. BRUTE FORCE: Overwrite the internal .env file that locks it to localhost
RUN echo "HOSTNAME=0.0.0.0" > /app/.env
RUN echo "HOST=0.0.0.0" >> /app/.env
RUN echo "PORT=4200" >> /app/.env
