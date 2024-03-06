################################################################################
#
# aw882xx
#
################################################################################

AW882XX_VERSION = 61392cddd2a81b2ba3d6633f3c96cf9115a7563e
AW882XX_SITE = $(call github,dianjixz,aw882xx,$(AW882XX_VERSION))
AW882XX_LICENSE = GPL-2.0
AW882XX_LICENSE_FILES = LICENSE

define AW882XX_LINUX_CONFIG_FIXUPS
	$(call KCONFIG_ENABLE_OPT,CONFIG_AW882XX_DRV)
endef

define AW882XX_INSTALL_MODPROBE_CONF
	$(INSTALL) -m 0644 -D $(@D)/aw882xx_acf.bin $(TARGET_DIR)/lib/firmware/aw882xx_acf.bin
endef
AW882XX_POST_INSTALL_TARGET_HOOKS += AW882XX_INSTALL_MODPROBE_CONF

$(eval $(kernel-module))
$(eval $(generic-package))



