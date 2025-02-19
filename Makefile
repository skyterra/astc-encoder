.PHONY: prepare install x86 arm

prepare:
	rm -rf build && \
	export CXX=clang++ && \
	mkdir build

x86: prepare
	# x86-64
	cd build && \
	cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=../ \
    -DASTCENC_ISA_AVX2=ON -DASTCENC_ISA_SSE41=ON -DASTCENC_ISA_SSE2=ON  -DASTCENC_SHAREDLIB=ON  ..

arm: prepare
	# Arm arch64
	cd build && \
	cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=../ \
    -DASTCENC_ISA_NEON=ON -DASTCENC_SHAREDLIB=ON  ..

macOS: prepare
	cd build && \
	cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=../ ..

install:
	cd build && \
	make install -j4

