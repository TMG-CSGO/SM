public Action:Command_SetTeamTerro(client, args)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_switch_indiv ) )
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
	
	decl String:targetArg[ MAX_NAME_LENGTH ];
	//new targetId;
	decl String:target_name[ MAX_TARGET_LENGTH ];
	decl target_list[ MAXPLAYERS ], bool:tn_is_ml;
	new target_count;
	
	if (args < 1) //If no arg; check target aimed at
	{
		//targetId = GetClientAimTarget(client);
		target_count = 1;
		target_list[ 0 ] = GetClientAimTarget(client);
		if ( !GetClientName( client, target_name, sizeof(target_name) ) )
		{
			//LAWL
			return Plugin_Handled;
		}
	}
	else if (args < 2)
	{
		GetCmdArg(1, targetArg, sizeof(targetArg));
		//targetId = FindTarget(client, targetArg);
		
		if ((target_count = ProcessTargetString(
				targetArg,
				client, 
				target_list, 
				sizeof(target_list), 
				0,
				target_name,
				sizeof(target_name),
				tn_is_ml)) <= 0)
		{
			ReplyToTargetError( client, target_count );
			return Plugin_Handled;
		}
	}
	
	//if (targetId < 1)
	if (target_count <= 0)
	{
		ReplyToCommand(client, "\x04[SM] \x01Usage: <sm_teamt|say !teamt> <#userid|name|[aimedTarget]>");
		return Plugin_Handled;
	}
	else //if (GetClientTeam(targetId) > 1) //T or CT to T
	{
		decl String:szTeamBufferPrefix[ 6 ];
		getTeamNameConditionalLowerCase( 2, szTeamBufferPrefix, 4 );
		szTeamBufferPrefix[ 3 ] = '\0';
		Format( szTeamBufferPrefix, sizeof(szTeamBufferPrefix), "[%s]", szTeamBufferPrefix );
		
		new bool:didSomething = false;
		new failCount;
		
		for (new i = 0; i < target_count; i++)
		{
			if ( GetClientTeam( target_list[ i ] ) > 1 )
			{
				if ( RequestTeamsManagement( any:REASON_ADMIN,
					TMC_PRIORITY,
					TeamsManagementType:TMT_INDIVIDUALS,
					2,
					//targetId,
					target_list[ i ],
					0 ) )
				{
					g_szPlayerTeamPrefix[ target_list[ i ] ] = szTeamBufferPrefix;
					didSomething = true;
				}
				else
				{
					++failCount;
				}
			}
		}
		
		if (didSomething)
		{
			if (GetConVarInt(g_tmc_verbose_indiv))
				ShowActivity2(client, "\x04[SM] \x03", "\x01%t", "WillBeToTeam 15", "\x04", target_name, "\x01", g_szTeamNames[ 0 ]);
			else
				ReplyToCommand(client, "[SM] %t", "WillBeToTeam 15", "", target_name, "", g_szTeamNames[ 0 ]);
			
			if (GetConVarInt(g_tmc_log))
			{
				if ( target_count != 1 )
					LogAction(client, -1, "\"%L\" made \"%s\" be %s for the next round", client, target_name, g_szTeamNames[ 0 ]);
				else // == 1
					LogAction(client, target_list[ 0 ], "\"%L\" made \"%L\" be %s for the next round", client, target_list[ 0 ], g_szTeamNames[ 0 ]);
			}
		}
		if ( failCount > 0 )
		{
			ReplyToCommand(client, "[SM] %t", "F_TeamChange 11", "\x04", failCount, "\x01");
		}
	}
	
	return Plugin_Handled;
}
public Action:Command_SetTeamTerroInstant(client, args)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_switch_indiv_instant ) )
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
	
	decl String:targetArg[ MAX_NAME_LENGTH ];
	//new targetId;
	decl String:target_name[ MAX_TARGET_LENGTH ];
	decl target_list[ MAXPLAYERS ], bool:tn_is_ml;
	new target_count;
	
	if (args < 1) //If no arg; check target aimed at
	{
		//targetId = GetClientAimTarget(client);
		target_count = 1;
		target_list[ 0 ] = GetClientAimTarget(client);
		if ( !GetClientName( client, target_name, sizeof(target_name) ) )
		{
			//LAWL
			return Plugin_Handled;
		}
	}
	else if (args < 2)
	{
		GetCmdArg(1, targetArg, sizeof(targetArg));
		//targetId = FindTarget(client, targetArg);
		
		if ((target_count = ProcessTargetString(
				targetArg,
				client, 
				target_list, 
				sizeof(target_list), 
				0,
				target_name,
				sizeof(target_name),
				tn_is_ml)) <= 0)
		{
			ReplyToTargetError( client, target_count );
			return Plugin_Handled;
		}
	}
	
	//if (targetId < 1)
	if (target_count <= 0)
	{
		ReplyToCommand(client, "\x04[SM] \x01Usage: <sm_instantteamt|say !instantteamt> <#userid|name|[aimedTarget]>");
		return Plugin_Handled;
	}
	else //if (GetClientTeam(targetId) > 1) //T or CT to T
	{
		new bool:didSomething = false;
		new failCount;
		
		for (new i = 0; i < target_count; i++)
		{
			if ( GetClientTeam( target_list[ i ] ) > 1 )
			{
				if ( RequestTeamsManagement( any:REASON_ADMIN,
					TMC_PRIORITY,
					TeamsManagementType:TMT_INDIVIDUALS,
					2,
					//targetId,
					target_list[ i ],
					FTMI_INSTANT ) )
				{
					didSomething = true;
					//g_szPlayerTeamPrefix[ targetId ][ 0 ] = '\0';
				}
				else
				{
					++failCount;
				}
			}
		}
		
		if (didSomething)
		{
			if (GetConVarInt(g_tmc_verbose_indiv))
				ShowActivity2(client, "\x04[SM] \x03", "\x01%t", "IsNowTeam 15", "\x04", target_name, "\x01", g_szTeamNames[ 0 ]);
			else
				ReplyToCommand(client, "[SM] %t", "IsNowTeam 15", "", target_name, "", g_szTeamNames[ 0 ]);
				
			if (GetConVarInt(g_tmc_log))
			{
				if ( target_count != 1 )
					LogAction(client, -1, "\"%L\" switched \"%s\" be %s (instant)", client, target_name, g_szTeamNames[ 0 ]);
				else // == 1
					LogAction(client, target_list[ 0 ], "\"%L\" switched \"%L\" be %s (instant)", client, target_list[ 0 ], g_szTeamNames[ 0 ]);
			}
		}
		if ( failCount > 0 )
		{
			ReplyToCommand(client, "[SM] %t", "F_TeamChange 11", "\x04", failCount, "\x01");
		}
	}
	
	return Plugin_Handled;
}

