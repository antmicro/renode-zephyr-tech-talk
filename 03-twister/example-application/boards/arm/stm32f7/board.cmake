# SPDX-License-Identifier: Apache-2.0

set(SUPPORTED_EMU_PLATFORMS renode)
set(RENODE_SCRIPT ${CMAKE_CURRENT_LIST_DIR}/support/stm32f746g_disco.resc)
set(RENODE_UART sysbus.usart1)

board_runner_args(jlink "--device=STM32F746NG" "--speed=4000")

include(${ZEPHYR_BASE}/boards/common/openocd.board.cmake)
include(${ZEPHYR_BASE}/boards/common/jlink.board.cmake)
