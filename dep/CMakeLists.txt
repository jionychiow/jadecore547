# Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

if( MSVC )
  add_definitions(/W0)
else()
  add_definitions(-w)
endif()


if(SERVERS OR TOOLS)
  add_subdirectory(threads)
  add_subdirectory(zlib)
  add_subdirectory(g3dlite)
  add_subdirectory(jemalloc)
  add_subdirectory(openssl)
  add_subdirectory(mysql)
endif()
  
if(SERVERS)
  if(CMAKE_SYSTEM_NAME MATCHES "Windows")
    add_subdirectory(acelite)
  endif()
  add_subdirectory(gsoap)
endif()

if(TOOLS)
  add_subdirectory(StormLib)
  add_subdirectory(bzip2)
endif()
