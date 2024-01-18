## Requirements

### DevBox

https://www.jetpack.io/devbox/

### Direnv

https://direnv.net/docs/hook.html

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
