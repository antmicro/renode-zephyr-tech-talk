# Embedded CI on Steroids with Zephyr & Renode

Copyright (c) 2023 [Antmicro](https://www.antmicro.com)

This is a companion repository to the Zephyr Tech Talk.

You can watch it on [YouTube](https://www.youtube.com/watch?v=hBODmrYUzV0).
## Table of contents

* [01-renode-basics](01-renode-basics) - running a simple demo in Renode, scriptability

## How to get Renode?

Please refer to our [installation instructions in Renode README](https://github.com/renode/renode/#installation).

For Linux users we recommend obtaining the [portable nightly build](https://builds.renode.io/renode-latest.linux-portable.tar.gz) or installing Renode via the [renode-run Python package](https://github.com/antmicro/renode-run).

Packages for other OSes can be found on [builds.renode.io](https://builds.renode.io/).

## Setup Zephyr

Some of the presented scenarios assumed Zephyr to be cloned with ``west`` in the ``zephyr`` directory.

To set it up, follow [Zephyr Getting Started Guide](https://docs.zephyrproject.org/latest/develop/getting_started/index.html).

```
west init zephyr
cd zephyr
west update
```

## Renode links

* [Renode homepage](https://renode.io)
* [Renode sources](https://github.com/renode/renode)
* [Renode documentation](https://docs.renode.io)
* [Renode slide deck](https://about.renode.io)
* [Renode nightly builds](https://builds.renode.io)
* [renode-run](https://github.com/antmicro/renode-run)
* [Renode Zephyr Dashboard](https://zephyr-dashboard.renode.io/)
* [Renode U-Boot Dashboard](https://u-boot-dashboard.renode.io/)
* [Renodepedia](https://renodepedia.renode.io/)
* [dts2repl](https://github.com/antmicro/dts2repl)
* [pyrenode](https://github.com/antmicro/pyrenode)
