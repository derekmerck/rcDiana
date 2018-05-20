rcDIANA
==================
Derek Merck <derek_merck@brown.edu>

Overview
---------------

A remotely configured DIANA service stack, suitable for use with [resin.io][]

<http://github.com/derekmerck/rcDIANA>  
<https://hub.docker.com/r/derekmerck/rcdiana/>

[resin.io]: http://resin.io)


Usage
---------------

``` bash
$ git clone https://www.github.com/derekmerck/rcDiana
$ cd rcDiana
$ docker-compose up
```

Content
---------------

rcDIANA has two types of nodes, and each is compiled for x86 and armv7 architectures.

- DICOM nodes using [Orthanc][] (orthanc_armv7)
- Python compute nodes using [Conda][] (conda_armv7)

armv7 is no longer supported by Continuum, so the armv7 build uses [BerryConda][].

Both node-types have built-in sshd servers for interactive sessions.

[Orthanc]: http://www.orthanc-server.com
[Conda]: http://www.anaconda.org
[BerryConda]: https://github.com/jjhelmus/berryconda

Builds
------------------

Builds are automated using [Travis CI][]

[Travis_CI]: https://travis-ci.org