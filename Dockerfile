FROM ghcr.io/gitroomhq/postiz-app:latest

# Set environment for Render
ENV HOST=0.0.0.0
ENV HOSTNAME=0.0.0.0
ENV PORT=10000  # Let Render handle the dynamic port; don't hard-code 4200
ENV NODE_ENV=production

# Patch the frontend package.json to use $PORT and 0.0.0.0 (bypasses all caching)
RUN sed -i 's/next start -p 4200/next start -p $PORT --hostname 0.0.0.0/g' /app/apps/frontend/package.json && \
    sed -i '/"pm2":/d' /app/apps/frontend/package.json  # Remove PM2 override if present

# Expose the Render port
EXPOSE $PORT

# Start the app (official entrypoint, but now with fixed config)
CMD ["pnpm", "run", "pm2-run"]
