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
include examples/dragdrop/CMakeFiles/dragdrop.wt.dir/depend.make

# Include the progress variables for this target.
include examples/dragdrop/CMakeFiles/dragdrop.wt.dir/progress.make

# Include the compile flags for this target's objects.
include examples/dragdrop/CMakeFiles/dragdrop.wt.dir/flags.make

examples/dragdrop/CMakeFiles/dragdrop.wt.dir/Character.o: examples/dragdrop/CMakeFiles/dragdrop.wt.dir/flags.make
examples/dragdrop/CMakeFiles/dragdrop.wt.dir/Character.o: /home/irina/projects/lughos/externalLibraries/src/wt/examples/dragdrop/Character.C
	$(CMAKE_COMMAND) -E cmake_progress_report /home/irina/projects/lughos/externalLibraries/src/wt-build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object examples/dragdrop/CMakeFiles/dragdrop.wt.dir/Character.o"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/dragdrop && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/dragdrop.wt.dir/Character.o -c /home/irina/projects/lughos/externalLibraries/src/wt/examples/dragdrop/Character.C

examples/dragdrop/CMakeFiles/dragdrop.wt.dir/Character.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dragdrop.wt.dir/Character.i"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/dragdrop && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/irina/projects/lughos/externalLibraries/src/wt/examples/dragdrop/Character.C > CMakeFiles/dragdrop.wt.dir/Character.i

examples/dragdrop/CMakeFiles/dragdrop.wt.dir/Character.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dragdrop.wt.dir/Character.s"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/dragdrop && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/irina/projects/lughos/externalLibraries/src/wt/examples/dragdrop/Character.C -o CMakeFiles/dragdrop.wt.dir/Character.s

examples/dragdrop/CMakeFiles/dragdrop.wt.dir/Character.o.requires:
.PHONY : examples/dragdrop/CMakeFiles/dragdrop.wt.dir/Character.o.requires

examples/dragdrop/CMakeFiles/dragdrop.wt.dir/Character.o.provides: examples/dragdrop/CMakeFiles/dragdrop.wt.dir/Character.o.requires
	$(MAKE) -f examples/dragdrop/CMakeFiles/dragdrop.wt.dir/build.make examples/dragdrop/CMakeFiles/dragdrop.wt.dir/Character.o.provides.build
.PHONY : examples/dragdrop/CMakeFiles/dragdrop.wt.dir/Character.o.provides

examples/dragdrop/CMakeFiles/dragdrop.wt.dir/Character.o.provides.build: examples/dragdrop/CMakeFiles/dragdrop.wt.dir/Character.o

examples/dragdrop/CMakeFiles/dragdrop.wt.dir/DragExample.o: examples/dragdrop/CMakeFiles/dragdrop.wt.dir/flags.make
examples/dragdrop/CMakeFiles/dragdrop.wt.dir/DragExample.o: /home/irina/projects/lughos/externalLibraries/src/wt/examples/dragdrop/DragExample.C
	$(CMAKE_COMMAND) -E cmake_progress_report /home/irina/projects/lughos/externalLibraries/src/wt-build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object examples/dragdrop/CMakeFiles/dragdrop.wt.dir/DragExample.o"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/dragdrop && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/dragdrop.wt.dir/DragExample.o -c /home/irina/projects/lughos/externalLibraries/src/wt/examples/dragdrop/DragExample.C

examples/dragdrop/CMakeFiles/dragdrop.wt.dir/DragExample.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dragdrop.wt.dir/DragExample.i"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/dragdrop && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/irina/projects/lughos/externalLibraries/src/wt/examples/dragdrop/DragExample.C > CMakeFiles/dragdrop.wt.dir/DragExample.i

examples/dragdrop/CMakeFiles/dragdrop.wt.dir/DragExample.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dragdrop.wt.dir/DragExample.s"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/dragdrop && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/irina/projects/lughos/externalLibraries/src/wt/examples/dragdrop/DragExample.C -o CMakeFiles/dragdrop.wt.dir/DragExample.s

examples/dragdrop/CMakeFiles/dragdrop.wt.dir/DragExample.o.requires:
.PHONY : examples/dragdrop/CMakeFiles/dragdrop.wt.dir/DragExample.o.requires

examples/dragdrop/CMakeFiles/dragdrop.wt.dir/DragExample.o.provides: examples/dragdrop/CMakeFiles/dragdrop.wt.dir/DragExample.o.requires
	$(MAKE) -f examples/dragdrop/CMakeFiles/dragdrop.wt.dir/build.make examples/dragdrop/CMakeFiles/dragdrop.wt.dir/DragExample.o.provides.build
.PHONY : examples/dragdrop/CMakeFiles/dragdrop.wt.dir/DragExample.o.provides

examples/dragdrop/CMakeFiles/dragdrop.wt.dir/DragExample.o.provides.build: examples/dragdrop/CMakeFiles/dragdrop.wt.dir/DragExample.o

examples/dragdrop/CMakeFiles/dragdrop.wt.dir/DragApplication.o: examples/dragdrop/CMakeFiles/dragdrop.wt.dir/flags.make
examples/dragdrop/CMakeFiles/dragdrop.wt.dir/DragApplication.o: /home/irina/projects/lughos/externalLibraries/src/wt/examples/dragdrop/DragApplication.C
	$(CMAKE_COMMAND) -E cmake_progress_report /home/irina/projects/lughos/externalLibraries/src/wt-build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object examples/dragdrop/CMakeFiles/dragdrop.wt.dir/DragApplication.o"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/dragdrop && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/dragdrop.wt.dir/DragApplication.o -c /home/irina/projects/lughos/externalLibraries/src/wt/examples/dragdrop/DragApplication.C

