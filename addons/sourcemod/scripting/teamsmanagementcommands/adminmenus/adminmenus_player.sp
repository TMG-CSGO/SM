//Menus & handlers, followed by the TopMenu category stuff
menu_SetTeamTerro(client)
{
	new Handle:menu = CreateMenu(MenuHandler_SetTeamTerro);
	
	decl String:title[64];
	FormatEx(title, sizeof(title), "%T:", "AdminMenu ToTeam 15", client, g_szTeamNames[ 0 ]);
	SetMenuTitle(menu, title);
	SetMenuExitBackButton(menu, true);
	
	addPlayersToMenu(menu, REMOVE_TEAMLESS | REMOVE_SPECTATORS);
	
	DisplayMenu(menu, client, MENU_TIME_FOREVER);
}
public MenuHandler_SetTeamTerro(Handle:menu, MenuAction:action, param1, param2)
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
		decl String:cmd[64];
		
		GetMenuItem(menu, param2, info, sizeof(info)); //info has userId
		
		if (GetClientOfUserId(StringToInt(info)) == 0)
			PrintToChat(param1, "[SM] %t", "Player no longer available");
		else
		{
			FormatEx(cmd, sizeof(cmd), "sm_team1 #%s", info);
			FakeClientCommand(param1, cmd);
		}
		
		menu_SetTeamTerro(param1);
	}
}
menu_SetTeamTerroInstant(client)
{
	new Handle:menu = CreateMenu(MenuHandler_SetTeamTerroInstant);
	
	decl String:title[64];
	FormatEx(title, sizeof(title), "%T:", "AdminMenu ToTeamInstant 15", client, g_szTeamNames[ 0 ]);
	SetMenuTitle(menu, title);
	SetMenuExitBackButton(menu, true);
	
	addPlayersToMenu(menu, REMOVE_TEAMLESS | REMOVE_SPECTATORS);
	
	DisplayMenu(menu, client, MENU_TIME_FOREVER);
}
public MenuHandler_SetTeamTerroInstant(Handle:menu, MenuAction:action, param1, param2)
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
		decl String:cmd[64];
		
		GetMenuItem(menu, param2, info, sizeof(info)); //info has userId
		
		if (GetClientOfUserId(StringToInt(info)) == 0)
			PrintToChat(param1, "[SM] %t", "Player no longer available");
		else
		{
			FormatEx(cmd, sizeof(cmd), "sm_iteam1 #%s", info);
			FakeClientCommand(param1, cmd);
		}
		
		menu_SetTeamTerroInstant(param1);
	}
}
menu_SetTeamCT(client)
{
	new Handle:menu = CreateMenu(MenuHandler_SetTeamCT);
	
	decl String:title[64];
	FormatEx(title, sizeof(title), "%T:", "AdminMenu ToTeam 15", client, g_szTeamNames[ 1 ]);
	SetMenuTitle(menu, title);
	SetMenuExitBackButton(menu, true);
	
	addPlayersToMenu(menu, REMOVE_TEAMLESS | REMOVE_SPECTATORS);
	
	DisplayMenu(menu, client, MENU_TIME_FOREVER);
}
public MenuHandler_SetTeamCT(Handle:menu, MenuAction:action, param1, param2)
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
		decl String:cmd[64];
		
		GetMenuItem(menu, param2, info, sizeof(info)); //info has userId
		
		if (GetClientOfUserId(StringToInt(info)) == 0)
			PrintToChat(param1, "[SM] %t", "Player no longer available");
		else
		{
			FormatEx(cmd, sizeof(cmd), "sm_team2 #%s", info);
			FakeClientCommand(param1, cmd);
		}
		
		menu_SetTeamCT(param1);
	}
}
menu_SetTeamCTInstant(client)
{
	new Handle:menu = CreateMenu(MenuHandler_SetTeamCTInstant);
	
	decl String:title[64];
	FormatEx(title, sizeof(title), "%T:", "AdminMenu ToTeamInstant 15", client, g_szTeamNames[ 1 ]);
	SetMenuTitle(menu, title);
	SetMenuExitBackButton(menu, true);
	
	addPlayersToMenu(menu, REMOVE_TEAMLESS | REMOVE_SPECTATORS);
	
	DisplayMenu(menu, client, MENU_TIME_FOREVER);
}
public MenuHandler_SetTeamCTInstant(Handle:menu, MenuAction:action, param1, param2)
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
		decl String:cmd[64];
		
		GetMenuItem(menu, param2, info, sizeof(info)); //info has userId
		
		if (GetClientOfUserId(StringToInt(info)) == 0)
			PrintToChat(param1, "[SM] %t", "Player no longer available");
		else
		{
			FormatEx(cmd, sizeof(cmd), "sm_iteam2 #%s", info);
			FakeClientCommand(param1, cmd);
		}
		
		menu_SetTeamCTInstant(param1);
	}
}
//Since 1.4.0
menu_SetTeamSpec(client)
{
	new Handle:menu = CreateMenu(MenuHandler_SetTeamSpec);
	
	decl String:title[64];
	FormatEx(title, sizeof(title), "%T:", "AdminMenu ToTeamSpec 14", client);
	SetMenuTitle(menu, title);
	SetMenuExitBackButton(menu, true);
	
	addPlayersToMenu(menu, REMOVE_TEAMLESS | REMOVE_SPECTATORS);
	
	DisplayMenu(menu, client, MENU_TIME_FOREVER);
}
public MenuHandler_SetTeamSpec(Handle:menu, MenuAction:action, param1, param2)
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
		decl String:cmd[64];
		
		GetMenuItem(menu, param2, info, sizeof(info)); //info has userId
		
		if (GetClientOfUserId(StringToInt(info)) == 0)
			PrintToChat(param1, "[SM] %t", "Player no longer available");
		else
		{
			FormatEx(cmd, sizeof(cmd), "sm_teamspec #%s", info);
			FakeClientCommand(param1, cmd);
		}
		
		menu_SetTeamSpec(param1);
	}
}
menu_ChangeTeam(client)
{
	new Handle:menu = CreateMenu(MenuHandler_ChangeTeam);
	
	decl String:title[64];
	FormatEx(title, sizeof(title), "%T:", "AdminMenu ChangeTeam 11", client);
	SetMenuTitle(menu, title);
	SetMenuExitBackButton(menu, true);
	
	addPlayersToMenu(menu, REMOVE_TEAMLESS | REMOVE_SPECTATORS);
	
	DisplayMenu(menu, client, MENU_TIME_FOREVER);
}
public MenuHandler_ChangeTeam(Handle:menu, MenuAction:action, param1, param2)
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
		decl String:cmd[64];
		
		GetMenuItem(menu, param2, info, sizeof(info)); //info has userId
		
		if (GetClientOfUserId(StringToInt(info)) == 0)
			PrintToChat(param1, "[SM] %t", "Player no longer available");
		else
		{
			FormatEx(cmd, sizeof(cmd), "sm_cteam #%s", info);
			FakeClientCommand(param1, cmd);
		}
		
		menu_ChangeTeam(param1);
	}
}
menu_ChangeTeamInstant(client)
{
	new Handle:menu = CreateMenu(MenuHandler_ChangeTeamInstant);
	
	decl String:title[64];
	FormatEx(title, sizeof(title), "%T:", "AdminMenu ChangeTeamInstant 15", client);
	SetMenuTitle(menu, title);
	SetMenuExitBackButton(menu, true);
	
	addPlayersToMenu(menu, REMOVE_TEAMLESS | REMOVE_SPECTATORS);
	
	DisplayMenu(menu, client, MENU_TIME_FOREVER);
}
public MenuHandler_ChangeTeamInstant(Handle:menu, MenuAction:action, param1, param2)
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
		decl String:cmd[64];
		
		GetMenuItem(menu, param2, info, sizeof(info)); //info has userId
		
		if (GetClientOfUserId(StringToInt(info)) == 0)
			PrintToChat(param1, "[SM] %t", "Player no longer available");
		else
		{
			FormatEx(cmd, sizeof(cmd), "sm_icteam #%s", info);
			FakeClientCommand(param1, cmd);
		}
		
		menu_ChangeTeamInstant(param1);
	}
}
menu_CancelChangeTeam(client)
{
	new Handle:menu = CreateMenu(MenuHandler_CancelChangeTeam);
	
	decl String:title[64];
	FormatEx(title, sizeof(title), "%T:", "AdminMenu CancelChangeTeam 11", client);
	SetMenuTitle(menu, title);
	SetMenuExitBackButton(menu, true);
	
	addPlayersToMenu(menu, REMOVE_TEAMLESS | REMOVE_SPECTATORS);
	
	DisplayMenu(menu, client, MENU_TIME_FOREVER);
}
public MenuHandler_CancelChangeTeam(Handle:menu, MenuAction:action, param1, param2)
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
		decl String:cmd[64];
		
		GetMenuItem(menu, param2, info, sizeof(info)); //info has userId
		
		if (GetClientOfUserId(StringToInt(info)) == 0)
			PrintToChat(param1, "[SM] %t", "Player no longer available");
		else
		{
			FormatEx(cmd, sizeof(cmd), "sm_cancelchangeteam #%s", info);		
			FakeClientCommand(param1, cmd);
		}
		
		menu_CancelChangeTeam(param1);
	}
}

