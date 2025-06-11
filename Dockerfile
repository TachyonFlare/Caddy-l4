FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-l4 \
    --with github.com/mholt/caddy-l4/caddyfile

FROM alpine:3.18

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

ENTRYPOINT [ "caddy" ]

CMD ["run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