public Action:Command_SetTeamCT(client, args)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_switch_indiv ) )
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
	
	decl String:targetArg[ MAX_NAME_LENGTH ];
	//new targetId;
	decl String:target_name[ MAX_TARGET_LENGTH ];
	decl target_list[ MAXPLAYERS ], bool:tn_is_ml;
	new target_count;
	
	if (args < 1) //If no arg; check target aimed at
	{
		//targetId = GetClientAimTarget(client);
		target_count = 1;
		target_list[ 0 ] = GetClientAimTarget(client);
		if ( !GetClientName( client, target_name, sizeof(target_name) ) )
		{
			//LAWL
			return Plugin_Handled;
		}
	}
	else if (args < 2)
	{
		GetCmdArg(1, targetArg, sizeof(targetArg));
		//targetId = FindTarget(client, targetArg);
		
		if ((target_count = ProcessTargetString(
				targetArg,
				client, 
				target_list, 
				sizeof(target_list), 
				0,
				target_name,
				sizeof(target_name),
				tn_is_ml)) <= 0)
		{
			ReplyToTargetError( client, target_count );
			return Plugin_Handled;
		}
	}
	
	//if (targetId < 1)
	if (target_count <= 0)
	{
		ReplyToCommand(client, "\x04[SM] \x01Usage: <sm_teamct|say !teamct> <#userid|name|[aimedTarget]>");
		return Plugin_Handled;
	}
	else //if (GetClientTeam(targetId) > 1) //T or CT to CT
	{
		decl String:szTeamBufferPrefix[ 6 ];
		getTeamNameConditionalLowerCase( 3, szTeamBufferPrefix, 4 );
		szTeamBufferPrefix[ 3 ] = '\0';
		Format( szTeamBufferPrefix, sizeof(szTeamBufferPrefix), "[%s]", szTeamBufferPrefix );
		
		new bool:didSomething = false;
		new failCount;
		
		for (new i = 0; i < target_count; i++)
		{
			if ( GetClientTeam( target_list[ i ] ) > 1 )
			{
				if ( RequestTeamsManagement( any:REASON_ADMIN,
					TMC_PRIORITY,
					TeamsManagementType:TMT_INDIVIDUALS,
					3,
					//targetId,
					target_list[ i ],
					0 ) )
				{
					g_szPlayerTeamPrefix[ target_list[ i ] ] = szTeamBufferPrefix;
					didSomething = true;
				}
				else
				{
					++failCount;
				}
			}
		}
		if (didSomething)
		{
			if (GetConVarInt(g_tmc_verbose_indiv))
				ShowActivity2(client, "\x04[SM] \x03", "\x01%t", "WillBeToTeam 15", "\x04", target_name, "\x01", g_szTeamNames[ 1 ]);
			else
				ReplyToCommand(client, "[SM] %t", "WillBeToTeam 15", "", target_name, "", g_szTeamNames[ 1 ]);
			
			if (GetConVarInt(g_tmc_log))
			{
				if ( target_count != 1 )
					LogAction(client, -1, "\"%L\" made \"%s\" be %s for the next round", client, target_name, g_szTeamNames[ 1 ]);
				else // == 1
					LogAction(client, target_list[ 0 ], "\"%L\" made \"%L\" be %s for the next round", client, target_list[ 0 ], g_szTeamNames[ 1 ]);
			}
		}
		if ( failCount > 0 )
		{
			ReplyToCommand(client, "[SM] %t", "F_TeamChange 11", "\x04", failCount, "\x01");
		}
	}
	
	return Plugin_Handled;
}
public Action:Command_SetTeamCTInstant(client, args)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_switch_indiv_instant ) )
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
	
	decl String:targetArg[ MAX_NAME_LENGTH ];
	//new targetId;
	decl String:target_name[ MAX_TARGET_LENGTH ];
	decl target_list[ MAXPLAYERS ], bool:tn_is_ml;
	new target_count;
	
	if (args < 1) //If no arg; check target aimed at
	{
		//targetId = GetClientAimTarget(client);
		target_count = 1;
		target_list[ 0 ] = GetClientAimTarget(client);
		if ( !GetClientName( client, target_name, sizeof(target_name) ) )
		{
			//LAWL
			return Plugin_Handled;
		}
	}
	else if (args < 2)
	{
		GetCmdArg(1, targetArg, sizeof(targetArg));
		//targetId = FindTarget(client, targetArg);
		
		if ((target_count = ProcessTargetString(
				targetArg,
				client, 
				target_list, 
				sizeof(target_list), 
				0,
				target_name,
				sizeof(target_name),
				tn_is_ml)) <= 0)
		{
			ReplyToTargetError( client, target_count );
			return Plugin_Handled;
		}
	}
	
	//if (targetId < 1)
	if (target_count <= 0)
	{
		ReplyToCommand(client, "\x04[SM] \x01Usage: <sm_instantteamct|say !instantteamct> <#userid|name|[aimedTarget]>");
		return Plugin_Handled;
	}
	else //if (GetClientTeam(targetId) > 1) //T or CT to T
	{
		new bool:didSomething = false;
		new failCount;
		
		for (new i = 0; i < target_count; i++)
		{
			if ( GetClientTeam( target_list[ i ] ) > 1 )
			{
				if ( RequestTeamsManagement( any:REASON_ADMIN,
					TMC_PRIORITY,
					TeamsManagementType:TMT_INDIVIDUALS,
					3,
					//targetId,
					target_list[ i ],
					FTMI_INSTANT ) )
				{
					didSomething = true;
					//g_szPlayerTeamPrefix[ targetId ][ 0 ] = '\0';
				}
				else
				{
					++failCount;
				}
			}
		}
		
		if (didSomething)
		{
			if (GetConVarInt(g_tmc_verbose_indiv))
				ShowActivity2(client, "\x04[SM] \x03", "\x01%t", "IsNowTeam 15", "\x04", target_name, "\x01", g_szTeamNames[ 1 ]);
			else
				ReplyToCommand(client, "[SM] %t", "IsNowTeam 15", "", target_name, "", g_szTeamNames[ 1 ]);
			
			if (GetConVarInt(g_tmc_log))
			{
				if ( target_count != 1 )
					LogAction(client, -1, "\"%L\" switched \"%s\" to %s (instant)", client, target_name, g_szTeamNames[ 1 ]);
				else // == 1
					LogAction(client, target_list[ 0 ], "\"%L\" switched \"%L\" to %s (instant)", client, target_list[ 0 ], g_szTeamNames[ 1 ]);
			}
		}
		if ( failCount > 0 )
		{
			ReplyToCommand(client, "[SM] %t", "F_TeamChange 11", "\x04", failCount, "\x01");
		}
	}
	
	return Plugin_Handled;
}

