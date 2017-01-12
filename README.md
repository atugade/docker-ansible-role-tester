# docker-ansible-role-tester
A workspace to demonstrate building docker images from arbitrary roles.

This is based off [Chris Meyer's work](https://www.ansible.com/blog/testing-ansible-roles-with-docker) around testing ansible roles with docker.  Reworked to only include certain parts appropriate for my own personal use case.

# Requirements

* virtualbox >= 5.1.x
* vagrant >= 1.9.1

# Usage
This was tested on macOS Sierra.  Execute verbatim:

```
. setup_env
vagrant ssh
cd /vagrant
. demo_env
```

At this point there should be a docker container running that has had an ansible role applied to it.  You can inspect the container as you normally would.  Clean up with the following commands:

```
make clean -f Makefile.demo
exit
make clean -f Makefile.setup
```
