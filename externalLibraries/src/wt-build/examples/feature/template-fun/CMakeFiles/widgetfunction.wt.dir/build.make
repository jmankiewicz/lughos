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
include examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/depend.make

# Include the progress variables for this target.
include examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/progress.make

# Include the compile flags for this target's objects.
include examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/flags.make

examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/Example.o: examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/flags.make
examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/Example.o: /home/irina/projects/lughos/externalLibraries/src/wt/examples/feature/template-fun/Example.C
	$(CMAKE_COMMAND) -E cmake_progress_report /home/irina/projects/lughos/externalLibraries/src/wt-build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/Example.o"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/feature/template-fun && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/widgetfunction.wt.dir/Example.o -c /home/irina/projects/lughos/externalLibraries/src/wt/examples/feature/template-fun/Example.C

examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/Example.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/widgetfunction.wt.dir/Example.i"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/feature/template-fun && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/irina/projects/lughos/externalLibraries/src/wt/examples/feature/template-fun/Example.C > CMakeFiles/widgetfunction.wt.dir/Example.i

examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/Example.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/widgetfunction.wt.dir/Example.s"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/feature/template-fun && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/irina/projects/lughos/externalLibraries/src/wt/examples/feature/template-fun/Example.C -o CMakeFiles/widgetfunction.wt.dir/Example.s

examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/Example.o.requires:
.PHONY : examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/Example.o.requires

examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/Example.o.provides: examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/Example.o.requires
	$(MAKE) -f examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/build.make examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/Example.o.provides.build
.PHONY : examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/Example.o.provides

examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/Example.o.provides.build: examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/Example.o

examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/WidgetFunction.o: examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/flags.make
examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/WidgetFunction.o: /home/irina/projects/lughos/externalLibraries/src/wt/examples/feature/template-fun/WidgetFunction.C
	$(CMAKE_COMMAND) -E cmake_progress_report /home/irina/projects/lughos/externalLibraries/src/wt-build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/WidgetFunction.o"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/feature/template-fun && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/widgetfunction.wt.dir/WidgetFunction.o -c /home/irina/projects/lughos/externalLibraries/src/wt/examples/feature/template-fun/WidgetFunction.C

examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/WidgetFunction.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/widgetfunction.wt.dir/WidgetFunction.i"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/feature/template-fun && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/irina/projects/lughos/externalLibraries/src/wt/examples/feature/template-fun/WidgetFunction.C > CMakeFiles/widgetfunction.wt.dir/WidgetFunction.i

examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/WidgetFunction.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/widgetfunction.wt.dir/WidgetFunction.s"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/feature/template-fun && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/irina/projects/lughos/externalLibraries/src/wt/examples/feature/template-fun/WidgetFunction.C -o CMakeFiles/widgetfunction.wt.dir/WidgetFunction.s

examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/WidgetFunction.o.requires:
.PHONY : examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/WidgetFunction.o.requires

examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/WidgetFunction.o.provides: examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/WidgetFunction.o.requires
	$(MAKE) -f examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/build.make examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/WidgetFunction.o.provides.build
.PHONY : examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/WidgetFunction.o.provides

examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/WidgetFunction.o.provides.build: examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/WidgetFunction.o

# Object files for target widgetfunction.wt
widgetfunction_wt_OBJECTS = \
"CMakeFiles/widgetfunction.wt.dir/Example.o" \
"CMakeFiles/widgetfunction.wt.dir/WidgetFunction.o"

# External object files for target widgetfunction.wt
widgetfunction_wt_EXTERNAL_OBJECTS =

examples/feature/template-fun/widgetfunction.wt: examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/Example.o
examples/feature/template-fun/widgetfunction.wt: examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/WidgetFunction.o
examples/feature/template-fun/widgetfunction.wt: examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/build.make
examples/feature/template-fun/widgetfunction.wt: src/http/libwthttp.so.3.3.4
examples/feature/template-fun/widgetfunction.wt: src/libwt.so.3.3.4
examples/feature/template-fun/widgetfunction.wt: /usr/lib/x86_64-linux-gnu/libboost_random.so
examples/feature/template-fun/widgetfunction.wt: /usr/lib/x86_64-linux-gnu/libboost_regex.so
examples/feature/template-fun/widgetfunction.wt: /usr/lib/x86_64-linux-gnu/libboost_signals.so
examples/feature/template-fun/widgetfunction.wt: /usr/lib/x86_64-linux-gnu/libz.so
examples/feature/template-fun/widgetfunction.wt: /usr/lib/x86_64-linux-gnu/libssl.so
examples/feature/template-fun/widgetfunction.wt: /usr/lib/x86_64-linux-gnu/libboost_thread.so
examples/feature/template-fun/widgetfunction.wt: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
examples/feature/template-fun/widgetfunction.wt: /usr/lib/x86_64-linux-gnu/libboost_system.so
examples/feature/template-fun/widgetfunction.wt: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
examples/feature/template-fun/widgetfunction.wt: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
examples/feature/template-fun/widgetfunction.wt: examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable widgetfunction.wt"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/feature/template-fun && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/widgetfunction.wt.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/build: examples/feature/template-fun/widgetfunction.wt
.PHONY : examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/build

examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/requires: examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/Example.o.requires
examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/requires: examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/WidgetFunction.o.requires
.PHONY : examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/requires

examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/clean:
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/feature/template-fun && $(CMAKE_COMMAND) -P CMakeFiles/widgetfunction.wt.dir/cmake_clean.cmake
.PHONY : examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/clean

examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/depend:
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/irina/projects/lughos/externalLibraries/src/wt /home/irina/projects/lughos/externalLibraries/src/wt/examples/feature/template-fun /home/irina/projects/lughos/externalLibraries/src/wt-build /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/feature/template-fun /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/feature/template-fun/CMakeFiles/widgetfunction.wt.dir/depend

