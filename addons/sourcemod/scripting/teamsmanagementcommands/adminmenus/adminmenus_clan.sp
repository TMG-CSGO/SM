//Menus & handlers, followed by a menu-versions of admincmds@clan, then the TopMenu category stuff
menu_ClanSetTeamTerro(client)
{
	new Handle:menu = CreateMenu(MenuHandler_ClanSetTeamTerro);
	
	decl String:title[64];
	FormatEx(title, sizeof(title), "%T:", "AdminMenu ClanToTeam 15", client, g_szTeamNames[ 0 ]);
	SetMenuTitle(menu, title);
	SetMenuExitBackButton(menu, true);
	
	addClansToMenu(menu, REMOVE_TEAMLESS | REMOVE_SPECTATORS);
	
	DisplayMenu(menu, client, MENU_TIME_FOREVER);
}
public MenuHandler_ClanSetTeamTerro(Handle:menu, MenuAction:action, param1, param2)
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
		
		GetMenuItem(menu, param2, info, sizeof(info)); //info has clan tag
		
		fromMenu_ClanSetTeamTerroWithId(param1, info/*, sizeof(info)*/);
		
		menu_ClanSetTeamTerro(param1);
	}
}
menu_ClanSetTeamTerroInstant(client)
{
	new Handle:menu = CreateMenu(MenuHandler_ClanSetTeamTerroInstant);
	
	decl String:title[64];
	FormatEx(title, sizeof(title), "%T:", "AdminMenu ClanToTeamInstant 15", client, g_szTeamNames[ 0 ]);
	SetMenuTitle(menu, title);
	SetMenuExitBackButton(menu, true);
	
	addClansToMenu(menu, REMOVE_TEAMLESS | REMOVE_SPECTATORS);
	
	DisplayMenu(menu, client, MENU_TIME_FOREVER);
}
public MenuHandler_ClanSetTeamTerroInstant(Handle:menu, MenuAction:action, param1, param2)
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
		
		GetMenuItem(menu, param2, info, sizeof(info)); //info has clan tag
		
		fromMenu_ClanSetTeamTerroWithIdInstant(param1, info/*, sizeof(info)*/);
		
		menu_ClanSetTeamTerroInstant(param1);
	}
}
menu_ClanSetTeamCT(client)
{
	new Handle:menu = CreateMenu(MenuHandler_ClanSetTeamCT);
	
	decl String:title[64];
	FormatEx(title, sizeof(title), "%T:", "AdminMenu ClanToTeam 15", client, g_szTeamNames[ 1 ]);
	SetMenuTitle(menu, title);
	SetMenuExitBackButton(menu, true);
	
	addClansToMenu(menu, REMOVE_TEAMLESS | REMOVE_SPECTATORS);
	
	DisplayMenu(menu, client, MENU_TIME_FOREVER);
}
public MenuHandler_ClanSetTeamCT(Handle:menu, MenuAction:action, param1, param2)
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
		
		GetMenuItem(menu, param2, info, sizeof(info)); //info has clan tag
		
		fromMenu_ClanSetTeamCTWithId(param1, info/*, sizeof(info)*/);
		
		menu_ClanSetTeamCT(param1);
	}
}
menu_ClanSetTeamCTInstant(client)
{
	new Handle:menu = CreateMenu(MenuHandler_ClanSetTeamCTInstant);
	
	decl String:title[64];
	FormatEx(title, sizeof(title), "%T:", "AdminMenu ClanToTeamInstant 15", client, g_szTeamNames[ 1 ]);
	SetMenuTitle(menu, title);
	SetMenuExitBackButton(menu, true);
	
	addClansToMenu(menu, REMOVE_TEAMLESS | REMOVE_SPECTATORS);
	
	DisplayMenu(menu, client, MENU_TIME_FOREVER);
}
public MenuHandler_ClanSetTeamCTInstant(Handle:menu, MenuAction:action, param1, param2)
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
		
		GetMenuItem(menu, param2, info, sizeof(info)); //info has clan tag
		
		fromMenu_ClanSetTeamCTWithIdInstant(param1, info/*, sizeof(info)*/);
		
		menu_ClanSetTeamCTInstant(param1);
	}
}
//Since 1.4.0 (spec)
menu_ClanSetTeamSpec(client)
{
	new Handle:menu = CreateMenu(MenuHandler_ClanSetTeamSpec);
	
	decl String:title[64];
	FormatEx(title, sizeof(title), "%T:", "AdminMenu ClanTeamSpec 14", client);
	SetMenuTitle(menu, title);
	SetMenuExitBackButton(menu, true);
	
	addClansToMenu(menu, REMOVE_TEAMLESS | REMOVE_SPECTATORS);
	
	DisplayMenu(menu, client, MENU_TIME_FOREVER);
}
public MenuHandler_ClanSetTeamSpec(Handle:menu, MenuAction:action, param1, param2)
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
		
		GetMenuItem(menu, param2, info, sizeof(info)); //info has clan tag
		
		fromMenu_ClanSetTeamSpecWithId(param1, info/*, sizeof(info)*/);
		
		menu_ClanSetTeamSpec(param1);
	}
}
menu_ClanChangeTeam(client)
{
	new Handle:menu = CreateMenu(MenuHandler_ClanChangeTeam);
	
	decl String:title[64];
	FormatEx(title, sizeof(title), "%T:", "AdminMenu ClanChangeTeam 13", client);
	SetMenuTitle(menu, title);
	SetMenuExitBackButton(menu, true);
	
	addClansToMenu(menu, REMOVE_TEAMLESS | REMOVE_SPECTATORS);
	
	DisplayMenu(menu, client, MENU_TIME_FOREVER);
}
public MenuHandler_ClanChangeTeam(Handle:menu, MenuAction:action, param1, param2)
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
		
		GetMenuItem(menu, param2, info, sizeof(info)); //info has clan tag
		
		fromMenu_ClanChangeTeamWithId(param1, info/*, sizeof(info)*/);
		
		menu_ClanChangeTeam(param1);
	}
}
menu_ClanChangeTeamInstant(client)
{
	new Handle:menu = CreateMenu(MenuHandler_ClanChangeTeamInstant);
	
	decl String:title[64];
	FormatEx(title, sizeof(title), "%T:", "AdminMenu ClanChangeTeamInstant 15", client);
	SetMenuTitle(menu, title);
	SetMenuExitBackButton(menu, true);
	
	addClansToMenu(menu, REMOVE_TEAMLESS | REMOVE_SPECTATORS);
	
	DisplayMenu(menu, client, MENU_TIME_FOREVER);
}
public MenuHandler_ClanChangeTeamInstant(Handle:menu, MenuAction:action, param1, param2)
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
		
		GetMenuItem(menu, param2, info, sizeof(info)); //info has clan tag
		
		fromMenu_ClanChangeTeamWithIdInstant(param1, info/*, sizeof(info)*/);
		
		menu_ClanChangeTeamInstant(param1);
	}
}
menu_ClanCancelChangeTeam(client)
{
	new Handle:menu = CreateMenu(MenuHandler_ClanCancelChangeTeam);
	
	decl String:title[64];
	FormatEx(title, sizeof(title), "%T:", "AdminMenu ClanCancelChangeTeam 13", client);
	SetMenuTitle(menu, title);
	SetMenuExitBackButton(menu, true);
	
	addClansToMenu(menu, REMOVE_TEAMLESS | REMOVE_SPECTATORS);
	
	DisplayMenu(menu, client, MENU_TIME_FOREVER);
}
public MenuHandler_ClanCancelChangeTeam(Handle:menu, MenuAction:action, param1, param2)
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
		
		GetMenuItem(menu, param2, info, sizeof(info)); //info has clan tag
		
		fromMenu_ClanCancelChangeTeamWithId(param1, info/*, sizeof(info)*/);
		
		menu_ClanCancelChangeTeam(param1);
	}
}
addClansToMenu(Handle:menu, flags)
{
	//Reset clan list
	decl String:szClans[ MAXPLAYERS - 1 ][ 13 ];//YEAH -1, DONT TELL ME SOURCETV HAS A CLAN K?
	new clanCount;
	
	decl String:szTmpClan[ 13 ];
	decl String:szTmpClanId[ 32 ];
	
	decl iTeam;
	
	for (new i = 1; i <= MaxClients; ++i)
	{
		if (IsClientInGame( i))
		{
			//Normal checks
			if (!IsClientInGame(i) || IsClientInKickQueue(i))
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
			
			CS_GetClientClanTag( i, szTmpClan, sizeof(szTmpClan) );
			
			if ( !stringExistInArray( szClans, clanCount, szTmpClan ) )
			{
				strcopy( szClans[ clanCount++ ], sizeof(szClans[]), szTmpClan );
				GetClientInfo( i, "cl_clanid", szTmpClanId, sizeof(szTmpClanId) );
				AddMenuItem(menu, szTmpClanId, szTmpClan);
			}
		}
	}
}








