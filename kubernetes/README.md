## Bootstrap process

- Prepare talos instances (netboot.xyz)
- Update talconfig in kubernetes/{cluster}/bootstrap/talos/talconfig.yaml. IP, image etc.
- Hard reset if needed: `task talos:hard-nuke cluster=test`
- Run bootstrap `task bootstrap:test`
