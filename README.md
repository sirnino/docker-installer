# Docker Installer
A shell script that helps in installing the docker daemon with several additive configuration

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

The only prerequisite to use the shell script is to run it on a Linux Ubuntu machine.

### Installing

The recommended way to obtain the script is cloning the git repository as follows:

```
git clone https://github.com/sirnino/docker-installer.git
```

If you don't have git installed you can download the software from [here](https://github.com/sirnino/docker-installer/archive/master.zip) (note that you won't be able to update the software with the new releases).


## Deployment

In order to make the script working, you have to assign it the proper permissions. To do this you can run:

```
chmod +x docker-setup.sh
```

Now that the script is properly configured, you can launch it, as follows:

```
./docker-setup.sh <you_private_ip>
```

The only required parameter is the _<your_private_ip>_ that is the private IP of the machine where you're launching the script.
This IP will be used to initialize the Docker Swarm.

*e.g.* Supposing that your VM has the following private ip: 192.168.2.3 the script must be launched as follows:

```
./docker-setup.sh 192.168.2.3
```

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/sirnino/docker-installer/tags).

## Authors

* **Antonino Sirchia** - *Initial work* - [sirnino](https://github.com/sirnino)

See also the list of [contributors](https://github.com/sirnino/docker-installer/graphs/contributors) who participated in this project.

## License

See the [LICENSE.md](LICENSE.md) file for details
