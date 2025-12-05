FROM ghcr.io/gitroomhq/postiz-app:latest

# Force the network door open
ENV HOSTNAME=0.0.0.0
ENV HOST=0.0.0.0
ENV PORT=4200

# Overwrite the internal config file that is blocking us
RUN echo "HOSTNAME=0.0.0.0" > /app/.env
RUN echo "HOST=0.0.0.0" >> /app/.env
RUN echo "PORT=4200" >> /app/.env
