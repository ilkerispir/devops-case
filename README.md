# DevOps Case Study

## Requirements

* [Vagrant](https://www.vagrantup.com/downloads)
  * [Vagrant Host Manager Plugin](https://github.com/devopsgroup-io/vagrant-hostmanager)
* [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
* [Virtualbox(If your processor is x86-64 or AMD based.)](https://www.virtualbox.org/wiki/Downloads)
* [Parallels(If your processor is ARM based. For example, if you have a computer with the Apple M1 series)](https://www.parallels.com/eu/products/desktop/trial/)

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

### API Endpoint - Test with curl or browser
```bash
curl http://192.168.33.71:30000/
```

### K8S Dashboard - Test with curl or browser
```bash
curl https://192.168.33.71:32323/
```

### Argo CD - Test with curl or browser
```bash
curl https://192.168.33.71:31000/
```

## Example Ansbile Command
```bash
PYTHONUNBUFFERED=1 ANSIBLE_FORCE_COLOR=true ANSIBLE_HOST_KEY_CHECKING=false ANSIBLE_SSH_ARGS='-o UserKnownHostsFile=/dev/null -o IdentitiesOnly=yes -o ControlMaster=auto -o ControlPersist=60s' ansible-playbook --connection=ssh --timeout=30 --user="vagrant" --limit="all" --inventory-file=./hosts --ask-pass --become -vvv ansible.yml
```

## ToDo List
- [ ] Flowchart(Excalidraw)
- [x] K8s cluster
- [ ] Monitoring system (Prometheus & Grafana)
- [ ] Alert thresholds(min 3 alert)
- [ ] Redeploy & reconfig(Iac(Ansible) example)
- [ ] Certs & expiration dates service
- [ ] CI/CD

## Architectures

### K8s Arch
![k8s-arch](./screenshots/k8s-cluster.png)