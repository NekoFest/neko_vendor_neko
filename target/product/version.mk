# Copyright (C) 2022 Paranoid Android
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

# Build time
NEKO_BUILD_DATE := $(shell date -u +%Y%m%d)
NEKO_BUILD_TIME := $(shell date -u +%H%M)

# Build version
NEKO_VERSION_CODE := 13.0.1-dev
NEKO_VERSION := neko_$(NEKO_BUILD)-$(NEKO_VERSION_CODE)-$(NEKO_BUILD_DATE)-$(NEKO_BUILD_TIME)

# Properties for build information
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.neko.version=$(NEKO_VERSION) \
    ro.neko.version_code=$(NEKO_VERSION_CODE) \
    ro.neko.build_time=$(NEKO_BUILD_DATE)-$(NEKO_BUILD_TIME)
