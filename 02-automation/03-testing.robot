*** Variables ***
${SCRIPT}                     scripts/single-node/leon3_zephyr.resc
${UART}                       sysbus.uart
${PROMPT}                     uart:~$

*** Keywords ***
Prepare Machine
    Execute Command           $bin=@https://dl.antmicro.com/projects/renode/generic_leon3-zephyr-shell_module.elf-s_973840-d4749b06d75be94be2b516ff84952566bec260a2
    Execute Script            ${SCRIPT}

    Create Terminal Tester    ${UART}  timeout=1

*** Test Cases ***
Should Boot Zephyr
    [Documentation]           Boots Zephyr on the Leon3 platform.
    [Tags]                    zephyr  uart
    Prepare Machine

    Start Emulation

    Wait For Prompt On Uart   ${PROMPT}

    Provides                  booted-zephyr

Should Print Version
    [Documentation]           Tests shell responsiveness in Zephyr on the Leon3 platform.
    [Tags]                    zephyr  uart
    Requires                  booted-zephyr

    Write Line To Uart        version
    Wait For Line On Uart     Zephyr version 3.4.99
