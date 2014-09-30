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
include examples/feature/video/CMakeFiles/video.wt.dir/depend.make

# Include the progress variables for this target.
include examples/feature/video/CMakeFiles/video.wt.dir/progress.make

# Include the compile flags for this target's objects.
include examples/feature/video/CMakeFiles/video.wt.dir/flags.make

examples/feature/video/CMakeFiles/video.wt.dir/video.o: examples/feature/video/CMakeFiles/video.wt.dir/flags.make
examples/feature/video/CMakeFiles/video.wt.dir/video.o: /home/irina/projects/lughos/externalLibraries/src/wt/examples/feature/video/video.C
	$(CMAKE_COMMAND) -E cmake_progress_report /home/irina/projects/lughos/externalLibraries/src/wt-build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object examples/feature/video/CMakeFiles/video.wt.dir/video.o"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/feature/video && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/video.wt.dir/video.o -c /home/irina/projects/lughos/externalLibraries/src/wt/examples/feature/video/video.C

examples/feature/video/CMakeFiles/video.wt.dir/video.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/video.wt.dir/video.i"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/feature/video && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/irina/projects/lughos/externalLibraries/src/wt/examples/feature/video/video.C > CMakeFiles/video.wt.dir/video.i

examples/feature/video/CMakeFiles/video.wt.dir/video.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/video.wt.dir/video.s"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/feature/video && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/irina/projects/lughos/externalLibraries/src/wt/examples/feature/video/video.C -o CMakeFiles/video.wt.dir/video.s

examples/feature/video/CMakeFiles/video.wt.dir/video.o.requires:
.PHONY : examples/feature/video/CMakeFiles/video.wt.dir/video.o.requires

examples/feature/video/CMakeFiles/video.wt.dir/video.o.provides: examples/feature/video/CMakeFiles/video.wt.dir/video.o.requires
	$(MAKE) -f examples/feature/video/CMakeFiles/video.wt.dir/build.make examples/feature/video/CMakeFiles/video.wt.dir/video.o.provides.build
.PHONY : examples/feature/video/CMakeFiles/video.wt.dir/video.o.provides

examples/feature/video/CMakeFiles/video.wt.dir/video.o.provides.build: examples/feature/video/CMakeFiles/video.wt.dir/video.o

# Object files for target video.wt
video_wt_OBJECTS = \
"CMakeFiles/video.wt.dir/video.o"

# External object files for target video.wt
video_wt_EXTERNAL_OBJECTS =

examples/feature/video/video.wt: examples/feature/video/CMakeFiles/video.wt.dir/video.o
examples/feature/video/video.wt: examples/feature/video/CMakeFiles/video.wt.dir/build.make
examples/feature/video/video.wt: src/http/libwthttp.so.3.3.4
examples/feature/video/video.wt: src/libwt.so.3.3.4
examples/feature/video/video.wt: /usr/lib/x86_64-linux-gnu/libboost_random.so
examples/feature/video/video.wt: /usr/lib/x86_64-linux-gnu/libboost_regex.so
examples/feature/video/video.wt: /usr/lib/x86_64-linux-gnu/libboost_signals.so
examples/feature/video/video.wt: /usr/lib/x86_64-linux-gnu/libz.so
examples/feature/video/video.wt: /usr/lib/x86_64-linux-gnu/libssl.so
examples/feature/video/video.wt: /usr/lib/x86_64-linux-gnu/libboost_thread.so
examples/feature/video/video.wt: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
examples/feature/video/video.wt: /usr/lib/x86_64-linux-gnu/libboost_system.so
examples/feature/video/video.wt: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
examples/feature/video/video.wt: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
examples/feature/video/video.wt: examples/feature/video/CMakeFiles/video.wt.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable video.wt"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/feature/video && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/video.wt.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/feature/video/CMakeFiles/video.wt.dir/build: examples/feature/video/video.wt
.PHONY : examples/feature/video/CMakeFiles/video.wt.dir/build

examples/feature/video/CMakeFiles/video.wt.dir/requires: examples/feature/video/CMakeFiles/video.wt.dir/video.o.requires
.PHONY : examples/feature/video/CMakeFiles/video.wt.dir/requires

examples/feature/video/CMakeFiles/video.wt.dir/clean:
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/feature/video && $(CMAKE_COMMAND) -P CMakeFiles/video.wt.dir/cmake_clean.cmake
.PHONY : examples/feature/video/CMakeFiles/video.wt.dir/clean

examples/feature/video/CMakeFiles/video.wt.dir/depend:
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/irina/projects/lughos/externalLibraries/src/wt /home/irina/projects/lughos/externalLibraries/src/wt/examples/feature/video /home/irina/projects/lughos/externalLibraries/src/wt-build /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/feature/video /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/feature/video/CMakeFiles/video.wt.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/feature/video/CMakeFiles/video.wt.dir/depend

