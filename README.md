# DevOps Case Study

## Init cluster
```bash
vagrant up
```

## Shutdown cluster
```bash
vagrant halt
```

## Destroy cluster
```bash
vagrant destroy -f
```

## Example Ansbile Command
```bash
PYTHONUNBUFFERED=1 ANSIBLE_FORCE_COLOR=true ANSIBLE_HOST_KEY_CHECKING=false ANSIBLE_SSH_ARGS='-o UserKnownHostsFile=/dev/null -o IdentitiesOnly=yes -o ControlMaster=auto -o ControlPersist=60s' ansible-playbook --connection=ssh --timeout=30 --user="vagrant" --limit="all" --inventory-file=./hosts --ask-pass --become -vvv ansible.yml
```

### ToDo List
- [ ] Flowchart(Excalidraw)
- [x] K8s cluster
- [ ] Monitoring system (Prometheus & Grafana)
- [ ] Alert thresholds(min 3 alert)
- [ ] Redeploy & reconfig
- [ ] Certs & expiration dates service
- [ ] CI/CD
