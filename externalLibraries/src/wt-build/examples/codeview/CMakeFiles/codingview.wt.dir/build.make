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
include examples/codeview/CMakeFiles/codingview.wt.dir/depend.make

# Include the progress variables for this target.
include examples/codeview/CMakeFiles/codingview.wt.dir/progress.make

# Include the compile flags for this target's objects.
include examples/codeview/CMakeFiles/codingview.wt.dir/flags.make

examples/codeview/CMakeFiles/codingview.wt.dir/CoderApplication.o: examples/codeview/CMakeFiles/codingview.wt.dir/flags.make
examples/codeview/CMakeFiles/codingview.wt.dir/CoderApplication.o: /home/irina/projects/lughos/externalLibraries/src/wt/examples/codeview/CoderApplication.C
	$(CMAKE_COMMAND) -E cmake_progress_report /home/irina/projects/lughos/externalLibraries/src/wt-build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object examples/codeview/CMakeFiles/codingview.wt.dir/CoderApplication.o"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/codeview && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/codingview.wt.dir/CoderApplication.o -c /home/irina/projects/lughos/externalLibraries/src/wt/examples/codeview/CoderApplication.C

examples/codeview/CMakeFiles/codingview.wt.dir/CoderApplication.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/codingview.wt.dir/CoderApplication.i"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/codeview && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/irina/projects/lughos/externalLibraries/src/wt/examples/codeview/CoderApplication.C > CMakeFiles/codingview.wt.dir/CoderApplication.i

examples/codeview/CMakeFiles/codingview.wt.dir/CoderApplication.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/codingview.wt.dir/CoderApplication.s"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/codeview && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/irina/projects/lughos/externalLibraries/src/wt/examples/codeview/CoderApplication.C -o CMakeFiles/codingview.wt.dir/CoderApplication.s

examples/codeview/CMakeFiles/codingview.wt.dir/CoderApplication.o.requires:
.PHONY : examples/codeview/CMakeFiles/codingview.wt.dir/CoderApplication.o.requires

examples/codeview/CMakeFiles/codingview.wt.dir/CoderApplication.o.provides: examples/codeview/CMakeFiles/codingview.wt.dir/CoderApplication.o.requires
	$(MAKE) -f examples/codeview/CMakeFiles/codingview.wt.dir/build.make examples/codeview/CMakeFiles/codingview.wt.dir/CoderApplication.o.provides.build
.PHONY : examples/codeview/CMakeFiles/codingview.wt.dir/CoderApplication.o.provides

examples/codeview/CMakeFiles/codingview.wt.dir/CoderApplication.o.provides.build: examples/codeview/CMakeFiles/codingview.wt.dir/CoderApplication.o

examples/codeview/CMakeFiles/codingview.wt.dir/CodeSession.o: examples/codeview/CMakeFiles/codingview.wt.dir/flags.make
examples/codeview/CMakeFiles/codingview.wt.dir/CodeSession.o: /home/irina/projects/lughos/externalLibraries/src/wt/examples/codeview/CodeSession.C
	$(CMAKE_COMMAND) -E cmake_progress_report /home/irina/projects/lughos/externalLibraries/src/wt-build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object examples/codeview/CMakeFiles/codingview.wt.dir/CodeSession.o"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/codeview && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/codingview.wt.dir/CodeSession.o -c /home/irina/projects/lughos/externalLibraries/src/wt/examples/codeview/CodeSession.C

examples/codeview/CMakeFiles/codingview.wt.dir/CodeSession.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/codingview.wt.dir/CodeSession.i"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/codeview && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/irina/projects/lughos/externalLibraries/src/wt/examples/codeview/CodeSession.C > CMakeFiles/codingview.wt.dir/CodeSession.i

examples/codeview/CMakeFiles/codingview.wt.dir/CodeSession.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/codingview.wt.dir/CodeSession.s"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/codeview && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/irina/projects/lughos/externalLibraries/src/wt/examples/codeview/CodeSession.C -o CMakeFiles/codingview.wt.dir/CodeSession.s

examples/codeview/CMakeFiles/codingview.wt.dir/CodeSession.o.requires:
.PHONY : examples/codeview/CMakeFiles/codingview.wt.dir/CodeSession.o.requires

examples/codeview/CMakeFiles/codingview.wt.dir/CodeSession.o.provides: examples/codeview/CMakeFiles/codingview.wt.dir/CodeSession.o.requires
	$(MAKE) -f examples/codeview/CMakeFiles/codingview.wt.dir/build.make examples/codeview/CMakeFiles/codingview.wt.dir/CodeSession.o.provides.build
