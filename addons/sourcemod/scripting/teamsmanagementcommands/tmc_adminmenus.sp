enum TM_Menu_Category
{
	TM_TEAM = 1,
	TM_PLAYER,
	TM_CLAN
};

#include "teamsmanagementcommands/adminmenus/adminmenus_team.sp"
#include "teamsmanagementcommands/adminmenus/adminmenus_player.sp"
#include "teamsmanagementcommands/adminmenus/adminmenus_clan.sp"

menu_tmCatMenu(client, TM_Menu_Category:category)
{
	new Handle:menu;
	
	decl String:title[64];
	
	switch (category)
	{
		case TM_TEAM :
		{
			menu = CreateMenu(MenuHandler_TeamCategory);
			FormatEx(title, sizeof(title), "%T:", "AdminMenuCat TMTeam 15", client);
			addTeamsOptionsToTeamMenu(menu, client);
		}
		case TM_PLAYER :
		{
			menu = CreateMenu(MenuHandler_PlayerCategory); //TODO & change all the rest
			FormatEx(title, sizeof(title), "%T:", "AdminMenuCat TMPlayer 15", client);
			addTeamsOptionsToPlayerMenu(menu, client);
		}
		case TM_CLAN :
		{
			menu = CreateMenu(MenuHandler_ClanCategory);
			FormatEx(title, sizeof(title), "%T:", "AdminMenuCat TMClan 15", client);
			addTeamsOptionsToClanMenu(menu, client);
		}
	}
	SetMenuTitle(menu, title);
	SetMenuExitBackButton(menu, true);
	
	DisplayMenu(menu, client, MENU_TIME_FOREVER);
}