//1.4.0 (specs)
public Action:Command_SetTeamSpec(client, args)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_switch_spec ) )
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
	
	decl String:targetArg[ MAX_NAME_LENGTH ];
	//new targetId;
	decl String:target_name[ MAX_TARGET_LENGTH ];
	decl target_list[ MAXPLAYERS ], bool:tn_is_ml;
	new target_count;
	
	if (args < 1) //If no arg; check target aimed at
	{
		//targetId = GetClientAimTarget(client);
		target_count = 1;
		target_list[ 0 ] = GetClientAimTarget(client);
		if ( !GetClientName( client, target_name, sizeof(target_name) ) )
		{
			//LAWL
			return Plugin_Handled;
		}
	}
	else if (args < 2)
	{
		GetCmdArg(1, targetArg, sizeof(targetArg));
		//targetId = FindTarget(client, targetArg);
		
		if ((target_count = ProcessTargetString(
				targetArg,
				client, 
				target_list, 
				sizeof(target_list), 
				0,
				target_name,
				sizeof(target_name),
				tn_is_ml)) <= 0)
		{
			ReplyToTargetError( client, target_count );
			return Plugin_Handled;
		}
	}
	
	//if (targetId < 1)
	if (target_count <= 0)
	{
		ReplyToCommand(client, "\x04[SM] \x01Usage: <sm_teamspec|say !teamspec> <#userid|name|[aimedTarget]>");
		return Plugin_Handled;
	}
	else //if (GetClientTeam(targetId) > 1) //T or CT to Spec
	{
		decl String:szTeamBufferPrefix[ 6 ];
		getTeamNameConditionalLowerCase( 3, szTeamBufferPrefix, 4 );
		szTeamBufferPrefix[ 3 ] = '\0';
		Format( szTeamBufferPrefix, sizeof(szTeamBufferPrefix), "[%s]", szTeamBufferPrefix );
		
		new bool:didSomething = false;
		new failCount;
		
		for (new i = 0; i < target_count; i++)
		{
			if ( GetClientTeam( target_list[ i ] ) > 1 )
			{
				if ( RequestTeamsManagement( any:REASON_ADMIN,
					TMC_PRIORITY,
					TeamsManagementType:TMT_INDIVIDUALS,
					1,
					//targetId,
					target_list[ i ],
					FTMI_INSTANT ) )
				{
					didSomething = true;
					//g_szPlayerTeamPrefix[ targetId ][ 0 ] = '\0';
				}
				else
				{
					++failCount;
				}
			}
		}
		if (didSomething)
		{
			if (GetConVarInt(g_tmc_verbose_indiv))
				ShowActivity2(client, "\x04[SM] \x03", "\x01%t", "TeamSpec 14", "\x04", target_name, "\x01");
			else
				ReplyToCommand(client, "[SM] %t", "TeamSpec 14", "", target_name, "");
			
			if (GetConVarInt(g_tmc_log))
			{
				if ( target_count != 1 )
					LogAction(client, -1, "\"%L\" switched \"%s\" to Spec", client, target_name);
				else // == 1
					LogAction(client, target_list[ 0 ], "\"%L\" switched \"%L\" to Spec", client, target_list[ 0 ]);
			}
		}
		if ( failCount > 0 )
		{
			ReplyToCommand(client, "[SM] %t", "F_TeamChange 11", "\x04", failCount, "\x01");
		}
	}
	
	return Plugin_Handled;
}

