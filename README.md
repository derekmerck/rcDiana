rcDIANA
==================
Derek Merck <derek_merck@brown.edu>
Brown University and Rhode Island Hospital  
Spring 2018

Source: <http://github.com/derekmerck/rcDIANA>  
Docker Hub: <https://hub.docker.com/r/derekmerck/rcdiana/>


Overview
---------------

A remotely configured [DIANA][] service stack, suitable for multi-architecture use with [resin.io][].

[DIANA]: https://diana.readthedocs.io
[resin.io]: http://resin.io


Usage
---------------

Directly:

```bash
$ docker run derekmerck/rcdiana:armv7hf_orthanc
```

Or with `docker-compose`:

``` bash
$ git clone https://www.github.com/derekmerck/rcDiana
$ cd rcDiana
$ docker-compose up
```


Content
---------------

rcDIANA is based on Debian stretch, and provides two types of nodes for `amd64` (Intel), `armv7hf` (Raspberry Pi 3), and `aarch64` (Jetson TX2) architectures.

- DICOM nodes using [Orthanc][] (amd64/armv7hf/aarch64_orthanc)
- Python compute nodes using [Conda][] (amd64/armv7hf/aarch64_orthanc_conda)

Because `armv7hf` is no longer supported by Continuum as of 2015, rcDIANA uses [BerryConda][].

Because resin.io provides a limited toolset on the host os, both node-types have built-in open-ssh servers for interactive sessions.

[Orthanc]: http://www.orthanc-server.com
[Conda]: http://www.anaconda.org
[BerryConda]: https://github.com/jjhelmus/berryconda


Configuration
------------------

The base images respect 3 built-in environment variables:

- `RESIN_DEVICE_NAME_AT_INIT` (default: rcDiana-amd64/armv7hf/aarch64) (Provides the web interface title for Orthanc)
- `ORTHANC_PASSWORD` (default: 0rthanC!)
- `ROOT_PASSWORD` (default: passw0rd!)

Ports:

- The conda image exposes port 22 (ssh)
- The orthanc image exposes ports 22 (ssh), 4242 (DICOM), 8042 (http)

As always, when running combinations of containers for multiple tasks, be sure to remap container ports to different host ports (or accept randomly assigned Docker default mappings).


Building
------------------

Invoke a build:

```
$ export RCD_ARCH=armv7hf
$ docker-compose -f builder-compose build
```

Note the build-recipe filename is `builder-compose.yml`; the default `docker-compose.yml` file is reserved by resin.io for deployment pushes.  Note as well that the amd64 images are not pre-configured with resin's init system or shell-access to environment variables.

Update builds are automated with [Travis CI][].  Multi-archicture cross-compiling is done using [qemu-user-static](https://github.com/multiarch/qemu-user-static) following this post: <https://blog.hypriot.com/post/setup-simple-ci-pipeline-for-arm-images/>

[Travis CI]: https://travis-ci.org

To build the `conda` image with a different Conda distribution, such as Continuum's Python 2.7.10 armv7 release, override the environment variable `CONDA_PKG` to the appropriate download location at build-time.

The most recent Continuum miniconda can be found at <https://repo.continuum.io/miniconda/Miniconda-3.16.0-Linux-armv7l.sh>


## License

MIT
