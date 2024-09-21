FROM debian:bookworm-slim

RUN apt-get update -y && apt-get install -y curl kubernetes-client && \
  mkdir -p --mode=0755 /usr/share/keyrings && \
  curl -fsSL https://pkgs.tailscale.com/stable/debian/bookworm.noarmor.gpg | tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null && \
  curl -fsSL https://pkgs.tailscale.com/stable/debian/bookworm.tailscale-keyring.list | tee /etc/apt/sources.list.d/tailscale.list && \
  apt-get update -y && apt-get install -y tailscale \

ENTRYPOINT ["/entrypoint.sh"]