public Action:Command_ChangeTeam(client, args)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_switch_indiv ) )
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
	
	decl String:targetArg[ MAX_NAME_LENGTH ];
	//new targetId;
	decl String:target_name[ MAX_TARGET_LENGTH ];
	decl target_list[ MAXPLAYERS ], bool:tn_is_ml;
	new target_count;
	
	if (args < 1) //If no arg; check target aimed at
	{
		//targetId = GetClientAimTarget(client);
		target_count = 1;
		target_list[ 0 ] = GetClientAimTarget(client);
		if ( !GetClientName( client, target_name, sizeof(target_name) ) )
		{
			//LAWL
			return Plugin_Handled;
		}
	}
	else if (args < 2)
	{
		GetCmdArg(1, targetArg, sizeof(targetArg));
		//targetId = FindTarget(client, targetArg);
		
		if ((target_count = ProcessTargetString(
				targetArg,
				client, 
				target_list, 
				sizeof(target_list), 
				0,
				target_name,
				sizeof(target_name),
				tn_is_ml)) <= 0)
		{
			ReplyToTargetError( client, target_count );
			return Plugin_Handled;
		}
	}
	
	//if (targetId < 1)
	if (target_count <= 0)
	{
		ReplyToCommand(client, "\x04[SM] \x01Usage: <sm_changeteam|say !changeteam|say !cteam> <#userid|name|[aimedTarget]>");
		return Plugin_Handled;
	}
	else //if (GetClientTeam(targetId) > 1) //T or CT to T
	{
		decl String:szTeamBufferPrefix[ 2 ][ 6 ];
		for ( new i; i < 2; ++i )
		{
			getTeamNameConditionalLowerCase( i + 2, szTeamBufferPrefix[ i ], 4 );
			szTeamBufferPrefix[ i ][ 3 ] = '\0';
			Format( szTeamBufferPrefix[ i ], sizeof(szTeamBufferPrefix[]), "[%s]", szTeamBufferPrefix[ i ] );
		}
		
		new bool:didSomething = false;
		new failCount;
		new iTeam;
		
		for (new i = 0; i < target_count; i++)
		{
			iTeam = GetClientTeam( target_list[ i ] );
			
			if ( iTeam > 1 )
			{
				if ( RequestTeamsManagement( any:REASON_ADMIN,
					TMC_PRIORITY,
					TeamsManagementType:TMT_INDIVIDUALS,
					iTeam == 2 ? 3 : 2, //not use 4, because we want current other team
					target_list[ i ],
					0 ) )
				{
					g_szPlayerTeamPrefix[ target_list[ i ] ] = iTeam == 2 ? szTeamBufferPrefix[ 1 ] : szTeamBufferPrefix[ 0 ];
					didSomething = true;
				}
				else
				{
					++failCount;
				}
			}
		}
		if (didSomething)
		{
			if (GetConVarInt(g_tmc_verbose_indiv))
				ShowActivity2(client, "\x04[SM] \x03", "\x01%t", "TeamChange 11", "\x04", target_name, "\x01");
			else
				ReplyToCommand(client, "[SM] %t", "TeamChange 11", "", target_name, "");
			
			if (GetConVarInt(g_tmc_log))
			{
				if ( target_count != 1 )
					LogAction(client, -1, "\"%L\" changed \"%s\"'s team for the next round", client, target_name);
				else // == 1
					LogAction(client, target_list[ 0 ], "\"%L\" changed \"%L\"'s team the next round (was %s)", client, target_list[ 0 ], g_szTeamNames[ iTeam - 2 ]);
			}
		}
		if ( failCount > 0 )
		{
			ReplyToCommand(client, "[SM] %t", "F_TeamChange 11", "\x04", failCount, "\x01");
		}
	}
	
	return Plugin_Handled;
}
public Action:Command_ChangeTeamInstant(client, args)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_switch_indiv_instant ) )
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
	
	decl String:targetArg[ MAX_NAME_LENGTH ];
	//new targetId;
	decl String:target_name[ MAX_TARGET_LENGTH ];
	decl target_list[ MAXPLAYERS ], bool:tn_is_ml;
	new target_count;
	
	if (args < 1) //If no arg; check target aimed at
	{
		//targetId = GetClientAimTarget(client);
		target_count = 1;
		target_list[ 0 ] = GetClientAimTarget(client);
		if ( !GetClientName( client, target_name, sizeof(target_name) ) )
		{
			//LAWL
			return Plugin_Handled;
		}
	}
	else if (args < 2)
	{
		GetCmdArg(1, targetArg, sizeof(targetArg));
		//targetId = FindTarget(client, targetArg);
		
		if ((target_count = ProcessTargetString(
				targetArg,
				client, 
				target_list, 
				sizeof(target_list), 
				0,
				target_name,
				sizeof(target_name),
				tn_is_ml)) <= 0)
		{
			ReplyToTargetError( client, target_count );
			return Plugin_Handled;
		}
	}
	
	//if (targetId < 1)
	if (target_count <= 0)
	{
		ReplyToCommand(client, "\x04[SM] \x01Usage: <sm_instantchangeteam|say !instantchangeteam|say !sm_icteam> <#userid|name|[aimedTarget]>");
		return Plugin_Handled;
	}
	else //if (GetClientTeam(targetId) > 1) //T or CT to T
	{
		decl String:szTeamBufferPrefix[ 2 ][ 6 ];
		for ( new i; i < 2; ++i )
		{
			getTeamNameConditionalLowerCase( i + 2, szTeamBufferPrefix[ i ], 4 );
			szTeamBufferPrefix[ i ][ 3 ] = '\0';
			Format( szTeamBufferPrefix[ i ], sizeof(szTeamBufferPrefix[]), "[%s]", szTeamBufferPrefix[ i ] );
		}
		
		new bool:didSomething = false;
		new failCount;
		new iTeam;
		
		for (new i = 0; i < target_count; i++)
		{
			iTeam = GetClientTeam( target_list[ i ] );
			
			if ( iTeam > 1 )
			{
				if ( RequestTeamsManagement( any:REASON_ADMIN,
					TMC_PRIORITY,
					TeamsManagementType:TMT_INDIVIDUALS,
					iTeam == 2 ? 3 : 2,
					target_list[ i ],
					FTMI_INSTANT ) )
				{
					didSomething = true;
					//g_szPlayerTeamPrefix[ targetId ][ 0 ] = '\0';
				}
				else
				{
					++failCount;
				}
			}
		}
		if (didSomething)
		{
			if (GetConVarInt(g_tmc_verbose_indiv))
				ShowActivity2(client, "\x04[SM] \x03", "\x01%t", "IsNowOtherTeam 18", 
					"\x04", 
					target_name, 
					"\x01"
					);
			else
				ReplyToCommand(client, "[SM] %t", "IsNowOtherTeam 18", 
					"", 
					target_name, 
					""
					);
			
			if (GetConVarInt(g_tmc_log))
			{
				if ( target_count != 1 )
					LogAction(client, -1, "\"%L\" switched \"%s\"", client, target_name);
				else // == 1
					LogAction(client, target_list[ 0 ], "\"%L\" switched \"%L\" (was %s)", client, target_list[ 0 ], g_szTeamNames[ iTeam - 2 ]);
			}
		}
		if ( failCount > 0 )
		{
			ReplyToCommand(client, "[SM] %t", "F_TeamChange 11", "\x04", failCount, "\x01");
		}
	}
	
	return Plugin_Handled;
}

