# Logserver integration tests

Small Ansible project designed to test integration between a variety
of FPF-maintained Ansible roles:

* [freedomofpress.elk]
* [freedomofpress.riemann]
* [freedomofpress.logstash-client]
* [freedomofpress.generate-ssl-cert]

## Running the tests

The project uses [Molecule] and [ServerSpec] for testing. You'll also need
to download the role dependencies via ansible-galaxy. If you're testing
feature branches, make sure to update the `version:` string in the `requirements.yml`,
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


## License
MIT

[Molecule]: http://molecule.readthedocs.org/en/master/
[ServerSpec]: http://serverspec.org/
[freedomofpress.generate-ssl-cert]: https://github.com/freedomofpress/ansible-role-generate-ssl-cert
[freedomofpress.elk]: https://github.com/freedomofpress/ansible-role-elk
[freedomofpress.logstash-client]: https://github.com/freedomofpress/ansible-role-logstash-client
[freedomofpress.riemann]: https://github.com/freedomofpress/ansible-role-riemann
