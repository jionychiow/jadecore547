# Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

set(scripts_STAT_SRCS
  ${scripts_STAT_SRCS}
# The Stonecore
  Maelstrom/TheStonecore/boss_corborus.cpp
  Maelstrom/TheStonecore/boss_slabhide.cpp
  Maelstrom/TheStonecore/boss_ozruk.cpp
  Maelstrom/TheStonecore/boss_high_priestess_azil.cpp
  Maelstrom/TheStonecore/instance_the_stonecore.cpp
  Maelstrom/TheStonecore/the_stonecore.cpp
  Maelstrom/TheStonecore/the_stonecore.h
# Zones
  Maelstrom/Zones/zone_deepholm.cpp
  Maelstrom/Zones/zone_kezan.cpp
  Maelstrom/Zones/zone_lost_isles.cpp
)

message("  -> Prepared: The Maelstrom")