# docker-ansible-role-tester
A workspace to demonstrate building docker images from arbitrary roles.

This is based off [Chris Meyer's work](https://www.ansible.com/blog/testing-ansible-roles-with-docker) around testing ansible roles with docker.  Reworked to only include certain parts appropriate for my own personal use case.

# Requirements
* CentOS 7
* virtualbox >= 5.1.x
* vagrant >= 1.9.1

# Usage
Run all this crap in a vm to isolate it:

```
vagrant up
vagrant ssh
cd /vagrant
. setup_env
```

Now run the playbook that builds a base docker image which we'll use for the remainder of this exercise.

```
cd ansible
ansible-playbook docker-ansible-test.yml
```
