
include(ExternalProject)

project(lugos-dependencies)
cmake_minimum_required(VERSION 2.8)

set(PROJECT_NAME lughos-dependencies)
set(PROJECT_BRIEF_DESCRIPTION "Library for exposing of classes to various interfaces")
set(INSTALL_PREFIX /usr)
set(GENERATE_PACKAGES ZIP) #Special seperator , instead of ; set in the external-projects
#set(PROJECT_LOGO)

if(${CMAKE_CROSSCOMPILING})
	message("Crosscompiling dependencies for System ${CMAKE_SYSTEM}")
else()
	message("Compiling dependencies for this System (${CMAKE_SYSTEM})")
endif()

if(${CMAKE_SYSTEM_NAME} STREQUAL "Windows" OR ${CMAKE_HOST_SYSTEM_NAME} STREQUAL "Windows")
message("-> Building NSIS-installer for Windows platform.")
set(GENERATE_PACKAGES ${GENERATE_PACKAGES},NSIS)
endif()
if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux" OR ${CMAKE_HOST_SYSTEM_NAME} STREQUAL "Linux")
message("-> Building DEB,RPM and TGZ-packages for Linux platform.")
set(GENERATE_PACKAGES ${GENERATE_PACKAGES},DEB,RPM,TGZ)
endif()

if(${MINGW})
message("Compiling via MinGW")
set(INSTALL_PREFIX /usr/${COMPILER_PREFIX})
endif()
message("Toolchain file: ${CMAKE_TOOLCHAIN_FILE}\n")

set(CPACK_COMMANDLINE ${CMAKE_CPACK_COMMAND}) 
list(APPEND CPACK_COMMANDLINE 
  -G ${GENERATE_PACKAGES}
#    --verbose
#    --debug
#   -D CPACK_SET_DESTDIR=ON

  -D CPACK_CMAKE_GENERATOR=Unix\ Makefiles
  -D CPACK_SYSTEM_NAME=${CMAKE_SYSTEM_NAME}
  -D CPACK_OUTPUT_FILE_PREFIX=${CMAKE_CURRENT_SOURCE_DIR}/${CMAKE_SYSTEM_NAME}
  -D CPACK_OUTPUT_CONFIG_FILE=<BINARY_DIR>/CPackConfig.cmake
  -D CPACK_PACKAGING_INSTALL_PREFIX=${INSTALL_PREFIX}
#  -D CPACK_SET_DESTDIR=ON
)
if(${CMAKE_CROSSCOMPILING})
list(APPEND CPACK_COMMANDLINE
  -D CPACK_RPM_PACKAGE_ARCHITECTURE=${CMAKE_HOST_SYSTEM_PROCESSOR}
  -D CPACK_DEBIAN_PACKAGE_ARCHITECTURE=${CMAKE_HOST_SYSTEM_PROCESSOR})
else()
list(APPEND CPACK_COMMANDLINE
  -D CPACK_RPM_PACKAGE_ARCHITECTURE=${CMAKE_SYSTEM_PROCESSOR}   
  -D CPACK_DEBIAN_PACKAGE_ARCHITECTURE=${CMAKE_SYSTEM_PROCESSOR})
endif()

message(${CPACK_COMMANDLINE})
### Download and compile missing external libraries

ExternalProject_Add(
      libharu
      PREFIX ${CMAKE_SYSTEM_NAME}
      INSTALL_DIR ${INSTALL_PREFIX}
      LIST_SEPARATOR , 
      INSTALL_COMMAND ${CPACK_COMMANDLINE}
	-P libharu
        --config <BINARY_DIR>/CPackConfig.cmake
	-D CPACK_PACKAGE_CONTACT=Joern\ Mankiewicz
      GIT_REPOSITORY https://github.com/libharu/libharu.git #Comment-out when cmake keeps buggin you with rebuilds
      CMAKE_ARGS 
        -DCMAKE_TOOLCHAIN_FILE:FILEPATH=${CMAKE_CURRENT_TOOLCHAIN_FILE}
	-DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR> 
	-DCONFIGDIR:STRING=<INSTALL_DIR>/etc
# 	-DCMAKE_FIND_LIBRARY_SUFFIXES:STRING=".a;.dll.a"
)



# ExternalProject_Add(
#  boost
#  PREFIX ${CMAKE_SYSTEM_NAME}
#  INSTALL_DIR ${INSTALL_PREFIX}
#  LIST_SEPARATOR ,
#  INSTALL_COMMAND ""
#  GIT_REPOSITORY https://github.com/boostorg/boost.git
# )


ExternalProject_Add(
    Wt
    DEPENDS libharu
    PREFIX ${CMAKE_SYSTEM_NAME}
    PATCH_COMMAND git reset --hard && git apply -v ${CMAKE_CURRENT_SOURCE_DIR}/wt.patch
    INSTALL_DIR ${INSTALL_PREFIX}
    LIST_SEPARATOR ,
    INSTALL_COMMAND ${CPACK_COMMANDLINE}	
	-D CPACK_PACKAGE_NAME=wt
 	-D CPACK_PACKAGE_VERSION=3.3.4
 	-D CPACK_INSTALL_CMAKE_PROJECTS=<BINARY_DIR>/,WT,ALL,/
 	-D CPACK_PACKAGE_FILE_NAME=Wt
 	-D CPACK_PACKAGE_DESCRIPTION_FILE=<SOURCE_DIR>/README.md
        -D CPACK_PACKAGE_DESCRIPTION_SUMMARY=Wt\ webtoolk
        -D CPACK_RESOURCE_FILE_LICENSE=<SOURCE_DIR>/LICENSE
#	-D CPACK_DEBIAN_PACKAGE_DEPENDS=libharu\ (>=\ 2.0.0)
	-D CPACK_PACKAGE_CONTACT=Joern\ Mankiewicz
      GIT_REPOSITORY https://github.com/kdeforche/wt.git #Comment-out when cmake keeps buggin you with rebuilds
    CMAKE_ARGS 
      -DCMAKE_TOOLCHAIN_FILE:FILEPATH=${CMAKE_CURRENT_TOOLCHAIN_FILE} 
      -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR> 
      -DCONNECTOR_FCGI:BOOL=OFF
      -DINSTALL_FINDWT_CMAKE_FILE:BOOL=OFF
#      -DWT_CMAKE_FINDER_INSTALL_DIR:PATH=${CMAKE_CURRENT_SOURCE_DIR}../cmake/modules
      -DINSTALL_RESOURCES:BOOL=ON
      -DWT_CPP_11_MODE:STRING=-std=c++11
      -DBUILD_EXAMPLES=OFF
      -DBUILD_TESTS=OFF
#      -DBoost_USE_STATIC_LIBS=ON
#       -DBOOST_LIBRARYDIR:PATH=${CMAKE_FIND_ROOT_PATH}/bin
#       -DBOOST_ROOT=
#       -DWT_WRASTERIMAGE_IMPLEMENTATION:STRING=GraphicsMagick
#       -DHARU_PREFIX:STRING=${EXT_LIB_DIR}
#       -DCMAKE_FIND_LIBRARY_SUFFIXES:STRING=".a;.dll.a"

 )