//cl_clanid method; used with the menus and not with commands
fromMenu_ClanSetTeamTerroWithId(client, String:szTagId[]/*, sizeTagId*/)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_switch_clan_menu ) )
	{
		ReplyToCommand(client, "[SM] %t", "DisabledOption");
		return;
	}
	
	//Prevent people from outside to run the command
	if (client == 0)
	{
		ReplyToCommand(client, "[SM] %t", "Command is in-game only");
		return;
	}
	
	new matchedCount;
	new willBeSwitchedCount;
	
	decl String:szTmpTagId[ 13 ];
	
	decl String:szTag[ 13 ];
	
	for ( new i = 1; i <= MaxClients; ++i )
	{
		if ( IsClientInGame( i ) &&
				GetClientTeam( i ) > 1 )
		{
			GetClientInfo( i, "cl_clanid", szTmpTagId, sizeof(szTmpTagId) );
			
			if ( StrEqual( szTagId, szTmpTagId ) )
			{
				if ( !matchedCount )
				{
					CS_GetClientClanTag( i, szTag, sizeof(szTag) );
				}
				
				if ( RequestTeamsManagement( any:REASON_ADMIN,
					TMC_PRIORITY,
					TeamsManagementType:TMT_INDIVIDUALS,
					2,
					i,
					0 ) )
				{
					
					decl String:szTeamBufferPrefix[ 6 ];
					getTeamNameConditionalLowerCase( 2, szTeamBufferPrefix, 4 );
					szTeamBufferPrefix[ 3 ] = '\0';
					Format( szTeamBufferPrefix, sizeof(szTeamBufferPrefix), "[%s]", szTeamBufferPrefix );
					g_szPlayerTeamPrefix[ i ] = szTeamBufferPrefix;
					
					++willBeSwitchedCount;
				}
				
				++matchedCount;
			}
		}
	}
	
	if ( !matchedCount )
	{
		ReplyToCommand(client, "[SM] %t", "No matching clients");
	}
	else if ( !willBeSwitchedCount )
	{
		ReplyToCommand(client, "[SM] %t", "F_ClanTeamChange 13");
	}
	else
	{
		if ( GetConVarInt( g_tmc_verbose_clan ) )
			ShowActivity2(client, "\x04[SM] \x03", "\x01%t", "ClanWillBeToTeam 15", "\x04", willBeSwitchedCount, "\x01", "\x04", szTag, "\x01", "\x04", matchedCount, "\x01", g_szTeamNames[ 0 ]);
		else
			ReplyToCommand(client, "[SM] %t", "ClanWillBeToTeam 15", "", willBeSwitchedCount, "", "", szTag, "", "", matchedCount, "", g_szTeamNames[ 0 ]);
		
		if (GetConVarInt(g_tmc_log))
			LogAction(client, -1, "\"%L\" made players with clan tag \"%s\" be %s for the next round", client, szTag, g_szTeamNames[ 0 ]);
		
	}
	
	return;
}
fromMenu_ClanSetTeamTerroWithIdInstant(client, String:szTagId[]/*, sizeTagId*/)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_switch_clan_menu ) )
	{
		ReplyToCommand(client, "[SM] %t", "DisabledOption");
		return;
	}
	
	//Prevent people from outside to run the command
	if (client == 0)
	{
		ReplyToCommand(client, "[SM] %t", "Command is in-game only");
		return;
	}
	
	new matchedCount;
	new switchedCount;
	
	decl String:szTmpTagId[ 13 ];
	
	decl String:szTag[ 13 ];
	
	for ( new i = 1; i <= MaxClients; ++i )
	{
		if ( IsClientInGame( i ) &&
				GetClientTeam( i ) > 1 )
		{
			GetClientInfo( i, "cl_clanid", szTmpTagId, sizeof(szTmpTagId) );
			
			if ( StrEqual( szTagId, szTmpTagId ) )
			{
				if ( !matchedCount )
				{
					CS_GetClientClanTag( i, szTag, sizeof(szTag) );
				}
				
				if ( RequestTeamsManagement( any:REASON_ADMIN,
					TMC_PRIORITY,
					TeamsManagementType:TMT_INDIVIDUALS,
					2,
					i,
					FTMI_INSTANT ) )
				{
					++switchedCount;
				}
				
				++matchedCount;
			}
		}
	}
	
	if ( !matchedCount )
	{
		ReplyToCommand(client, "[SM] %t", "No matching clients");
	}
	else if ( !switchedCount )
	{
		ReplyToCommand(client, "[SM] %t", "F_ClanTeamChange 13");
	}
	else
	{
		if ( GetConVarInt( g_tmc_verbose_clan ) )
			ShowActivity2(client, "\x04[SM] \x03", "\x01%t", "ClanToTeam 15", "\x04", switchedCount, "\x01", "\x04", szTag, "\x01", "\x04", matchedCount, "\x01", g_szTeamNames[ 0 ]);
		else
			ReplyToCommand(client, "[SM] %t", "ClanToTeam 15", "", switchedCount, "", "", szTag, "", "", matchedCount, "", g_szTeamNames[ 0 ]);
		
		if (GetConVarInt(g_tmc_log))
			LogAction(client, -1, "\"%L\" made players with clan tag \"%s\" be %s for the next round", client, szTag, g_szTeamNames[ 0 ]);
		
	}
	
	return;
}
fromMenu_ClanSetTeamCTWithId(client, String:szTagId[]/*, sizeTagId*/)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_switch_clan_menu ) )
	{
		ReplyToCommand(client, "[SM] %t", "DisabledOption");
		return;
	}
	
	//Prevent people from outside to run the command
	if (client == 0)
	{
		ReplyToCommand(client, "[SM] %t", "Command is in-game only");
		return;
	}
	
	new matchedCount;
	new willBeSwitchedCount;
	
	decl String:szTmpTagId[ 13 ];
	
	decl String:szTag[ 13 ];
	
	for ( new i = 1; i <= MaxClients; ++i )
	{
		if ( IsClientInGame( i ) &&
				GetClientTeam( i ) > 1 )
		{
			GetClientInfo( i, "cl_clanid", szTmpTagId, sizeof(szTmpTagId) );
			
			if ( StrEqual( szTagId, szTmpTagId ) )
			{
				if ( !matchedCount )
				{
					CS_GetClientClanTag( i, szTag, sizeof(szTag) );
				}
				
				if ( RequestTeamsManagement( any:REASON_ADMIN,
					TMC_PRIORITY,
					TeamsManagementType:TMT_INDIVIDUALS,
					3,
					i,
					0 ) )
				{
					
					decl String:szTeamBufferPrefix[ 6 ];
					getTeamNameConditionalLowerCase( 2, szTeamBufferPrefix, 4 );
					szTeamBufferPrefix[ 3 ] = '\0';
					Format( szTeamBufferPrefix, sizeof(szTeamBufferPrefix), "[%s]", szTeamBufferPrefix );
					g_szPlayerTeamPrefix[ i ] = szTeamBufferPrefix;
					
					++willBeSwitchedCount;
				}
				
				++matchedCount;
			}
		}
	}
	
	if ( !matchedCount )
	{
		ReplyToCommand(client, "[SM] %t", "No matching clients");
	}
	else if ( !willBeSwitchedCount )
	{
		ReplyToCommand(client, "[SM] %t", "F_ClanTeamChange 13");
	}
	else
	{
		if ( GetConVarInt( g_tmc_verbose_clan ) )
			ShowActivity2(client, "\x04[SM] \x03", "\x01%t", "ClanWillBeToTeam 15", "\x04", willBeSwitchedCount, "\x01", "\x04", szTag, "\x01", "\x04", matchedCount, "\x01", g_szTeamNames[ 1 ]);
		else
			ReplyToCommand(client, "[SM] %t", "ClanWillBeToTeam 15", "", willBeSwitchedCount, "", "", szTag, "", "", matchedCount, "", g_szTeamNames[ 1 ]);
		
		if (GetConVarInt(g_tmc_log))
			LogAction(client, -1, "\"%L\" made players with clan tag \"%s\" be %s for the next round", client, szTag, g_szTeamNames[ 1 ]);
	}
	
	return;
}
fromMenu_ClanSetTeamCTWithIdInstant(client, String:szTagId[]/*, sizeTagId*/)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_switch_clan_menu ) )
	{
		ReplyToCommand(client, "[SM] %t", "DisabledOption");
		return;
	}
	
	//Prevent people from outside to run the command
	if (client == 0)
	{
		ReplyToCommand(client, "[SM] %t", "Command is in-game only");
		return;
	}
	
	new matchedCount;
	new switchedCount;
	
	decl String:szTmpTagId[ 13 ];
	
	decl String:szTag[ 13 ];
	
	for ( new i = 1; i <= MaxClients; ++i )
	{
		if ( IsClientInGame( i ) &&
				GetClientTeam( i ) > 1 )
		{
			GetClientInfo( i, "cl_clanid", szTmpTagId, sizeof(szTmpTagId) );
			
			if ( StrEqual( szTagId, szTmpTagId ) )
			{
				if ( !matchedCount )
				{
					CS_GetClientClanTag( i, szTag, sizeof(szTag) );
				}
				
				if ( RequestTeamsManagement( any:REASON_ADMIN,
					TMC_PRIORITY,
					TeamsManagementType:TMT_INDIVIDUALS,
					3,
					i,
					FTMI_INSTANT ) )
				{
					++switchedCount;
				}
				
				++matchedCount;
			}
		}
	}
	
	if ( !matchedCount )
	{
		ReplyToCommand(client, "[SM] %t", "No matching clients");
	}
	else if ( !switchedCount )
	{
		ReplyToCommand(client, "[SM] %t", "F_ClanTeamChange 13");
	}
	else
	{
		if ( GetConVarInt( g_tmc_verbose_clan ) )
			ShowActivity2(client, "\x04[SM] \x03", "\x01%t", "ClanToTeam 15", "\x04", switchedCount, "\x01", "\x04", szTag, "\x01", "\x04", matchedCount, "\x01", g_szTeamNames[ 1 ]);
		else
			ReplyToCommand(client, "[SM] %t", "ClanToTeam 15", "", switchedCount, "", "", szTag, "", "", matchedCount, "", g_szTeamNames[ 1 ]);
		
		if (GetConVarInt(g_tmc_log))
			LogAction(client, -1, "\"%L\" made players with clan tag \"%s\" be %s for the next round", client, szTag, g_szTeamNames[ 1 ]);
	}
	
	return;
}
//Since 1.4.0 (spec)
fromMenu_ClanSetTeamSpecWithId(client, String:szTagId[]/*, sizeTagId*/)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_switch_clan_menu ) || !GetConVarBool( g_tmc_allow_switch_spec ) )
	{
		ReplyToCommand(client, "[SM] %t", "DisabledOption");
		return;
	}
	
	//Prevent people from outside to run the command
	if (client == 0)
	{
		ReplyToCommand(client, "[SM] %t", "Command is in-game only");
		return;
	}
	
	new matchedCount;
	new willBeSwitchedCount;
	
	decl String:szTmpTagId[ 13 ];
	
	decl String:szTag[ 13 ];
	
	for ( new i = 1; i <= MaxClients; ++i )
	{
		if ( IsClientInGame( i ) &&
				GetClientTeam( i ) > 1 )
		{
			GetClientInfo( i, "cl_clanid", szTmpTagId, sizeof(szTmpTagId) );
			
			if ( StrEqual( szTagId, szTmpTagId ) )
			{
				if ( !matchedCount )
				{
					CS_GetClientClanTag( i, szTag, sizeof(szTag) );
				}
				
				if ( RequestTeamsManagement( any:REASON_ADMIN,
					TMC_PRIORITY,
					TeamsManagementType:TMT_INDIVIDUALS,
					1,
					i,
					FTMI_INSTANT ) )
				{
					//g_szPlayerTeamPrefix[ i ][ 0 ] = '\0';
					
					++willBeSwitchedCount;
				}
				
				++matchedCount;
			}
		}
	}
	
	if ( !matchedCount )
	{
		ReplyToCommand(client, "[SM] %t", "No matching clients");
	}
	else if ( !willBeSwitchedCount )
	{
		ReplyToCommand(client, "[SM] %t", "F_ClanTeamChange 13");
	}
	else
	{
		if ( GetConVarInt( g_tmc_verbose_clan ) )
			ShowActivity2(client, "\x04[SM] \x03", "\x01%t", "ClanTeamSpec 14", "\x04", willBeSwitchedCount, "\x01", "\x04", szTag, "\x01", "\x04", matchedCount, "\x01");
		else
			ReplyToCommand(client, "[SM] %t", "ClanTeamSpec 14", "", willBeSwitchedCount, "", "", szTag, "", "", matchedCount, "");
		
		if (GetConVarInt(g_tmc_log))
			LogAction(client, -1, "\"%L\" switched players with clan tag \"%s\" to Specs", client, szTag);
	}
	
	return;
}
fromMenu_ClanChangeTeamWithId(client, String:szTagId[]/*, sizeTagId*/)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_switch_clan_menu ) )
	{
		ReplyToCommand(client, "[SM] %t", "DisabledOption");
		return;
	}
	
	//Prevent people from outside to run the command
	if (client == 0)
	{
		ReplyToCommand(client, "[SM] %t", "Command is in-game only");
		return;
	}
	
	new matchedCount;
	new willBeSwitchedCount;
	
	decl String:szTmpTagId[ 13 ];
	
	decl String:szTag[ 13 ];
	
	for ( new i = 1; i <= MaxClients; ++i )
	{
		if ( IsClientInGame( i ) )
		{
			new iTeam = GetClientTeam( i );
			if ( iTeam > 1 )
			{
				GetClientInfo( i, "cl_clanid", szTmpTagId, sizeof(szTmpTagId) );
				
				if ( StrEqual( szTagId, szTmpTagId ) )
				{
					if ( !matchedCount )
					{
						CS_GetClientClanTag( i, szTag, sizeof(szTag) );
					}
					
					if ( RequestTeamsManagement( any:REASON_ADMIN,
						TMC_PRIORITY,
						TeamsManagementType:TMT_INDIVIDUALS,
						iTeam == 2 ? 3 : 2,
						i,
						0 ) )
					{
						
						decl String:szTeamBufferPrefix[ 6 ];
						getTeamNameConditionalLowerCase( iTeam == 2 ? 3 : 2, szTeamBufferPrefix, 4 );
						szTeamBufferPrefix[ 3 ] = '\0';
						Format( szTeamBufferPrefix, sizeof(szTeamBufferPrefix), "[%s]", szTeamBufferPrefix );
						g_szPlayerTeamPrefix[ i ] = szTeamBufferPrefix;
						
						++willBeSwitchedCount;
					}
					
					++matchedCount;
				}
			}
		}
	}
	
	if ( !matchedCount )
	{
		ReplyToCommand(client, "[SM] %t", "No matching clients");
	}
	else if ( !willBeSwitchedCount )
	{
		ReplyToCommand(client, "[SM] %t", "F_ClanTeamChange 13");
	}
	else
	{
		if ( GetConVarInt( g_tmc_verbose_clan ) )
			ShowActivity2(client, "\x04[SM] \x03", "\x01%t", "ClanWillTeamChange 13", "\x04", willBeSwitchedCount, "\x01", "\x04", szTag, "\x01", "\x04", matchedCount, "\x01");
		else
			ReplyToCommand(client, "[SM] %t", "ClanWillTeamChange 13", "", willBeSwitchedCount, "", "", szTag, "", "", matchedCount, "");
		
		if (GetConVarInt(g_tmc_log))
			LogAction(client, -1, "\"%L\" made players with clan tag \"%s\" change team for the next round", client, szTag);
	}
	
	return;
}
fromMenu_ClanChangeTeamWithIdInstant(client, String:szTagId[]/*, sizeTagId*/)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_switch_clan_menu ) )
	{
		ReplyToCommand(client, "[SM] %t", "DisabledOption");
		return;
	}
	
	//Prevent people from outside to run the command
	if (client == 0)
	{
		ReplyToCommand(client, "[SM] %t", "Command is in-game only");
		return;
	}
	
	new matchedCount;
	new switchedCount;
	
	decl String:szTmpTagId[ 13 ];
	
	decl String:szTag[ 13 ];
	
	for ( new i = 1; i <= MaxClients; ++i )
	{
		if ( IsClientInGame( i ) )
		{
			new iTeam = GetClientTeam( i );
			if ( iTeam > 1 )
			{
				GetClientInfo( i, "cl_clanid", szTmpTagId, sizeof(szTmpTagId) );
				
				if ( StrEqual( szTagId, szTmpTagId ) )
				{
					if ( !matchedCount )
					{
						CS_GetClientClanTag( i, szTag, sizeof(szTag) );
					}
					
					if ( RequestTeamsManagement( any:REASON_ADMIN,
						TMC_PRIORITY,
						TeamsManagementType:TMT_INDIVIDUALS,
						iTeam == 2 ? 3 : 2,
						i,
						0 ) )
					{
						++switchedCount;
					}
					
					++matchedCount;
				}
			}
		}
	}
	
	if ( !matchedCount )
	{
		ReplyToCommand(client, "[SM] %t", "No matching clients");
	}
	else if ( !switchedCount )
	{
		ReplyToCommand(client, "[SM] %t", "F_ClanTeamChange 13");
	}
	else
	{
		if ( GetConVarInt( g_tmc_verbose_clan ) )
			ShowActivity2(client, "\x04[SM] \x03", "\x01%t", "ClanTeamChange 15", "\x04", switchedCount, "\x01", "\x04", szTag, "\x01", "\x04", matchedCount, "\x01");
		else
			ReplyToCommand(client, "[SM] %t", "ClanTeamChange 15", "", switchedCount, "", "", szTag, "", "", matchedCount, "");
		
		if (GetConVarInt(g_tmc_log))
			LogAction(client, -1, "\"%L\" made players with clan tag \"%s\" change team for the next round", client, szTag);
	}
	
	return;
}
fromMenu_ClanCancelChangeTeamWithId(client, String:szTagId[]/*, sizeTagId*/)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_switch_clan_menu ) )
	{
		ReplyToCommand(client, "[SM] %t", "DisabledOption");
		return;
	}
	
	//Prevent people from outside to run the command
	if (client == 0)
	{
		ReplyToCommand(client, "[SM] %t", "Command is in-game only");
		return;
	}
	
	new matchedCount;
	new willBeSwitchedCount;
	
	decl String:szTmpTagId[ 13 ];
	
	decl String:szTag[ 13 ];
	
	for ( new i = 1; i <= MaxClients; ++i )
	{
		if ( IsClientInGame( i ) )
		{
			new iTeam = GetClientTeam( i );
			if ( iTeam > 1 )
			{
				GetClientInfo( i, "cl_clanid", szTmpTagId, sizeof(szTmpTagId) );
				
				if ( StrEqual( szTagId, szTmpTagId ) )
				{
					if ( !matchedCount )
					{
						CS_GetClientClanTag( i, szTag, sizeof(szTag) );
					}
					
					if ( RequestTeamsManagement( any:REASON_ADMIN,
						TMC_PRIORITY,
						TeamsManagementType:TMT_INDIVIDUALS,
						0,
						i,
						0 ) )
					{
						g_szPlayerTeamPrefix[ i ][ 0 ] = '\0';
						
						++willBeSwitchedCount;
					}
					
					++matchedCount;
				}
			}
		}
	}
	
	if ( !matchedCount )
	{
		ReplyToCommand(client, "[SM] %t", "No matching clients");
	}
	else if ( !willBeSwitchedCount )
	{
		ReplyToCommand(client, "[SM] %t", "F_ClanTeamChange 13");
	}
	else
	{
		if ( GetConVarInt( g_tmc_verbose_clan ) )
			ShowActivity2(client, "\x04[SM] \x03", "\x01%t", "ClanTeamChangeCancel 13", "\x04", willBeSwitchedCount, "\x01", "\x04", szTag, "\x01", "\x04", matchedCount, "\x01");
		else
			ReplyToCommand(client, "[SM] %t", "ClanTeamChangeCancel 13", "", willBeSwitchedCount, "", "", szTag, "", "", matchedCount, "");
		
		if (GetConVarInt(g_tmc_log))
			LogAction(client, -1, "\"%L\" made players with clan tag \"%s\" NOT change team for the next round", client, szTag);
	}
	
	return;
}













