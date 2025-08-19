export THEOS=/home/codespace/theos
ARCHS = arm64
TARGET = iphone:clang:latest:14.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = yenios

$(TWEAK_NAME)_FILES = Tweak.xm
$(TWEAK_NAME)_CFLAGS = -fobjc-arc
$(TWEAK_NAME)_FRAMEWORKS = UIKit
$(TWEAK_NAME)_EXTRA_FRAMEWORKS += SCLAlertView
$(TWEAK_NAME)_RESOURCES = Resources/*

include $(THEOS_MAKE_PATH)/tweak.mk