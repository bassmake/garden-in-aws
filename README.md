# Garden in AWS

Username is admin.

```console
ssh -i "~/.ssh/garden.cer" admin@ec2-3-65-12-178.eu-central-1.compute.amazonaws.com
```

## SELinux

### Scripts

potential EC2 user data:

```console
sudo selinux-activate
sudo check-selinux-installation
sudo sestatus
sudo touch .autorelabel
```

- filesystem type `df -T`

1. SELinux Install dev tools

```console
curl -O https://raw.githubusercontent.com/containers/container-selinux/main/container.fc
curl -O https://raw.githubusercontent.com/containers/container-selinux/main/container.if
curl -O https://raw.githubusercontent.com/containers/container-selinux/main/container.te
make -f /usr/share/selinux/devel/Makefile container.pp
```
