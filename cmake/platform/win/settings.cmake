# Platform-specfic options
option(USE_MYSQL_SOURCES "Use included MySQL-sources to build libraries" 1)

# Package overloads
set(ACE_INCLUDE_DIR ${CMAKE_SOURCE_DIR}/dep/acelite)
set(ACE_LIBRARY "ace")

# check the CMake preload parameters (commented out by default)

# overload CMAKE_INSTALL_PREFIX if not being set properly
#if( WIN32 )
#  if( NOT CYGWIN )
#    if( NOT CMAKE_INSTALL_PREFIX )
#      set(CMAKE_INSTALL_PREFIX "${CMAKE_BINARY_DIR}/bin")
#    endif()
#  endif()
#endif()

if (WIN32)
  add_definitions(-D_WIN32_WINNT=0x0601)
endif()

include(${CMAKE_SOURCE_DIR}/cmake/compiler/msvc/settings.cmake)
