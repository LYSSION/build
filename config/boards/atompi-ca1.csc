# Alientek ATOMPI-CA1, RK3568 LPDDR4X board
BOARD_NAME="Alientek ATOMPI-CA1"
BOARD_VENDOR="alientek"
BOARDFAMILY="rk35xx"
BOARD_MAINTAINER="local"
INTRODUCED="2024"
BOOTCONFIG="atompi-ca1_defconfig"
BOOT_SOC="rk3568"
KERNEL_TARGET="vendor"
KERNEL_TEST_TARGET="vendor"
BOOT_FDT_FILE="rockchip/rk3568-atompi-ca1.dtb"
DEFAULT_OVERLAYS="rk3568-csi rk3568-dsi-panel rk3568-pcie20-wifi"
BOOT_SCENARIO="spl-blobs"
BL32_BLOB=rk35/atompi-ca1_tee.bin
IMAGE_PARTITION_TABLE="gpt"

function pre_config_uboot_target__atompi_ca1_install_bl32() {
	local atompi_bl32_source="${SRC}/config/blobs/atompi-ca1/rk3568_bl32_v2.12.bin"
	local atompi_bl32_target="${RKBIN_DIR}/${BL32_BLOB}"
	[[ -f "${atompi_bl32_source}" ]] || exit_with_error "ATOMPI-CA1 BL32 firmware is missing" "${atompi_bl32_source}"
	run_host_command_logged install -m 0644 "${atompi_bl32_source}" "${atompi_bl32_target}"
}

function post_family_config__atompi_ca1_bootscript() { declare -g BOOTSCRIPT=boot-atompi-ca1.cmd:boot.cmd; }
