build:
	sudo mkdir -p Install/build
	sudo mkdir -p Consumer/build
	cmake -G Ninja -S Install -B Install/build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="Installed"
	cmake --build Install/build -j
	cmake --install Install/build --config Release
	cmake -G Ninja -S Consumer -B Consumer/build -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="$$(realpath Installed)"
	cmake --build Consumer/build -j
clean:
	rm -rf Consumer/build
	rm -rf Install/build
	rm -rf Installed
