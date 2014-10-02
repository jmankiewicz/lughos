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
CMAKE_SOURCE_DIR = /home/irina/projects/lughos/externalLibraries/src/wt

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/irina/projects/lughos/externalLibraries/src/wt-build

# Include any dependencies generated for this target.
include examples/feature/dbo/CMakeFiles/dbo-tutorial4.dir/depend.make

# Include the progress variables for this target.
include examples/feature/dbo/CMakeFiles/dbo-tutorial4.dir/progress.make

# Include the compile flags for this target's objects.
include examples/feature/dbo/CMakeFiles/dbo-tutorial4.dir/flags.make

examples/feature/dbo/CMakeFiles/dbo-tutorial4.dir/tutorial4.o: examples/feature/dbo/CMakeFiles/dbo-tutorial4.dir/flags.make
examples/feature/dbo/CMakeFiles/dbo-tutorial4.dir/tutorial4.o: /home/irina/projects/lughos/externalLibraries/src/wt/examples/feature/dbo/tutorial4.C
	$(CMAKE_COMMAND) -E cmake_progress_report /home/irina/projects/lughos/externalLibraries/src/wt-build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object examples/feature/dbo/CMakeFiles/dbo-tutorial4.dir/tutorial4.o"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/feature/dbo && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/dbo-tutorial4.dir/tutorial4.o -c /home/irina/projects/lughos/externalLibraries/src/wt/examples/feature/dbo/tutorial4.C

examples/feature/dbo/CMakeFiles/dbo-tutorial4.dir/tutorial4.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dbo-tutorial4.dir/tutorial4.i"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/feature/dbo && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/irina/projects/lughos/externalLibraries/src/wt/examples/feature/dbo/tutorial4.C > CMakeFiles/dbo-tutorial4.dir/tutorial4.i

examples/feature/dbo/CMakeFiles/dbo-tutorial4.dir/tutorial4.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dbo-tutorial4.dir/tutorial4.s"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/feature/dbo && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/irina/projects/lughos/externalLibraries/src/wt/examples/feature/dbo/tutorial4.C -o CMakeFiles/dbo-tutorial4.dir/tutorial4.s

examples/feature/dbo/CMakeFiles/dbo-tutorial4.dir/tutorial4.o.requires:
.PHONY : examples/feature/dbo/CMakeFiles/dbo-tutorial4.dir/tutorial4.o.requires

examples/feature/dbo/CMakeFiles/dbo-tutorial4.dir/tutorial4.o.provides: examples/feature/dbo/CMakeFiles/dbo-tutorial4.dir/tutorial4.o.requires
	$(MAKE) -f examples/feature/dbo/CMakeFiles/dbo-tutorial4.dir/build.make examples/feature/dbo/CMakeFiles/dbo-tutorial4.dir/tutorial4.o.provides.build
.PHONY : examples/feature/dbo/CMakeFiles/dbo-tutorial4.dir/tutorial4.o.provides

examples/feature/dbo/CMakeFiles/dbo-tutorial4.dir/tutorial4.o.provides.build: examples/feature/dbo/CMakeFiles/dbo-tutorial4.dir/tutorial4.o

# Object files for target dbo-tutorial4
dbo__tutorial4_OBJECTS = \
"CMakeFiles/dbo-tutorial4.dir/tutorial4.o"

# External object files for target dbo-tutorial4
dbo__tutorial4_EXTERNAL_OBJECTS =

examples/feature/dbo/dbo-tutorial4: examples/feature/dbo/CMakeFiles/dbo-tutorial4.dir/tutorial4.o
examples/feature/dbo/dbo-tutorial4: examples/feature/dbo/CMakeFiles/dbo-tutorial4.dir/build.make
examples/feature/dbo/dbo-tutorial4: src/Wt/Dbo/libwtdbo.so.3.3.4
examples/feature/dbo/dbo-tutorial4: src/Wt/Dbo/backend/libwtdbosqlite3.so.3.3.4
examples/feature/dbo/dbo-tutorial4: src/Wt/Dbo/libwtdbo.so.3.3.4
examples/feature/dbo/dbo-tutorial4: /usr/lib/x86_64-linux-gnu/libboost_thread.so
examples/feature/dbo/dbo-tutorial4: /usr/lib/x86_64-linux-gnu/libboost_system.so
examples/feature/dbo/dbo-tutorial4: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
examples/feature/dbo/dbo-tutorial4: /usr/lib/x86_64-linux-gnu/libdl.so
examples/feature/dbo/dbo-tutorial4: examples/feature/dbo/CMakeFiles/dbo-tutorial4.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable dbo-tutorial4"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/feature/dbo && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/dbo-tutorial4.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/feature/dbo/CMakeFiles/dbo-tutorial4.dir/build: examples/feature/dbo/dbo-tutorial4
.PHONY : examples/feature/dbo/CMakeFiles/dbo-tutorial4.dir/build

examples/feature/dbo/CMakeFiles/dbo-tutorial4.dir/requires: examples/feature/dbo/CMakeFiles/dbo-tutorial4.dir/tutorial4.o.requires
.PHONY : examples/feature/dbo/CMakeFiles/dbo-tutorial4.dir/requires

examples/feature/dbo/CMakeFiles/dbo-tutorial4.dir/clean:
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/feature/dbo && $(CMAKE_COMMAND) -P CMakeFiles/dbo-tutorial4.dir/cmake_clean.cmake
.PHONY : examples/feature/dbo/CMakeFiles/dbo-tutorial4.dir/clean

examples/feature/dbo/CMakeFiles/dbo-tutorial4.dir/depend:
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/irina/projects/lughos/externalLibraries/src/wt /home/irina/projects/lughos/externalLibraries/src/wt/examples/feature/dbo /home/irina/projects/lughos/externalLibraries/src/wt-build /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/feature/dbo /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/feature/dbo/CMakeFiles/dbo-tutorial4.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/feature/dbo/CMakeFiles/dbo-tutorial4.dir/depend
