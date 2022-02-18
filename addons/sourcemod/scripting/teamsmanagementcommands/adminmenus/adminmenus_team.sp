//TopMenu category stuff (no sub-menus)
public AdminMenu_TMTeamMenu(Handle:topmenu, 
					  TopMenuAction:action,
					  TopMenuObject:object_id,
					  param,
					  String:buffer[],
					  maxlength)
{
	if (action == TopMenuAction_DisplayOption)
	{
		FormatEx(buffer, maxlength, "%T", "AdminMenuCat TMTeam 15", param);
	}
	else if (action == TopMenuAction_SelectOption)
	{
		menu_tmCatMenu(param, TM_TEAM);
	}
}
public MenuHandler_TeamCategory(Handle:menu, MenuAction:action, param1, param2)
{
	if (action == MenuAction_End)
	{
		CloseHandle(menu);
	}
	else if (action == MenuAction_Cancel)
	{
		if (param2 == MenuCancel_ExitBack && hTopMenu != INVALID_HANDLE)
		{
			DisplayTopMenu(hTopMenu, param1, TopMenuPosition_LastCategory);
		}
	}
	else if (action == MenuAction_Select)
	{
		decl String:info[32];
		
		GetMenuItem(menu, param2, info, sizeof(info));
		
		fromMenu_ExecuteTeamInfo(param1, info/*, sizeof(info)*/);
	}
}
addTeamsOptionsToTeamMenu(Handle:menu, any:client)
{
	decl String:info[8]; //hold function to call
	decl String:display[64];
	
	//Add the different teams actions
	if ( GetConVarBool( g_tmc_allow_scramble_fair ) )
	{
		strcopy(info, sizeof(info), "000");
		FormatEx(display, sizeof(display), "%T", "AdminMenu ScrambleFair", client);
		AddMenuItem(menu, info, display);
	}
	
	if ( GetConVarBool( g_tmc_allow_scramble_unfair ) )
	{
		strcopy(info, sizeof(info), "001");
		FormatEx(display, sizeof(display), "%T", "AdminMenu ScrambleUnfair", client);
		AddMenuItem(menu, info, display);
	}
	
	if ( GetConVarBool( g_tmc_allow_scramble_specific ) )
	{
		strcopy(info, sizeof(info), "002");
		FormatEx(display, sizeof(display), "%T", "AdminMenu ScrambleSpecificTeam", client);
		AddMenuItem(menu, info, display);
	}
	
	if ( GetConVarBool( g_tmc_allow_scramble_fair_instant ) )
	{
		strcopy(info, sizeof(info), "003");
		FormatEx(display, sizeof(display), "%T", "AdminMenu ScrambleFairInstant", client);
		AddMenuItem(menu, info, display);
	}
	
	if ( GetConVarBool( g_tmc_allow_scramble_unfair_instant ) )
	{
		strcopy(info, sizeof(info), "004");
		FormatEx(display, sizeof(display), "%T", "AdminMenu ScrambleUnfairInstant", client);
		AddMenuItem(menu, info, display);
	}
	
	if ( GetConVarBool( g_tmc_allow_scramble_specific_instant ) )
	{
		strcopy(info, sizeof(info), "005");
		FormatEx(display, sizeof(display), "%T", "AdminMenu ScrambleSpecificTeamInstant", client);
		AddMenuItem(menu, info, display);
	}
	
	if ( GetConVarBool( g_tmc_allow_team_prevent ) )
	{
		strcopy(info, sizeof(info), "006");
		FormatEx(display, sizeof(display), "%T", "AdminMenu TeamPrevent", client);
		AddMenuItem(menu, info, display);
	}
	
	if ( GetConVarBool( g_tmc_allow_team_cancel ) )
	{
		strcopy(info, sizeof(info), "007");
		FormatEx(display, sizeof(display), "%T", "AdminMenu TeamCancel", client);
		AddMenuItem(menu, info, display);
	}
	
	if ( GetConVarBool( g_tmc_allow_teamswaps ) )
	{
		strcopy(info, sizeof(info), "008");
		FormatEx(display, sizeof(display), "%T", "AdminMenu SwapTeams", client);
		AddMenuItem(menu, info, display);
	}
	
	if ( GetConVarBool( g_tmc_allow_teamswaps_instant ) )
	{
		strcopy(info, sizeof(info), "009");
		FormatEx(display, sizeof(display), "%T", "AdminMenu SwapTeamsInstant", client);
		AddMenuItem(menu, info, display);
	}
}
//With info, either call a menu, or call a function
fromMenu_ExecuteTeamInfo(client, String:info[]/*, sizeTagId*/)
{
	new commandId = StringToInt( info );
	switch ( commandId )
	{
		case 0:
			Command_ScrambleFair(client, 0);
		case 1:
			Command_ScrambleUnfair(client, 0);
		case 2:
			Command_ScrambleSpecificTeam(client, 0);
		case 3:
			Command_ScrambleFairInstant(client, 0);
		case 4:
			Command_ScrambleUnfairInstant(client, 0);
		case 5:
			Command_ScrambleSpecificTeamInstant(client, 0);
		case 6:
			Command_TeamPrevent(client, 0);
		case 7:
			Command_TeamCancel(client, 0);
		case 8:
			Command_SwapTeams(client, 0);
		case 9:
			Command_SwapTeamsInstant(client, 0);
	}
}