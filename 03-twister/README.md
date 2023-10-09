# 03-twister

The ``example-application`` directory contains a custom board called ``unleashed`` (a renamed version of Zephyr's ``hifive_unleashed`` target) and two samples, ``hello_world`` and ``shell_module``, copied there for convenience.

## Running tests

To build the sample, initialize Zephyr with:

```
west init -l example_application
```

Then enter the ``example_application`` directory and run tests:

```
west twister --platform unleashed -T hello_world
```

or, for a more detailed output:

```
west twister -vv --platform unleashed -T hello_world
```

The Robot-based test can be run with:

```
west twister --platform stm32f7 -T shell_module
```

To see more details on the test results, open ``twister-out/stm32f7/sample.shell.shell_module.robot/report.html`` in your browser.

## Enabling Renode support in boards

To enable Renode support for the ``unleashed`` target, the entries below have been added.

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

Also, the ``support/hifive_unleashed.resc`` file was added to describe the Renode configuration for this board.

An analogous process for the ``stm32f7`` target was also performed, with only minor differences.

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
*** Settings ***
Resource                      ${KEYWORDS}
```

With the resource defined as above, you can use the ``Prepare Machine`` keyword to set up the platform based on your Twister target and load the appropriate ELF file.

## Regenerating platform description

The platform description file for ``stm32f7``, ``boards/arm/stm32f7/support/stm32f746g_disco.repl``, was generated using the ``dts2repl`` tool.

To rebuild the platform from a DTS file, run the following:

```
west build -p -b stm32f7 hello_world
dts2repl build/zephyr/zephyr.dts --output boards/arm/stm32f7/support/stm32f746g_disco.repl
```
