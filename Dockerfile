FROM lscr.io/linuxserver/webtop:ubuntu-xfce

# Install Node.js (LTS) and OpenClaw
RUN apt-get update \
 && apt-get install -y curl ca-certificates \
 && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
 && apt-get install -y nodejs \
 && npm install -g openclaw \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Optional: set a default command (leave unset for webtop defaults)
# CMD ["openclaw"]

# Hint for persistent OpenClaw config (bind-mount at runtime)
VOLUME ["/home/ubuntu/.openclaw"]
