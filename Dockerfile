FROM caddy:builder AS builder

RUN xcaddy build 427bbe99d076a76766266d1386ce16a38ce56fa6 \
    --with github.com/caddy-dns/cloudflare
    
FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
