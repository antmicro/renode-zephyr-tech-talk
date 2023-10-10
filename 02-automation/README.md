# 02-automation

## Renode in headless mode

A headless mode can be easily automated with ``expect`` and similar tools.

Run:

```
renode --disable-xwt -P 5555
```

Then connect via Telnet:

```
telnet localhost 5555
```

And start a demo:

```
(monitor) start @scripts/single-node/hifive_unmatched.resc
```

Connect to UART:

```
(hifive-unmatched) uart_connect sysbus.uart0
```

Get back to the Monitor with ``ESC`` key.


## Python API

Install the ``pyrenode`` tool:

```
pip install --user git+https://github.com/antmicro/pyrenode.git
```

Run ``./02-pyrenode.py`` to see Renode connected via Python API.

## Robot testing

The repo contains two Robot files testing Zephyr on Leon3.

Run them with:

```
renode-test 03-testing.robot
renode-test 04-failing_test.robot
```

See the results in ``report.html``.

To investigate the cause of the test failure, start ``renode`` and run:

```
Load @snapshots/04-failing_test.Should_Print_Version.fail.save
mach set 0
peripherals
showAnalyzer sysbus.uart
start
```

You can easily clean up the working directory by running ``./cleanup_robot_results.sh``.
