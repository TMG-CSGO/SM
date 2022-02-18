public Action:Command_ScrambleFair(client, args)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_scramble_fair ) )
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
		
	if ( RequestTeamsManagement( any:REASON_ADMIN,
		TMC_PRIORITY,
		TeamsManagementType:TMT_TEAMS,
		1,
		0,
		( GetConVarInt( g_tmc_fadeColor ) == 1 ? FTMI_FADE : 0 ) | ( GetConVarInt( g_tmc_sound ) == 1 ? FTMI_SOUND : 0 ) ) )
	{
		if (GetConVarInt(g_tmc_verbose_global))
			ShowActivity2(client, "\x04[SM] \x03", "\x01%t", "ScrambleFair");
		else
			ReplyToCommand(client, "[SM] %t", "ScrambleFair");
		
		if (GetConVarInt(g_tmc_log))
			LogAction(client, -1, "\"%L\" triggered a fair Teams Scramble", client);
	}
	else
	{
		ReplyToCommand(client, "[SM] %t", "F_Scramble");
	}
	
	return Plugin_Handled;
}

public Action:Command_ScrambleUnfair(client, args)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_scramble_unfair ) )
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
	
	if ( RequestTeamsManagement( any:REASON_ADMIN,
		TMC_PRIORITY,
		TeamsManagementType:TMT_TEAMS,
		2,
		0,
		( GetConVarInt( g_tmc_fadeColor ) == 1 ? FTMI_FADE : 0 ) | ( GetConVarInt( g_tmc_sound ) == 1 ? FTMI_SOUND : 0 ) ) )
	{
		if (GetConVarInt(g_tmc_verbose_global))
			ShowActivity2(client, "\x04[SM] \x03", "\x01%t", "ScrambleUnfair");
		else
			ReplyToCommand(client, "[SM] %t", "ScrambleUnfair");
		
		if (GetConVarInt(g_tmc_log))
			LogAction(client, -1, "\"%L\" triggered an unfair Teams Scramble", client);
	}
	else
	{
		ReplyToCommand(client, "[SM] %t", "F_Scramble");
	}
	
	return Plugin_Handled;
}

public Action:Command_ScrambleSpecificTeam(client, args)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_scramble_specific ) )
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
	
	if ( RequestTeamsManagement( any:REASON_ADMIN,
		TMC_PRIORITY,
		TeamsManagementType:TMT_TEAMS,
		3,
		GetConVarInt( g_tmc_required_value ) | ( GetConVarInt( g_tmc_required_team ) << 8 ),
		( GetConVarInt( g_tmc_fadeColor ) == 1 ? FTMI_FADE : 0 ) | ( GetConVarInt( g_tmc_sound ) == 1 ? FTMI_SOUND : 0 ) ) )
	{
		if (GetConVarInt(g_tmc_verbose_global))
			ShowActivity2(client, "\x04[SM] \x03", "\x01%t", "ScrambleSpecificTeam", 
				"\x04", 
				g_szTeamNames[ GetConVarInt( g_tmc_required_team ) ], 
				"\x01", 
				"\x04", 
				GetConVarInt( g_tmc_required_value ), 
				"\x01");
		else
			ReplyToCommand(client, "[SM] %t", "ScrambleSpecificTeam", 
				"", 
				g_szTeamNames[ GetConVarInt( g_tmc_required_team ) ], 
				"", 
				"", 
				GetConVarInt( g_tmc_required_value ), 
				"");
		
		if (GetConVarInt(g_tmc_log))
			LogAction(client, -1, "\"%L\" triggered Teams Scramble (specific teams)", client);
	}
	else
	{
		ReplyToCommand(client, "[SM] %t", "F_Scramble");
	}
	
	return Plugin_Handled;
}

public Action:Command_TeamPrevent(client, args)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_team_prevent ) )
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
	
	if ( RequestTeamsManagement( any:REASON_ADMIN,
		TMC_PRIORITY,
		TeamsManagementType:TMT_TEAMS,
		0,
		0,
		0 ) )
	{
		if (GetConVarInt(g_tmc_verbose_global))
			ShowActivity2(client, "\x04[SM] \x03", "\x01%t", "TeamPrevent");
		else
			ReplyToCommand(client, "[SM] %t", "TeamPrevent");
		
		if (GetConVarInt(g_tmc_log))
			LogAction(client, -1, "\"%L\" did prevent Teams Management", client);
	}
	else
	{
		ReplyToCommand(client, "[SM] %t", "F_TeamPrevent");
	}
	
	return Plugin_Handled;
}

public Action:Command_TeamCancel(client, args)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_team_cancel ) )
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
	
	if ( CancelTeamsManagement( TeamsManagementType:TMT_TEAMS,
		TMC_PRIORITY ) )
	{
		if (GetConVarInt(g_tmc_verbose_global))
			ShowActivity2(client, "\x04[SM] \x03", "\x01%t", "TeamCancel");
		else
			ReplyToCommand(client, "[SM] %t", "TeamCancel");
		
		if (GetConVarInt(g_tmc_log))
			LogAction(client, -1, "\"%L\" did cancel at least one Teams Management", client);
	}
	else
	{
		ReplyToCommand(client, "[SM] %t", "F_TeamCancel");
	}
	
	return Plugin_Handled;
}