public Action:Command_CancelChangeTeam(client, args)
{
	if ( !GetConVarBool( g_tmc ) || !GetConVarBool( g_tmc_allow_switch_indiv ) )
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
	
	decl String:targetArg[ MAX_NAME_LENGTH ];
	//new targetId;
	decl String:target_name[ MAX_TARGET_LENGTH ];
	decl target_list[ MAXPLAYERS ], bool:tn_is_ml;
	new target_count;
	
	if (args < 1) //If no arg; check target aimed at
	{
		//targetId = GetClientAimTarget(client);
		target_count = 1;
		target_list[ 0 ] = GetClientAimTarget(client);
		if ( !GetClientName( client, target_name, sizeof(target_name) ) )
		{
			//LAWL
			return Plugin_Handled;
		}
	}
	else if (args < 2)
	{
		GetCmdArg(1, targetArg, sizeof(targetArg));
		//targetId = FindTarget(client, targetArg);
		
		if ((target_count = ProcessTargetString(
				targetArg,
				client, 
				target_list, 
				sizeof(target_list), 
				0,
				target_name,
				sizeof(target_name),
				tn_is_ml)) <= 0)
		{
			ReplyToTargetError( client, target_count );
			return Plugin_Handled;
		}
	}
	
	//if (targetId < 1)
	if (target_count <= 0)
	{
		ReplyToCommand(client, "\x04[SM] \x01Usage: <sm_cancelchangeteam|say !cancelchangeteam|say !ccteam> <#userid|name|[aimedTarget]>");
		return Plugin_Handled;
	}
	else //if (GetClientTeam(targetId) > 1) //T or CT to T
	{
		
		new bool:didSomething = false;
		new failCount;
		new iTeam;
		
		for (new i = 0; i < target_count; i++)
		{
			iTeam = GetClientTeam( target_list[ i ] );
			
			if ( iTeam > 1 )
			{
				if ( RequestTeamsManagement( any:REASON_ADMIN,
					TMC_PRIORITY,
					TeamsManagementType:TMT_INDIVIDUALS,
					0,
					//targetId,
					target_list[ i ],
					0 ) )
				{
					didSomething = true;
					//g_szPlayerTeamPrefix[ targetId ][ 0 ] = '\0';
				}
				else
				{
					++failCount;
				}
			}
		}
		if (didSomething)
		{
			if (GetConVarInt(g_tmc_verbose_indiv))
				ShowActivity2(client, "\x04[SM] \x03", "\x01%t", "TeamChangeCancel 11", "\x04", target_name, "\x01");
			else
				ReplyToCommand(client, "[SM] %t", "TeamChangeCancel 11", "", target_name, "");
			
			if (GetConVarInt(g_tmc_log))
			{
				if ( target_count != 1 )
					LogAction(client, -1, "\"%L\" canceled player \"%s\"'s Team's Management", client, target_name);
				else // == 1
					LogAction(client, target_list[ 0 ], "\"%L\" canceled player \"%L\"'s Team's Management", client, target_list[ 0 ]);
			}
		}
		if ( failCount > 0 )
		{
			ReplyToCommand(client, "[SM] %t", "F_TeamChangeCancel 11", "\x04", failCount, "\x01");
		}
	}
	
	return Plugin_Handled;
}