sudo mkdir -p Install/build
sudo mkdir -p Consumer/build
cd Install/build
cmake -G Ninja .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$(pwd)/../../Installed"
cmake --build . -j
cmake --install . --config Release
cd ../../Consumer/build
cmake -G Ninja .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="$(pwd)/../../Installed"
cmake --build . -j
cd ../..