// 1.5
public Action:Command_ScrambleFairInstant(client, args)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_scramble_fair_instant ) )
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
		
	if ( RequestTeamsManagement( any:REASON_ADMIN,
		TMC_PRIORITY,
		TeamsManagementType:TMT_TEAMS,
		1,
		0,
		FTMI_INSTANT | ( GetConVarInt( g_tmc_fadeColor ) == 1 ? FTMI_FADE : 0 ) | ( GetConVarInt( g_tmc_sound ) == 1 ? FTMI_SOUND : 0 ) ) )
	{
		if (GetConVarInt(g_tmc_verbose_global))
			ShowActivity2(client, "\x04[SM] \x03", "\x01%t", "ScrambleFairInstant");
		else
			ReplyToCommand(client, "[SM] %t", "ScrambleFairInstant");
		
		if (GetConVarInt(g_tmc_log))
			LogAction(client, -1, "\"%L\" triggered a fair Teams Scramble (instant)", client);
	}
	else
	{
		ReplyToCommand(client, "[SM] %t", "F_Scramble");
	}
	
	return Plugin_Handled;
}

public Action:Command_ScrambleUnfairInstant(client, args)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_scramble_unfair_instant ) )
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
	
	if ( RequestTeamsManagement( any:REASON_ADMIN,
		TMC_PRIORITY,
		TeamsManagementType:TMT_TEAMS,
		2,
		0,
		FTMI_INSTANT | ( GetConVarInt( g_tmc_fadeColor ) == 1 ? FTMI_FADE : 0 ) | ( GetConVarInt( g_tmc_sound ) == 1 ? FTMI_SOUND : 0 ) ) )
	{
		if (GetConVarInt(g_tmc_verbose_global))
			ShowActivity2(client, "\x04[SM] \x03", "\x01%t", "ScrambleUnfairInstant");
		else
			ReplyToCommand(client, "[SM] %t", "ScrambleUnfairInstant");
		
		if (GetConVarInt(g_tmc_log))
			LogAction(client, -1, "\"%L\" triggered an unfair Teams Scramble (instant)", client);
	}
	else
	{
		ReplyToCommand(client, "[SM] %t", "F_Scramble");
	}
	
	return Plugin_Handled;
}

public Action:Command_ScrambleSpecificTeamInstant(client, args)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_scramble_specific_instant ) )
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
	
	if ( RequestTeamsManagement( any:REASON_ADMIN,
		TMC_PRIORITY,
		TeamsManagementType:TMT_TEAMS,
		3,
		GetConVarInt( g_tmc_required_value ) | ( GetConVarInt( g_tmc_required_team ) << 8 ),
		FTMI_INSTANT | ( GetConVarInt( g_tmc_fadeColor ) == 1 ? FTMI_FADE : 0 ) | ( GetConVarInt( g_tmc_sound ) == 1 ? FTMI_SOUND : 0 ) ) )
	{
		if (GetConVarInt(g_tmc_verbose_global))
			ShowActivity2(client, "\x04[SM] \x03", "\x01%t", "ScrambleSpecificTeamInstant", 
				"\x04", 
				g_szTeamNames[ GetConVarInt( g_tmc_required_team ) ], 
				"\x01", 
				"\x04", 
				GetConVarInt( g_tmc_required_value ), 
				"\x01");
		else
			ReplyToCommand(client, "[SM] %t", "ScrambleSpecificTeamInstant", 
				"", 
				g_szTeamNames[ GetConVarInt( g_tmc_required_team ) ], 
				"", 
				"", 
				GetConVarInt( g_tmc_required_value ), 
				"");
		
		if (GetConVarInt(g_tmc_log))
			LogAction(client, -1, "\"%L\" triggered Teams Scramble (specific teams; instant)", client);
	}
	else
	{
		ReplyToCommand(client, "[SM] %t", "F_Scramble");
	}
	
	return Plugin_Handled;
}

//1.6
public Action:Command_SwapTeams(client, args)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_teamswaps ) )
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
		
	if ( RequestTeamsManagement( any:REASON_ADMIN,
		TMC_PRIORITY,
		TeamsManagementType:TMT_TEAMS,
		4,
		0,
		( GetConVarInt( g_tmc_fadeColor ) == 1 ? FTMI_FADE : 0 ) | ( GetConVarInt( g_tmc_sound ) == 1 ? FTMI_SOUND : 0 ) ) )
	{
		if (GetConVarInt(g_tmc_verbose_global))
			ShowActivity2(client, "\x04[SM] \x03", "\x01%t", "SwapTeams");
		else
			ReplyToCommand(client, "[SM] %t", "SwapTeams");
		
		if (GetConVarInt(g_tmc_log))
			LogAction(client, -1, "\"%L\" triggered a Teams Swap", client);
	}
	else
	{
		ReplyToCommand(client, "[SM] %t", "F_Scramble");
	}
	
	return Plugin_Handled;
}
public Action:Command_SwapTeamsInstant(client, args)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_teamswaps_instant ) )
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
		
	if ( RequestTeamsManagement( any:REASON_ADMIN,
		TMC_PRIORITY,
		TeamsManagementType:TMT_TEAMS,
		4,
		0,
		FTMI_INSTANT | ( GetConVarInt( g_tmc_fadeColor ) == 1 ? FTMI_FADE : 0 ) | ( GetConVarInt( g_tmc_sound ) == 1 ? FTMI_SOUND : 0 ) ) )
	{
		if (GetConVarInt(g_tmc_verbose_global))
			ShowActivity2(client, "\x04[SM] \x03", "\x01%t", "SwapTeamsInstant");
		else
			ReplyToCommand(client, "[SM] %t", "SwapTeamsInstant");
		
		if (GetConVarInt(g_tmc_log))
			LogAction(client, -1, "\"%L\" triggered a Teams Swap (instant)", client);
	}
	else
	{
		ReplyToCommand(client, "[SM] %t", "F_Scramble");
	}
	
	return Plugin_Handled;
}