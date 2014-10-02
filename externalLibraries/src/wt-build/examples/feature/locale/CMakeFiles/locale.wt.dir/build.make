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
include examples/feature/locale/CMakeFiles/locale.wt.dir/depend.make

# Include the progress variables for this target.
include examples/feature/locale/CMakeFiles/locale.wt.dir/progress.make

# Include the compile flags for this target's objects.
include examples/feature/locale/CMakeFiles/locale.wt.dir/flags.make

examples/feature/locale/CMakeFiles/locale.wt.dir/locale.o: examples/feature/locale/CMakeFiles/locale.wt.dir/flags.make
examples/feature/locale/CMakeFiles/locale.wt.dir/locale.o: /home/irina/projects/lughos/externalLibraries/src/wt/examples/feature/locale/locale.C
	$(CMAKE_COMMAND) -E cmake_progress_report /home/irina/projects/lughos/externalLibraries/src/wt-build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object examples/feature/locale/CMakeFiles/locale.wt.dir/locale.o"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/feature/locale && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/locale.wt.dir/locale.o -c /home/irina/projects/lughos/externalLibraries/src/wt/examples/feature/locale/locale.C

examples/feature/locale/CMakeFiles/locale.wt.dir/locale.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/locale.wt.dir/locale.i"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/feature/locale && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/irina/projects/lughos/externalLibraries/src/wt/examples/feature/locale/locale.C > CMakeFiles/locale.wt.dir/locale.i

examples/feature/locale/CMakeFiles/locale.wt.dir/locale.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/locale.wt.dir/locale.s"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/feature/locale && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/irina/projects/lughos/externalLibraries/src/wt/examples/feature/locale/locale.C -o CMakeFiles/locale.wt.dir/locale.s

examples/feature/locale/CMakeFiles/locale.wt.dir/locale.o.requires:
.PHONY : examples/feature/locale/CMakeFiles/locale.wt.dir/locale.o.requires

examples/feature/locale/CMakeFiles/locale.wt.dir/locale.o.provides: examples/feature/locale/CMakeFiles/locale.wt.dir/locale.o.requires
	$(MAKE) -f examples/feature/locale/CMakeFiles/locale.wt.dir/build.make examples/feature/locale/CMakeFiles/locale.wt.dir/locale.o.provides.build
.PHONY : examples/feature/locale/CMakeFiles/locale.wt.dir/locale.o.provides

examples/feature/locale/CMakeFiles/locale.wt.dir/locale.o.provides.build: examples/feature/locale/CMakeFiles/locale.wt.dir/locale.o

# Object files for target locale.wt
locale_wt_OBJECTS = \
"CMakeFiles/locale.wt.dir/locale.o"

# External object files for target locale.wt
locale_wt_EXTERNAL_OBJECTS =

examples/feature/locale/locale.wt: examples/feature/locale/CMakeFiles/locale.wt.dir/locale.o
examples/feature/locale/locale.wt: examples/feature/locale/CMakeFiles/locale.wt.dir/build.make
examples/feature/locale/locale.wt: src/http/libwthttp.so.3.3.4
examples/feature/locale/locale.wt: src/libwt.so.3.3.4
examples/feature/locale/locale.wt: /usr/lib/x86_64-linux-gnu/libboost_random.so
examples/feature/locale/locale.wt: /usr/lib/x86_64-linux-gnu/libboost_regex.so
examples/feature/locale/locale.wt: /usr/lib/x86_64-linux-gnu/libboost_signals.so
examples/feature/locale/locale.wt: /usr/lib/x86_64-linux-gnu/libz.so
examples/feature/locale/locale.wt: /usr/lib/x86_64-linux-gnu/libssl.so
examples/feature/locale/locale.wt: /usr/lib/x86_64-linux-gnu/libboost_thread.so
examples/feature/locale/locale.wt: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
examples/feature/locale/locale.wt: /usr/lib/x86_64-linux-gnu/libboost_system.so
examples/feature/locale/locale.wt: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
examples/feature/locale/locale.wt: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
examples/feature/locale/locale.wt: examples/feature/locale/CMakeFiles/locale.wt.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable locale.wt"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/feature/locale && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/locale.wt.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/feature/locale/CMakeFiles/locale.wt.dir/build: examples/feature/locale/locale.wt
.PHONY : examples/feature/locale/CMakeFiles/locale.wt.dir/build

examples/feature/locale/CMakeFiles/locale.wt.dir/requires: examples/feature/locale/CMakeFiles/locale.wt.dir/locale.o.requires
.PHONY : examples/feature/locale/CMakeFiles/locale.wt.dir/requires

examples/feature/locale/CMakeFiles/locale.wt.dir/clean:
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/feature/locale && $(CMAKE_COMMAND) -P CMakeFiles/locale.wt.dir/cmake_clean.cmake
.PHONY : examples/feature/locale/CMakeFiles/locale.wt.dir/clean

examples/feature/locale/CMakeFiles/locale.wt.dir/depend:
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/irina/projects/lughos/externalLibraries/src/wt /home/irina/projects/lughos/externalLibraries/src/wt/examples/feature/locale /home/irina/projects/lughos/externalLibraries/src/wt-build /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/feature/locale /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/feature/locale/CMakeFiles/locale.wt.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/feature/locale/CMakeFiles/locale.wt.dir/depend
