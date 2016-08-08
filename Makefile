# Declare subcommands as "phony" targets, since they're not directories.
.PHONY: roles clean build test help

roles:
	ansible-galaxy install -r requirements.yml --force -p roles/

clean:
	rm -rf roles/

build:
	make roles
	molecule converge

test:
	make roles
	molecule test --destroy never

help:
	@echo Makefile for configuring a local ELK dev environment.
	@echo Subcommands:
	@echo "\t roles: Fetch dependency Ansible roles for ELK config."
	@echo "\t clean: Remove previously downloaded roles from roles/ directory."
	@echo "\t build: Creates Vagrant VMs and provisions them via Ansible."
	@echo "\t test: Creates Vagrant VMs, provisions, and verifies them."
