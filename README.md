## Requirements

### Mise

https://mise.jdx.dev/

## Ansible execution requirements

- User to connect with (rsa key)
- Sudo right
- No password requirement for sudo

Note: currently connection uses root user but this will change

## Create servers on PVE

```
./tfrun.sh init
./tfrun.sh login # optional
./tfrun.sh apply
```

## Log and metric collection communication

![](doc/comm.png)

## Design decisions

- Secrets are stored (vault like) in encrypted_secrets.sh
- Home network has two entry points: cloudflare tunnel and frp tunnel
- Most internal services use traefik reverse proxy
- Internal domain: 04a.ca
- Internal domain used by services (traefik): home.04a.ca
- External and internal domain used by frp tunnel: tunnel.04a.ca
- External domain used by cloudflare tunnel: star4.dev
