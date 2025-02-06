
##############################################################
#
# LDD
#
##############################################################

LDD_VERSION = 38b0cd43c259a7dffdf452b801ce662b0c0316de
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-wlbe4.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES
LDD_MODULE_SUBDIRS = scull \
					 misc-modules

define LDD_INSTALL_TARGET_CMDS
    $(INSTALL) -m 0755 $(@D)/scull/scull_load 			$(TARGET_DIR)/etc/init.d
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload 		$(TARGET_DIR)/etc/init.d
    $(INSTALL) -m 0755 $(@D)/misc-modules/module_load 	$(TARGET_DIR)/etc/init.d
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/etc/init.d
endef

$(eval $(kernel-module))
$(eval $(generic-package))
