# Copyright 2020 Alex Woroschilow (alex.woroschilow@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
PWD:=$(shell pwd)

all:
	mkdir --parents $(PWD)/build

	wget --no-check-certificate --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/PowerTools/x86_64/os/Packages/elinks-0.12-0.58.pre6.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --no-check-certificate --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/bzip2-libs-1.0.6-26.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --no-check-certificate --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/libcom_err-1.45.4-3.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --no-check-certificate --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/openssl-libs-1.1.1c-15.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --no-check-certificate --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/expat-2.2.5-3.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --no-check-certificate --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/gpm-libs-1.20.7-15.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --no-check-certificate --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/krb5-libs-1.17-18.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --no-check-certificate --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/libidn2-2.2.0-1.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --no-check-certificate --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/krb5-libs-1.17-18.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --no-check-certificate --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/krb5-libs-1.17-18.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --no-check-certificate --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/lua-libs-5.3.4-11.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --no-check-certificate --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/openssl-libs-1.1.1c-15.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --no-check-certificate --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/zlib-1.2.11-16.el8_2.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..


	mkdir --parents $(PWD)/build/AppDir
	cp --force --recursive $(PWD)/build/usr/* $(PWD)/build/AppDir/
	cp --force --recursive $(PWD)/build/etc $(PWD)/build/AppDir/

	cp --force --recursive $(PWD)/AppDir/* $(PWD)/build/AppDir

	rm -rf $(PWD)/AppDir/opt

	chmod +x $(PWD)/build/AppDir/AppRun
	chmod +x $(PWD)/build/AppDir/*.desktop

	export ARCH=x86_64 && $(PWD)/bin/appimagetool.AppImage $(PWD)/build/AppDir $(PWD)/Elinks.AppImage
	chmod +x $(PWD)/Elinks.AppImage

clean:
	rm -rf $(PWD)/build
