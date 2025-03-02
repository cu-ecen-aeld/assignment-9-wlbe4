
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = 046fe8a1bd900749183f67b88d0531a9048fe03a
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-wlbe4.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES
AESD_ASSIGNMENTS_MODULE_SUBDIRS = aesd-char-driver

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
endef

# Install the server binary and the init script
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
    $(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin
    $(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
	$(INSTALL) -d 0755 $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/extra
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/extra/
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/extra/
endef

$(eval $(kernel-module))
$(eval $(generic-package))