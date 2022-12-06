# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017,2020 The LineageOS Project
# Copyright (C) 2018,2020 The PixelExperience Project
# Copyright (C) 2022 NekoFest
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# Build system colors
#
# PFX: Prefix "target C++:" in yellow
# INS: Module "Install:" output color (cyan for ics)
ifneq ($(BUILD_WITH_COLORS),false)
    include $(TOP_DIR)vendor/neko/build/tools/colors.mk
endif

NEKO_TARGET_PACKAGE := $(PRODUCT_OUT)/$(NEKO_VERSION).zip

SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

.PHONY: neko
neko: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(NEKO_TARGET_PACKAGE)
	$(hide) $(SHA256) $(NEKO_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(NEKO_TARGET_PACKAGE).sha256sum
	@echo -e "Build complete"
	@echo -e ${CL_RED}"========================================================================="${CL_RST}
	@echo -e ""
	@echo -e ${CL_CYN}"   ███╗   ██╗███████╗██╗  ██╗ ██████╗ ███████╗███████╗███████╗████████╗  "${CL_RST}
	@echo -e ${CL_CYN}"   ████╗  ██║██╔════╝██║ ██╔╝██╔═══██╗██╔════╝██╔════╝██╔════╝╚══██╔══╝  "${CL_RST}
	@echo -e ${CL_CYN}"   ██╔██╗ ██║█████╗  █████╔╝ ██║   ██║█████╗  █████╗  ███████╗   ██║     "${CL_RST}
	@echo -e ${CL_CYN}"   ██║╚██╗██║██╔══╝  ██╔═██╗ ██║   ██║██╔══╝  ██╔══╝  ╚════██║   ██║     "${CL_RST}
	@echo -e ${CL_CYN}"   ██║ ╚████║███████╗██║  ██╗╚██████╔╝██║     ███████╗███████║   ██║     "${CL_RST}
	@echo -e ${CL_CYN}"   ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚══════╝╚══════╝   ╚═╝     "${CL_RST}
	@echo -e ""
	@echo -e ${CL_RED}"========================================================================="${CL_RST}
	@echo -e "  NekoFest building complete!!!"
	@echo -e "  Filename : $(NEKO_TARGET_PACKAGE)"
	@echo -e "  Size     : `ls -lah $(NEKO_TARGET_PACKAGE) | cut -d ' ' -f 5`"
	@echo -e "  SHA256   : `cat $(NEKO_TARGET_PACKAGE).sha256sum | cut -d ' ' -f 1`"
	@echo -e ${CL_RED}"====================================================================="${CL_RST}
