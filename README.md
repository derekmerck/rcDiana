rcDIANA
==================
Derek Merck <derek_merck@brown.edu>

Overview
---------------

A remotely configured DIANA service stack, suitable for use with [resin.io][]

<http://github.com/derekmerck/rcDIANA>  
<https://hub.docker.com/r/derekmerck/rcdiana/>

[resin.io]: (http://resin.io)


Usage
---------------

With docker-compose:

``` bash
$ git clone https://www.github.com/derekmerck/rcDiana
$ cd rcDiana
$ docker-compose up
```

Directly accessing the images:

```bash
$ docker run derekmerck/rcdiana:armv7_orthanc
```

Content
---------------

rcDIANA has two types of nodes, and each is compiled for x86 and armv7 architectures.

- DICOM nodes using [Orthanc][]
- Python compute nodes using [Conda][]

armv7 is no longer supported by Continuum, so the armv7 build uses [BerryConda][].

Both node-types have built-in sshd servers for interactive sessions.

[Orthanc]: http://www.orthanc-server.com
[Conda]: http://www.anaconda.org
[BerryConda]: https://github.com/jjhelmus/berryconda

Builds
------------------

Builds are automated on [Travis CI][].

Multi-arch cross-compiling is done using [qemu-user-static](https://github.com/multiarch/qemu-user-static) following this post: <https://blog.hypriot.com/post/setup-simple-ci-pipeline-for-arm-images/>

[Travis_CI]: https://travis-ci.org