addPlayersToMenu(Handle:menu, flags)
{
	decl String:user_id[12];
	decl String:name[MAX_NAME_LENGTH];
	decl String:display[MAX_NAME_LENGTH+20];//12+5+1(' ')+1('(')+1(')')
	
	decl iTeam;
	
	for (new i = 1; i <= MaxClients; ++i)
	{
		//Normal checks
		if (!IsClientInGame(i)			|| 
				IsClientInKickQueue(i))
			continue;
		
		iTeam = GetClientTeam(i);
		
		//Flag checks
		if (flags & REMOVE_TEAMLESS && iTeam == 0)
			continue;
			
		if (flags & REMOVE_SPECTATORS && iTeam == 1)
			continue;
			
		if (flags & REMOVE_TERRORISTS && iTeam == 2)
			continue;
			
		if (flags & REMOVE_CTS && iTeam == 3)
			continue;
		
		IntToString(GetClientUserId(i), user_id, sizeof(user_id));
		GetClientName(i, name, sizeof(name));
		FormatEx(display, sizeof(display), "%s%s (%s)", g_szPlayerTeamPrefix[ i ], name, user_id);
		AddMenuItem(menu, user_id, display);
	}
}







public AdminMenu_TMPlayerMenu(Handle:topmenu, 
					  TopMenuAction:action,
					  TopMenuObject:object_id,
					  param,
					  String:buffer[],
					  maxlength)
{
	if (action == TopMenuAction_DisplayOption)
	{
		FormatEx(buffer, maxlength, "%T", "AdminMenuCat TMPlayer 15", param);
	}
	else if (action == TopMenuAction_SelectOption)
	{
		menu_tmCatMenu(param, TM_PLAYER);
	}
}
public MenuHandler_PlayerCategory(Handle:menu, MenuAction:action, param1, param2)
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
		
		fromMenu_ExecutePlayerInfo(param1, info/*, sizeof(info)*/);
	}
}
addTeamsOptionsToPlayerMenu(Handle:menu, any:client)
{
	decl String:info[8]; //hold function to call
	decl String:display[64];
	
	new options = GetConVarInt( g_tmc_allow_switch_indiv ) | ( GetConVarInt( g_tmc_allow_switch_indiv_instant ) << 1 );
	
	//I add in a specific order the items
	
	//Add the different teams actions
	if ( options & 1 )
	{
		strcopy(info, sizeof(info), "000");
		FormatEx(display, sizeof(display), "%T", "AdminMenu ToTeam 15", client, g_szTeamNames[ 0 ]);
		AddMenuItem(menu, info, display);
	}
	
	if ( options & 2 )
	{
		strcopy(info, sizeof(info), "001");
		FormatEx(display, sizeof(display), "%T", "AdminMenu ToTeamInstant 15", client, g_szTeamNames[ 0 ]);
		AddMenuItem(menu, info, display);
	}
	
	if ( options & 1 )
	{
		strcopy(info, sizeof(info), "002");
		FormatEx(display, sizeof(display), "%T", "AdminMenu ToTeam 15", client, g_szTeamNames[ 1 ]);
		AddMenuItem(menu, info, display);
	}
	
	if ( options & 2 )
	{
		strcopy(info, sizeof(info), "003");
		FormatEx(display, sizeof(display), "%T", "AdminMenu ToTeamInstant 15", client, g_szTeamNames[ 1 ]);
		AddMenuItem(menu, info, display);
	}
	
	if ( options & 1 )
	{
		strcopy(info, sizeof(info), "004");
		FormatEx(display, sizeof(display), "%T", "AdminMenu ChangeTeam 11", client);
		AddMenuItem(menu, info, display);
	}
	
	if ( options & 2 )
	{
		strcopy(info, sizeof(info), "005");
		FormatEx(display, sizeof(display), "%T", "AdminMenu ChangeTeamInstant 15", client);
		AddMenuItem(menu, info, display);
	}
	
	if ( GetConVarBool( g_tmc_allow_switch_spec ) )
	{
		strcopy(info, sizeof(info), "006");
		FormatEx(display, sizeof(display), "%T", "AdminMenu ToTeamSpec 14", client);
		AddMenuItem(menu, info, display);
	}
	
	if ( options )
	{
		strcopy(info, sizeof(info), "007");
		FormatEx(display, sizeof(display), "%T", "AdminMenu CancelChangeTeam 11", client);
		AddMenuItem(menu, info, display);
	}
}
//With info, either call a menu, or call a function
fromMenu_ExecutePlayerInfo(client, String:info[]/*, sizeTagId*/)
{
	new commandId = StringToInt( info );
	switch ( commandId )
	{
		case 0:
			menu_SetTeamTerro(client);
		case 1:
			menu_SetTeamTerroInstant(client);
		case 2:
			menu_SetTeamCT(client);
		case 3:
			menu_SetTeamCTInstant(client);
		case 4:
			menu_ChangeTeam(client);
		case 5:
			menu_ChangeTeamInstant(client);
		case 6:
			menu_SetTeamSpec(client);
		case 7:
			menu_CancelChangeTeam(client);
	}
}