public AdminMenu_TMClanMenu(Handle:topmenu, 
					  TopMenuAction:action,
					  TopMenuObject:object_id,
					  param,
					  String:buffer[],
					  maxlength)
{
	if (action == TopMenuAction_DisplayOption)
	{
		FormatEx(buffer, maxlength, "%T", "AdminMenuCat TMClan 15", param);
	}
	else if (action == TopMenuAction_SelectOption)
	{
		menu_tmCatMenu(param, TM_CLAN);
	}
}
public MenuHandler_ClanCategory(Handle:menu, MenuAction:action, param1, param2)
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
		
		fromMenu_ExecuteClanInfo(param1, info/*, sizeof(info)*/);
	}
}
addTeamsOptionsToClanMenu(Handle:menu, any:client)
{
	if ( !GetConVarBool( g_tmc_allow_switch_clan_menu ) )
		return;
	
	decl String:info[8]; //hold function to call
	decl String:display[64];
	
	strcopy(info, sizeof(info), "000");
	FormatEx(display, sizeof(display), "%T", "AdminMenu ClanToTeam 15", client, g_szTeamNames[ 0 ]);
	AddMenuItem(menu, info, display);
	
	strcopy(info, sizeof(info), "001");
	FormatEx(display, sizeof(display), "%T", "AdminMenu ClanToTeamInstant 15", client, g_szTeamNames[ 0 ]);
	AddMenuItem(menu, info, display);
	
	strcopy(info, sizeof(info), "002");
	FormatEx(display, sizeof(display), "%T", "AdminMenu ClanToTeam 15", client, g_szTeamNames[ 1 ]);
	AddMenuItem(menu, info, display);
	
	strcopy(info, sizeof(info), "003");
	FormatEx(display, sizeof(display), "%T", "AdminMenu ClanToTeamInstant 15", client, g_szTeamNames[ 1 ]);
	AddMenuItem(menu, info, display);
	
	strcopy(info, sizeof(info), "004");
	FormatEx(display, sizeof(display), "%T", "AdminMenu ClanChangeTeam 13", client);
	AddMenuItem(menu, info, display);
	
	strcopy(info, sizeof(info), "005");
	FormatEx(display, sizeof(display), "%T", "AdminMenu ClanChangeTeamInstant 15", client);
	AddMenuItem(menu, info, display);
	
	strcopy(info, sizeof(info), "006");
	FormatEx(display, sizeof(display), "%T", "AdminMenu ClanTeamSpec 14", client);
	AddMenuItem(menu, info, display);
	
	strcopy(info, sizeof(info), "007");
	FormatEx(display, sizeof(display), "%T", "AdminMenu ClanCancelChangeTeam 13", client);
	AddMenuItem(menu, info, display);
}
//With info, either call a menu, or call a function
fromMenu_ExecuteClanInfo(client, String:info[]/*, sizeTagId*/)
{
	new commandId = StringToInt( info );
	switch ( commandId )
	{
		case 0:
			menu_ClanSetTeamTerro(client);
		case 1:
			menu_ClanSetTeamTerroInstant(client);
		case 2:
			menu_ClanSetTeamCT(client);
		case 3:
			menu_ClanSetTeamCTInstant(client);
		case 4:
			menu_ClanChangeTeam(client);
		case 5:
			menu_ClanChangeTeamInstant(client);
		case 6:
			menu_ClanSetTeamSpec(client);
		case 7:
			menu_ClanCancelChangeTeam(client);
	}
}