# 03-twister

The ``example-application`` directory contains a custom board called ``unleashed`` (being a renamed version of Zephyr's ``hifive_unleashed`` target) and two samples, ``hello_world`` and ``shell_module``, copied there for convenience.

## Running tests

To build the sample, initialize Zephyr with:

```
west init -l example_application
```

Then enter the ``example_application`` directory and run tests:

```
west twister --platform unleashed -T hello_world
```

or, for more detailed output:

```
west twister -vv --platform unleashed -T hello_world
```

Robot-based test can be run with:

west twister --platform unleashed -T shell_module
```

To see more details on the test results, open ``twister-out/unleashed/sample.shell.shell_module.robot/report.html``.

## Enabling Renode support in boards

To see how Renode support was enabled for the ``unleashed`` target, the following entries have been added.

In ``unleashed.yaml``:

```
simulation: renode
simulation_exec: renode
```

In ``board.cmake``:

```
set(SUPPORTED_EMU_PLATFORMS renode)
set(RENODE_SCRIPT ${CMAKE_CURRENT_LIST_DIR}/support/hifive_unleashed.resc)
set(RENODE_UART sysbus.uart0)
```

Also, the ``support/hifive_unleashed.resc`` was added to describe the Renode configuration for this board.

## Enabling Robot test in samples

The ``shell_module`` sample has a Robot test enabled.

This required a change to the sample's ``sample.yaml`` file:

```
  sample.shell.shell_module.robot:
    harness: robot
    harness_config:
      robot_test_path: shell_module.robot
```

The ``shell_module.robot`` file needs to include the following section:

```
```

With the resource defined as above you can use the ``Prepare Machine`` keyword to set up the platform based on your Twister target and load the appropriate elf file.
