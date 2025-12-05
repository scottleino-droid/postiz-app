FROM ghcr.io/gitroomhq/postiz-app:latest

# Force correct host binding
ENV HOST=0.0.0.0
ENV HOSTNAME=0.0.0.0
ENV NODE_ENV=production

# THIS IS THE WINNING LINE — overrides the broken PM2 start completely
ENV START_CMD="next start -p \$PORT --hostname 0.0.0.0"

# Optional: expose Render's dynamic port
EXPOSE $PORT
