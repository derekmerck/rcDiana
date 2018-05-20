# Packages cross-compiled conda packages for aarch64
# Uses packages from channel https://anaconda.org/aarch64_gbox, no scipy or opencv available
FROM rcdiana:amd64_conda

RUN conda install constructor

RUN git clone https://github.com/conda/constructor.git \
    && sed -i "s/yaml.load/yaml.safe_load/" /opt/conda/lib/python2.7/site-packages/constructor/construct.py

RUN cd /constructor/examples/jetsonconda \
    && constructor . --platform=linux-aarch64

CMD ["sh", "-c","cp /constructor/examples/jetsonconda/*.sh /host/pkg/"]
