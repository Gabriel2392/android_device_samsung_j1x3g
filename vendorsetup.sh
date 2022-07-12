# Copyright (C) 2014 The CyanogenMod Project
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

# This file is executed by build/envsetup.sh, and can use anything
# defined in envsetup.sh.
#
# In particular, you can add lunch options with the add_lunch_combo
# function: add_lunch_combo generic-eng

for i in eng user userdebug; do
add_lunch_combo omni_j1x3g-${i};
done

git clone https://android.googlesource.com/device/generic/goldfish -b nougat-release device/generic/goldfish

if [ -z "$(which lzma)" ]; then
	echo "Could not find lzma, which is needed for compressing ramdisk"
	echo "Please install before building."
	exit 1
fi
