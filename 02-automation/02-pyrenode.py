#!/usr/bin/env python3


from pyrenode import connect_renode, get_keywords, shutdown_renode
connect_renode()
get_keywords()

uart = 'sysbus.usart1'

ExecuteCommand('i @scripts/single-node/sam_e70.resc')
CreateTerminalTester(uart)
ExecuteCommand(f"showAnalyzer {uart}")
StartEmulation()
WaitForPromptOnUart("uart:~")
WriteLineToUart("version")
WaitForLineOnUart("Zephyr* version 1.14.0-rc1", timeout=60, treatAsRegex=True)

print(ExecuteCommand('echo "Test passed!"'))
shutdown_renode()
