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
  Commands/cs_anticheat.cpp
  Commands/cs_account.cpp
  Commands/cs_achievement.cpp
  Commands/cs_ban.cpp
  Commands/cs_bf.cpp
  Commands/cs_cast.cpp
  Commands/cs_character.cpp
  Commands/cs_character.cpp
  Commands/cs_cheat.cpp
  Commands/cs_debug.cpp
  Commands/cs_disable.cpp
  Commands/cs_event.cpp
  Commands/cs_gm.cpp
  Commands/cs_go.cpp
  Commands/cs_gobject.cpp
  Commands/cs_guild.cpp
  Commands/cs_honor.cpp
  Commands/cs_instance.cpp
  Commands/cs_learn.cpp
  Commands/cs_list.cpp
  Commands/cs_lookup.cpp
  Commands/cs_message.cpp
  Commands/cs_misc.cpp
  Commands/cs_modify.cpp
  Commands/cs_npc.cpp
  Commands/cs_quest.cpp
  Commands/cs_reload.cpp
  Commands/cs_reset.cpp
  Commands/cs_tele.cpp
  Commands/cs_ticket.cpp
  Commands/cs_server.cpp
  Commands/cs_titles.cpp
  Commands/cs_wp.cpp
  Commands/cs_vip.cpp
)

message("  -> Prepared: Commands")
