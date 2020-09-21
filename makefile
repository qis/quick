config = debug
system = linux

all: build/$(system)/$(config)/rules.ninja
	@cmake --build build/$(system)/$(config)

run: build/$(system)/$(config)/rules.ninja
	@cmake --build build/$(system)/$(config) --target quick
	@cmake -E chdir build/$(system)/$(config) ./quick

format:
	@cmake -P res/format.cmake

clean:
	@cmake -E remove_directory build/$(system)

build/$(system)/debug/rules.ninja: CMakeLists.txt
	@cmake -GNinja -DCMAKE_BUILD_TYPE=Debug \
	  -B build/$(system)/debug

build/$(system)/release/rules.ninja: CMakeLists.txt
	@cmake -GNinja -DCMAKE_BUILD_TYPE=Release \
	  -B build/$(system)/release
