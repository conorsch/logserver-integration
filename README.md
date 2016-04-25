# Logserver integration tests

Small Ansible project designed to test integration between a variety
of FPF-maintained Ansible roles:

* [freedomofpress.elk]
* [freedomofpress.riemann]
* [freedomofpress.logstash-client]
* [freedomofpress.generate-ssl-cert]

The scripts contained herein will create VirtualBox VMs for the logserver
and a logclient, provision them, then run separate ServerSpec test suites
against each host. In the near future there will be actual integration tests
that confirm logs are flowing between the two hosts.

## Running the tests

The project uses [Molecule] and [ServerSpec] for testing. You'll also need
to download the role dependencies via ansible-galaxy. If you're testing
feature branches, make sure to update the `version:` string in `requirements.yml`,
to pull from the correct target. Then:

```
ansible-galaxy install -r requirements.yml --force
pip install molecule
gem install serverspec
molecule test
```

You can also run selective commands:

```
molecule idempotence
molecule verify
```
See the [Molecule] docs for more info.
There's a wrapper script that handles most of these actions so you can run a full
integration test:

```
./test.sh
```


## License
MIT

[Molecule]: http://molecule.readthedocs.org/en/master/
[ServerSpec]: http://serverspec.org/
[freedomofpress.generate-ssl-cert]: https://github.com/freedomofpress/ansible-role-generate-ssl-cert
[freedomofpress.elk]: https://github.com/freedomofpress/ansible-role-elk
[freedomofpress.logstash-client]: https://github.com/freedomofpress/ansible-role-logstash-client
[freedomofpress.riemann]: https://github.com/freedomofpress/ansible-role-riemann