examples/dragdrop/CMakeFiles/dragdrop.wt.dir/DragApplication.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dragdrop.wt.dir/DragApplication.i"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/dragdrop && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/irina/projects/lughos/externalLibraries/src/wt/examples/dragdrop/DragApplication.C > CMakeFiles/dragdrop.wt.dir/DragApplication.i

examples/dragdrop/CMakeFiles/dragdrop.wt.dir/DragApplication.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dragdrop.wt.dir/DragApplication.s"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/dragdrop && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/irina/projects/lughos/externalLibraries/src/wt/examples/dragdrop/DragApplication.C -o CMakeFiles/dragdrop.wt.dir/DragApplication.s

examples/dragdrop/CMakeFiles/dragdrop.wt.dir/DragApplication.o.requires:
.PHONY : examples/dragdrop/CMakeFiles/dragdrop.wt.dir/DragApplication.o.requires

examples/dragdrop/CMakeFiles/dragdrop.wt.dir/DragApplication.o.provides: examples/dragdrop/CMakeFiles/dragdrop.wt.dir/DragApplication.o.requires
	$(MAKE) -f examples/dragdrop/CMakeFiles/dragdrop.wt.dir/build.make examples/dragdrop/CMakeFiles/dragdrop.wt.dir/DragApplication.o.provides.build
.PHONY : examples/dragdrop/CMakeFiles/dragdrop.wt.dir/DragApplication.o.provides

examples/dragdrop/CMakeFiles/dragdrop.wt.dir/DragApplication.o.provides.build: examples/dragdrop/CMakeFiles/dragdrop.wt.dir/DragApplication.o

# Object files for target dragdrop.wt
dragdrop_wt_OBJECTS = \
"CMakeFiles/dragdrop.wt.dir/Character.o" \
"CMakeFiles/dragdrop.wt.dir/DragExample.o" \
"CMakeFiles/dragdrop.wt.dir/DragApplication.o"

# External object files for target dragdrop.wt
dragdrop_wt_EXTERNAL_OBJECTS =

examples/dragdrop/dragdrop.wt: examples/dragdrop/CMakeFiles/dragdrop.wt.dir/Character.o
examples/dragdrop/dragdrop.wt: examples/dragdrop/CMakeFiles/dragdrop.wt.dir/DragExample.o
examples/dragdrop/dragdrop.wt: examples/dragdrop/CMakeFiles/dragdrop.wt.dir/DragApplication.o
examples/dragdrop/dragdrop.wt: examples/dragdrop/CMakeFiles/dragdrop.wt.dir/build.make
examples/dragdrop/dragdrop.wt: src/http/libwthttp.so.3.3.4
examples/dragdrop/dragdrop.wt: src/libwt.so.3.3.4
examples/dragdrop/dragdrop.wt: /usr/lib/x86_64-linux-gnu/libboost_random.so
examples/dragdrop/dragdrop.wt: /usr/lib/x86_64-linux-gnu/libboost_regex.so
examples/dragdrop/dragdrop.wt: /usr/lib/x86_64-linux-gnu/libboost_signals.so
examples/dragdrop/dragdrop.wt: /usr/lib/x86_64-linux-gnu/libz.so
examples/dragdrop/dragdrop.wt: /usr/lib/x86_64-linux-gnu/libssl.so
examples/dragdrop/dragdrop.wt: /usr/lib/x86_64-linux-gnu/libboost_thread.so
examples/dragdrop/dragdrop.wt: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
examples/dragdrop/dragdrop.wt: /usr/lib/x86_64-linux-gnu/libboost_system.so
examples/dragdrop/dragdrop.wt: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
examples/dragdrop/dragdrop.wt: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
examples/dragdrop/dragdrop.wt: examples/dragdrop/CMakeFiles/dragdrop.wt.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable dragdrop.wt"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/dragdrop && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/dragdrop.wt.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/dragdrop/CMakeFiles/dragdrop.wt.dir/build: examples/dragdrop/dragdrop.wt
.PHONY : examples/dragdrop/CMakeFiles/dragdrop.wt.dir/build

examples/dragdrop/CMakeFiles/dragdrop.wt.dir/requires: examples/dragdrop/CMakeFiles/dragdrop.wt.dir/Character.o.requires
examples/dragdrop/CMakeFiles/dragdrop.wt.dir/requires: examples/dragdrop/CMakeFiles/dragdrop.wt.dir/DragExample.o.requires
examples/dragdrop/CMakeFiles/dragdrop.wt.dir/requires: examples/dragdrop/CMakeFiles/dragdrop.wt.dir/DragApplication.o.requires
.PHONY : examples/dragdrop/CMakeFiles/dragdrop.wt.dir/requires

examples/dragdrop/CMakeFiles/dragdrop.wt.dir/clean:
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/dragdrop && $(CMAKE_COMMAND) -P CMakeFiles/dragdrop.wt.dir/cmake_clean.cmake
.PHONY : examples/dragdrop/CMakeFiles/dragdrop.wt.dir/clean

examples/dragdrop/CMakeFiles/dragdrop.wt.dir/depend:
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/irina/projects/lughos/externalLibraries/src/wt /home/irina/projects/lughos/externalLibraries/src/wt/examples/dragdrop /home/irina/projects/lughos/externalLibraries/src/wt-build /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/dragdrop /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/dragdrop/CMakeFiles/dragdrop.wt.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/dragdrop/CMakeFiles/dragdrop.wt.dir/depend

