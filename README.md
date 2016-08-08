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

## Requirements

* [Vagrant]
* [Molecule]
* [Serverspec]

This should get you most of the way there:
```
pip install molecule
gem install serverspec
```

## Running the tests

There's a wrapper script that handles most of these actions so you can run a full
integration test:
```
make test
```

Once the hosts are created, you can also run selective commands:

```
molecule converge
molecule verify
molecule login logserver
```

See the [Molecule] docs for more info.

### Testing caveats

The test suite is mostly just chained unittests; there aren't any true integrations tests yet.
Still, the integrated environment does allow full interaction between server and host VMs,
and is quite useful when developing the dependent roles. True integration tests should be
committed to this repo, rather than to the dependent roles.

## License
MIT

[Vagrant]: https://www.vagrantup.com/docs/
[Molecule]: http://molecule.readthedocs.org/en/master/
[ServerSpec]: http://serverspec.org/
[freedomofpress.generate-ssl-cert]: https://github.com/freedomofpress/ansible-role-generate-ssl-cert
[freedomofpress.elk]: https://github.com/freedomofpress/ansible-role-elk
[freedomofpress.logstash-client]: https://github.com/freedomofpress/ansible-role-logstash-client
[freedomofpress.riemann]: https://github.com/freedomofpress/ansible-role-riemann
