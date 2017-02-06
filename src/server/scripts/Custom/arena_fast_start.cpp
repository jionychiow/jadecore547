#include "ScriptPCH.h"

class FastArenaCrystal : public GameObjectScript
{
    public:

        FastArenaCrystal()
            : GameObjectScript("FastArenaCrystal")
        {
        }

        bool OnGossipHello(Player* player, GameObject* go)
        {
            if (Battleground *bg = player->GetBattleground())
                if (bg->isArena())
                    ChatHandler(player).PSendSysMessage("Players clicked: %u", bg->ClickFastStart(player, go));

            return false;
        }
};

void AddSC_arena_fast_start()
{
    new FastArenaCrystal();
}