.PHONY : examples/codeview/CMakeFiles/codingview.wt.dir/CodeSession.o.provides

examples/codeview/CMakeFiles/codingview.wt.dir/CodeSession.o.provides.build: examples/codeview/CMakeFiles/codingview.wt.dir/CodeSession.o

examples/codeview/CMakeFiles/codingview.wt.dir/CoderWidget.o: examples/codeview/CMakeFiles/codingview.wt.dir/flags.make
examples/codeview/CMakeFiles/codingview.wt.dir/CoderWidget.o: /home/irina/projects/lughos/externalLibraries/src/wt/examples/codeview/CoderWidget.C
	$(CMAKE_COMMAND) -E cmake_progress_report /home/irina/projects/lughos/externalLibraries/src/wt-build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object examples/codeview/CMakeFiles/codingview.wt.dir/CoderWidget.o"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/codeview && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/codingview.wt.dir/CoderWidget.o -c /home/irina/projects/lughos/externalLibraries/src/wt/examples/codeview/CoderWidget.C

examples/codeview/CMakeFiles/codingview.wt.dir/CoderWidget.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/codingview.wt.dir/CoderWidget.i"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/codeview && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/irina/projects/lughos/externalLibraries/src/wt/examples/codeview/CoderWidget.C > CMakeFiles/codingview.wt.dir/CoderWidget.i

examples/codeview/CMakeFiles/codingview.wt.dir/CoderWidget.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/codingview.wt.dir/CoderWidget.s"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/codeview && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/irina/projects/lughos/externalLibraries/src/wt/examples/codeview/CoderWidget.C -o CMakeFiles/codingview.wt.dir/CoderWidget.s

examples/codeview/CMakeFiles/codingview.wt.dir/CoderWidget.o.requires:
.PHONY : examples/codeview/CMakeFiles/codingview.wt.dir/CoderWidget.o.requires

examples/codeview/CMakeFiles/codingview.wt.dir/CoderWidget.o.provides: examples/codeview/CMakeFiles/codingview.wt.dir/CoderWidget.o.requires
	$(MAKE) -f examples/codeview/CMakeFiles/codingview.wt.dir/build.make examples/codeview/CMakeFiles/codingview.wt.dir/CoderWidget.o.provides.build
.PHONY : examples/codeview/CMakeFiles/codingview.wt.dir/CoderWidget.o.provides

examples/codeview/CMakeFiles/codingview.wt.dir/CoderWidget.o.provides.build: examples/codeview/CMakeFiles/codingview.wt.dir/CoderWidget.o

examples/codeview/CMakeFiles/codingview.wt.dir/ObserverWidget.o: examples/codeview/CMakeFiles/codingview.wt.dir/flags.make
examples/codeview/CMakeFiles/codingview.wt.dir/ObserverWidget.o: /home/irina/projects/lughos/externalLibraries/src/wt/examples/codeview/ObserverWidget.C
	$(CMAKE_COMMAND) -E cmake_progress_report /home/irina/projects/lughos/externalLibraries/src/wt-build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object examples/codeview/CMakeFiles/codingview.wt.dir/ObserverWidget.o"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/codeview && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/codingview.wt.dir/ObserverWidget.o -c /home/irina/projects/lughos/externalLibraries/src/wt/examples/codeview/ObserverWidget.C

examples/codeview/CMakeFiles/codingview.wt.dir/ObserverWidget.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/codingview.wt.dir/ObserverWidget.i"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/codeview && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/irina/projects/lughos/externalLibraries/src/wt/examples/codeview/ObserverWidget.C > CMakeFiles/codingview.wt.dir/ObserverWidget.i

examples/codeview/CMakeFiles/codingview.wt.dir/ObserverWidget.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/codingview.wt.dir/ObserverWidget.s"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/codeview && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/irina/projects/lughos/externalLibraries/src/wt/examples/codeview/ObserverWidget.C -o CMakeFiles/codingview.wt.dir/ObserverWidget.s

examples/codeview/CMakeFiles/codingview.wt.dir/ObserverWidget.o.requires:
.PHONY : examples/codeview/CMakeFiles/codingview.wt.dir/ObserverWidget.o.requires

examples/codeview/CMakeFiles/codingview.wt.dir/ObserverWidget.o.provides: examples/codeview/CMakeFiles/codingview.wt.dir/ObserverWidget.o.requires
	$(MAKE) -f examples/codeview/CMakeFiles/codingview.wt.dir/build.make examples/codeview/CMakeFiles/codingview.wt.dir/ObserverWidget.o.provides.build
