//Clan related ; since 1.3
//clan tag method : will fail if there are quotes in the clan tag (if using commands; menu is safe)
public Action:Command_ClanSetTeamTerro(client, args)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_switch_clan ) )
	{
		ReplyToCommand(client, "[SM] %t", "DisabledOption");
		return Plugin_Handled;
	}
	
	//Prevent people from outside to run the command
	if (client == 0)
	{
		ReplyToCommand(client, "[SM] %t", "Command is in-game only");
		return Plugin_Handled;
	}
	
	new matchedCount;
	new willBeSwitchedCount;
	decl String:szTag[ 13 ];
	GetCmdArg(1, szTag, sizeof(szTag));
	
	decl String:szTmpTag[ 13 ];
	
	for ( new i = 1; i <= MaxClients; ++i )
	{
		if ( IsClientInGame( i ) &&
				GetClientTeam( i ) > 1 )
		{
			CS_GetClientClanTag( i, szTmpTag, sizeof(szTmpTag) );
			
			if ( StrEqual( szTag, szTmpTag ) )
			{
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
	
	return Plugin_Handled;
}
public Action:Command_ClanSetTeamTerroInstant(client, args)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_switch_clan ) )
	{
		ReplyToCommand(client, "[SM] %t", "DisabledOption");
		return Plugin_Handled;
	}
	
	//Prevent people from outside to run the command
	if (client == 0)
	{
		ReplyToCommand(client, "[SM] %t", "Command is in-game only");
		return Plugin_Handled;
	}
	
	new matchedCount;
	new switchedCount;
	decl String:szTag[ 13 ];
	GetCmdArg(1, szTag, sizeof(szTag));
	
	decl String:szTmpTag[ 13 ];
	
	for ( new i = 1; i <= MaxClients; ++i )
	{
		if ( IsClientInGame( i ) &&
				GetClientTeam( i ) > 1 )
		{
			CS_GetClientClanTag( i, szTmpTag, sizeof(szTmpTag) );
			
			if ( StrEqual( szTag, szTmpTag ) )
			{
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
			LogAction(client, -1, "\"%L\" made players with clan tag \"%s\" be %s", client, szTag, g_szTeamNames[ 0 ]);
	}
	
	return Plugin_Handled;
}
public Action:Command_ClanSetTeamCT(client, args)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_switch_clan ) )
	{
		ReplyToCommand(client, "[SM] %t", "DisabledOption");
		return Plugin_Handled;
	}
	
	//Prevent people from outside to run the command
	if (client == 0)
	{
		ReplyToCommand(client, "[SM] %t", "Command is in-game only");
		return Plugin_Handled;
	}
	
	new matchedCount;
	new willBeSwitchedCount;
	decl String:szTag[ 13 ];
	GetCmdArg(1, szTag, sizeof(szTag));
	
	decl String:szTmpTag[ 13 ];
	
	for ( new i = 1; i <= MaxClients; ++i )
	{
		if ( IsClientInGame( i ) &&
				GetClientTeam( i ) > 1 )
		{
			CS_GetClientClanTag( i, szTmpTag, sizeof(szTmpTag) );
			
			if ( StrEqual( szTag, szTmpTag ) )
			{
				if ( RequestTeamsManagement( any:REASON_ADMIN,
					TMC_PRIORITY,
					TeamsManagementType:TMT_INDIVIDUALS,
					3,
					i,
					0 ) )
				{
					
					decl String:szTeamBufferPrefix[ 6 ];
					getTeamNameConditionalLowerCase( 3, szTeamBufferPrefix, 4 );
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
	
	return Plugin_Handled;
}
public Action:Command_ClanSetTeamCTInstant(client, args)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_switch_clan ) )
	{
		ReplyToCommand(client, "[SM] %t", "DisabledOption");
		return Plugin_Handled;
	}
	
	//Prevent people from outside to run the command
	if (client == 0)
	{
		ReplyToCommand(client, "[SM] %t", "Command is in-game only");
		return Plugin_Handled;
	}
	
	new matchedCount;
	new switchedCount;
	decl String:szTag[ 13 ];
	GetCmdArg(1, szTag, sizeof(szTag));
	
	decl String:szTmpTag[ 13 ];
	
	for ( new i = 1; i <= MaxClients; ++i )
	{
		if ( IsClientInGame( i ) &&
				GetClientTeam( i ) > 1 )
		{
			CS_GetClientClanTag( i, szTmpTag, sizeof(szTmpTag) );
			
			if ( StrEqual( szTag, szTmpTag ) )
			{
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
			LogAction(client, -1, "\"%L\" made players with clan tag \"%s\" be %s", client, szTag, g_szTeamNames[ 1 ]);
	}
	
	return Plugin_Handled;
}
public Action:Command_ClanSetTeamSpec(client, args)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_switch_clan ) || !GetConVarBool( g_tmc_allow_switch_spec ) )
	{
		ReplyToCommand(client, "[SM] %t", "DisabledOption");
		return Plugin_Handled;
	}
	
	//Prevent people from outside to run the command
	if (client == 0)
	{
		ReplyToCommand(client, "[SM] %t", "Command is in-game only");
		return Plugin_Handled;
	}
	
	new matchedCount;
	new willBeSwitchedCount;
	decl String:szTag[ 13 ];
	GetCmdArg(1, szTag, sizeof(szTag));
	
	decl String:szTmpTag[ 13 ];
	
	for ( new i = 1; i <= MaxClients; ++i )
	{
		if ( IsClientInGame( i ) &&
				GetClientTeam( i ) > 1 )
		{
			CS_GetClientClanTag( i, szTmpTag, sizeof(szTmpTag) );
			
			if ( StrEqual( szTag, szTmpTag ) )
			{
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
	
	return Plugin_Handled;
}
public Action:Command_ClanChangeTeam(client, args)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_switch_clan ) )
	{
		ReplyToCommand(client, "[SM] %t", "DisabledOption");
		return Plugin_Handled;
	}
	
	//Prevent people from outside to run the command
	if (client == 0)
	{
		ReplyToCommand(client, "[SM] %t", "Command is in-game only");
		return Plugin_Handled;
	}
	
	new matchedCount;
	new willBeSwitchedCount;
	decl String:szTag[ 13 ];
	GetCmdArg(1, szTag, sizeof(szTag));
	
	decl String:szTmpTag[ 13 ];
	
	for ( new i = 1; i <= MaxClients; ++i )
	{
		if ( IsClientInGame( i ) )
		{
			new iTeam = GetClientTeam( i );
			if ( iTeam > 1 )
			{
				CS_GetClientClanTag( i, szTmpTag, sizeof(szTmpTag) );
				
				if ( StrEqual( szTag, szTmpTag ) )
				{
					if ( RequestTeamsManagement( any:REASON_ADMIN,
						TMC_PRIORITY,
						TeamsManagementType:TMT_INDIVIDUALS,
						iTeam == 2 ? 3 : 2, //doesn't use 4, because we want current other team, not at swap
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
	
	return Plugin_Handled;
}
public Action:Command_ClanChangeTeamInstant(client, args)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_switch_clan ) )
	{
		ReplyToCommand(client, "[SM] %t", "DisabledOption");
		return Plugin_Handled;
	}
	
	//Prevent people from outside to run the command
	if (client == 0)
	{
		ReplyToCommand(client, "[SM] %t", "Command is in-game only");
		return Plugin_Handled;
	}
	
	new matchedCount;
	new switchedCount;
	decl String:szTag[ 13 ];
	GetCmdArg(1, szTag, sizeof(szTag));
	
	decl String:szTmpTag[ 13 ];
	
	for ( new i = 1; i <= MaxClients; ++i )
	{
		if ( IsClientInGame( i ) )
		{
			new iTeam = GetClientTeam( i );
			if ( iTeam > 1 )
			{
				CS_GetClientClanTag( i, szTmpTag, sizeof(szTmpTag) );
				
				if ( StrEqual( szTag, szTmpTag ) )
				{
					if ( RequestTeamsManagement( any:REASON_ADMIN,
						TMC_PRIORITY,
						TeamsManagementType:TMT_INDIVIDUALS,
						4,
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
	
	return Plugin_Handled;
}
public Action:Command_ClanCancelChangeTeam(client, args)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_switch_clan ) )
	{
		ReplyToCommand(client, "[SM] %t", "DisabledOption");
		return Plugin_Handled;
	}
	
	//Prevent people from outside to run the command
	if (client == 0)
	{
		ReplyToCommand(client, "[SM] %t", "Command is in-game only");
		return Plugin_Handled;
	}
	
	new matchedCount;
	new willBeSwitchedCount;
	decl String:szTag[ 13 ];
	GetCmdArg(1, szTag, sizeof(szTag));
	
	decl String:szTmpTag[ 13 ];
	
	for ( new i = 1; i <= MaxClients; ++i )
	{
		if ( IsClientInGame( i ) &&
				GetClientTeam( i ) > 1 )
		{
			CS_GetClientClanTag( i, szTmpTag, sizeof(szTmpTag) );
			
			if ( StrEqual( szTag, szTmpTag ) )
			{
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
	
	if ( !matchedCount )
	{
		ReplyToCommand(client, "[SM] %t", "No matching clients");
	}
	else if ( !willBeSwitchedCount )
	{
		ReplyToCommand(client, "[SM] %t", "F_ClanTeamChangeCancel 13");
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
	
	return Plugin_Handled;
}