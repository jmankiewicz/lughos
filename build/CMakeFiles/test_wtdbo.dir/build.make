# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/irina/projects/lughos

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/irina/projects/lughos/build

# Include any dependencies generated for this target.
include CMakeFiles/test_wtdbo.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/test_wtdbo.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/test_wtdbo.dir/flags.make

CMakeFiles/test_wtdbo.dir/src/test_wtdbo.cpp.o: CMakeFiles/test_wtdbo.dir/flags.make
CMakeFiles/test_wtdbo.dir/src/test_wtdbo.cpp.o: ../src/test_wtdbo.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/irina/projects/lughos/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/test_wtdbo.dir/src/test_wtdbo.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/test_wtdbo.dir/src/test_wtdbo.cpp.o -c /home/irina/projects/lughos/src/test_wtdbo.cpp

CMakeFiles/test_wtdbo.dir/src/test_wtdbo.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_wtdbo.dir/src/test_wtdbo.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/irina/projects/lughos/src/test_wtdbo.cpp > CMakeFiles/test_wtdbo.dir/src/test_wtdbo.cpp.i

CMakeFiles/test_wtdbo.dir/src/test_wtdbo.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_wtdbo.dir/src/test_wtdbo.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/irina/projects/lughos/src/test_wtdbo.cpp -o CMakeFiles/test_wtdbo.dir/src/test_wtdbo.cpp.s

CMakeFiles/test_wtdbo.dir/src/test_wtdbo.cpp.o.requires:
.PHONY : CMakeFiles/test_wtdbo.dir/src/test_wtdbo.cpp.o.requires

CMakeFiles/test_wtdbo.dir/src/test_wtdbo.cpp.o.provides: CMakeFiles/test_wtdbo.dir/src/test_wtdbo.cpp.o.requires
	$(MAKE) -f CMakeFiles/test_wtdbo.dir/build.make CMakeFiles/test_wtdbo.dir/src/test_wtdbo.cpp.o.provides.build
.PHONY : CMakeFiles/test_wtdbo.dir/src/test_wtdbo.cpp.o.provides

CMakeFiles/test_wtdbo.dir/src/test_wtdbo.cpp.o.provides.build: CMakeFiles/test_wtdbo.dir/src/test_wtdbo.cpp.o

# Object files for target test_wtdbo
test_wtdbo_OBJECTS = \
"CMakeFiles/test_wtdbo.dir/src/test_wtdbo.cpp.o"

# External object files for target test_wtdbo
test_wtdbo_EXTERNAL_OBJECTS =

test_wtdbo: CMakeFiles/test_wtdbo.dir/src/test_wtdbo.cpp.o
test_wtdbo: CMakeFiles/test_wtdbo.dir/build.make
test_wtdbo: ../externalLibraries/lib/libwtdbo.so
test_wtdbo: ../externalLibraries/lib/libwtdbosqlite3.so
test_wtdbo: CMakeFiles/test_wtdbo.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable test_wtdbo"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_wtdbo.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/test_wtdbo.dir/build: test_wtdbo
.PHONY : CMakeFiles/test_wtdbo.dir/build

CMakeFiles/test_wtdbo.dir/requires: CMakeFiles/test_wtdbo.dir/src/test_wtdbo.cpp.o.requires
.PHONY : CMakeFiles/test_wtdbo.dir/requires

CMakeFiles/test_wtdbo.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/test_wtdbo.dir/cmake_clean.cmake
.PHONY : CMakeFiles/test_wtdbo.dir/clean

CMakeFiles/test_wtdbo.dir/depend:
	cd /home/irina/projects/lughos/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/irina/projects/lughos /home/irina/projects/lughos /home/irina/projects/lughos/build /home/irina/projects/lughos/build /home/irina/projects/lughos/build/CMakeFiles/test_wtdbo.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/test_wtdbo.dir/depend