.PHONY : examples/codeview/CMakeFiles/codingview.wt.dir/ObserverWidget.o.provides

examples/codeview/CMakeFiles/codingview.wt.dir/ObserverWidget.o.provides.build: examples/codeview/CMakeFiles/codingview.wt.dir/ObserverWidget.o

# Object files for target codingview.wt
codingview_wt_OBJECTS = \
"CMakeFiles/codingview.wt.dir/CoderApplication.o" \
"CMakeFiles/codingview.wt.dir/CodeSession.o" \
"CMakeFiles/codingview.wt.dir/CoderWidget.o" \
"CMakeFiles/codingview.wt.dir/ObserverWidget.o"

# External object files for target codingview.wt
codingview_wt_EXTERNAL_OBJECTS =

examples/codeview/codingview.wt: examples/codeview/CMakeFiles/codingview.wt.dir/CoderApplication.o
examples/codeview/codingview.wt: examples/codeview/CMakeFiles/codingview.wt.dir/CodeSession.o
examples/codeview/codingview.wt: examples/codeview/CMakeFiles/codingview.wt.dir/CoderWidget.o
examples/codeview/codingview.wt: examples/codeview/CMakeFiles/codingview.wt.dir/ObserverWidget.o
examples/codeview/codingview.wt: examples/codeview/CMakeFiles/codingview.wt.dir/build.make
examples/codeview/codingview.wt: src/http/libwthttp.so.3.3.4
examples/codeview/codingview.wt: src/libwt.so.3.3.4
examples/codeview/codingview.wt: /usr/lib/x86_64-linux-gnu/libboost_thread.so
examples/codeview/codingview.wt: /usr/lib/x86_64-linux-gnu/libboost_random.so
examples/codeview/codingview.wt: /usr/lib/x86_64-linux-gnu/libboost_regex.so
examples/codeview/codingview.wt: /usr/lib/x86_64-linux-gnu/libboost_signals.so
examples/codeview/codingview.wt: /usr/lib/x86_64-linux-gnu/libz.so
examples/codeview/codingview.wt: /usr/lib/x86_64-linux-gnu/libboost_thread.so
examples/codeview/codingview.wt: /usr/lib/x86_64-linux-gnu/libssl.so
examples/codeview/codingview.wt: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
examples/codeview/codingview.wt: /usr/lib/x86_64-linux-gnu/libboost_system.so
examples/codeview/codingview.wt: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
examples/codeview/codingview.wt: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
examples/codeview/codingview.wt: examples/codeview/CMakeFiles/codingview.wt.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable codingview.wt"
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/codeview && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/codingview.wt.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/codeview/CMakeFiles/codingview.wt.dir/build: examples/codeview/codingview.wt
.PHONY : examples/codeview/CMakeFiles/codingview.wt.dir/build

examples/codeview/CMakeFiles/codingview.wt.dir/requires: examples/codeview/CMakeFiles/codingview.wt.dir/CoderApplication.o.requires
examples/codeview/CMakeFiles/codingview.wt.dir/requires: examples/codeview/CMakeFiles/codingview.wt.dir/CodeSession.o.requires
examples/codeview/CMakeFiles/codingview.wt.dir/requires: examples/codeview/CMakeFiles/codingview.wt.dir/CoderWidget.o.requires
examples/codeview/CMakeFiles/codingview.wt.dir/requires: examples/codeview/CMakeFiles/codingview.wt.dir/ObserverWidget.o.requires
.PHONY : examples/codeview/CMakeFiles/codingview.wt.dir/requires

examples/codeview/CMakeFiles/codingview.wt.dir/clean:
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/codeview && $(CMAKE_COMMAND) -P CMakeFiles/codingview.wt.dir/cmake_clean.cmake
.PHONY : examples/codeview/CMakeFiles/codingview.wt.dir/clean

examples/codeview/CMakeFiles/codingview.wt.dir/depend:
	cd /home/irina/projects/lughos/externalLibraries/src/wt-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/irina/projects/lughos/externalLibraries/src/wt /home/irina/projects/lughos/externalLibraries/src/wt/examples/codeview /home/irina/projects/lughos/externalLibraries/src/wt-build /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/codeview /home/irina/projects/lughos/externalLibraries/src/wt-build/examples/codeview/CMakeFiles/codingview.wt.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/codeview/CMakeFiles/codingview.wt.dir/depend
