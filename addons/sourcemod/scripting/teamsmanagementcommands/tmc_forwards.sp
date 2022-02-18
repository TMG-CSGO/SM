public OnPluginStart()
{
	//Allow multiples mod
	decl String:szBuffer[ 16 ];
	GetGameFolderName( szBuffer, sizeof(szBuffer) );
	
	if ( StrEqual( szBuffer, "cstrike", false ) )
	{
		g_currentMod = Working_Mod:GAME_CSS;
	}
	else if ( StrEqual( szBuffer, "csgo", false ) )
	{
		g_currentMod = Working_Mod:GAME_CSGO;
	}
	else if ( StrEqual( szBuffer, "dod", false ) )
	{
		g_currentMod = Working_Mod:GAME_DODS;
	}
	else
	{
		g_currentMod = Working_Mod:GAME_UNKNOWN;
	}
	
	//CVARs
	CreateConVar("teamsmanagementcommandsversion", PLUGIN_VERSION, "Teams Management Commands version", FCVAR_PLUGIN|FCVAR_SPONLY|FCVAR_NOTIFY|FCVAR_DONTRECORD);
	
	g_tmc = CreateConVar("teamsmanagementcommands", "1", "Is the plugin enabled ? 0=No, 1=Yes. Def. 1", 
		FCVAR_PLUGIN, true, 0.0, true, 1.0);
	
	//Seeing action
	g_tmc_verbose_global = CreateConVar("tmc_verbose_global", "1", "Show globals Teams Management to everyone ? 0=No, 1=Yes. Def. 1.", 
		FCVAR_PLUGIN, true, 0.0, true, 1.0);
	g_tmc_verbose_indiv = CreateConVar("tmc_verbose_indiv", "1", "Show individual Teams Management to everyone ? 0=No, 1=Yes. Def. 1.", 
		FCVAR_PLUGIN, true, 0.0, true, 1.0);
	if ( g_currentMod == Working_Mod:GAME_CSS || g_currentMod == Working_Mod:GAME_CSGO )
	{
		g_tmc_verbose_clan = CreateConVar("tmc_verbose_clan", "1", "Show clan Teams Management to everyone ? 0=No, 1=Yes. Def. 1.", 
			FCVAR_PLUGIN, true, 0.0, true, 1.0);
	}
	g_tmc_log = CreateConVar("tmc_log", "1", "Should the plugin log ? 0=No, 1=Yes. Def. 1.", 
		FCVAR_PLUGIN, true, 0.0, true, 1.0);
		
	//Sounds
	g_tmc_sound = CreateConVar( "tmc_sound", "1", "Ask TMI to play a sound when teams are scrambled? 1=Yes, 0=No. Def. 1.", 
		FCVAR_PLUGIN, true, 0.0, true, 1.0 );
		
	//Fade
	g_tmc_fadeColor = CreateConVar( "tmc_fade", "1", "Fade-in players screens when teams are scrambled. 0 = disabled, 1 = enabled. Def. 1.", 
		FCVAR_PLUGIN, true, 0.0, true, 1.0 );
	
	//3rd mode
	g_tmc_required_value = CreateConVar( "tmc_required_value", "1", "If CVar 'ats' value is '3', then a team will have X players. Min 1.", 
		FCVAR_PLUGIN, true, 1.0, true, 64.0 );
	g_tmc_required_team = CreateConVar( "tmc_required_team", "1", "If CVar 'ats' value is '3', then specified team will have an exact number of players. 0 = terro, 1 = CTs.", 
		FCVAR_PLUGIN, true, 0.0, true, 1.0 );
	
	if ( g_currentMod == Working_Mod:GAME_CSS || g_currentMod == Working_Mod:GAME_CSGO )
	{
		//1.7.0 ==> drop c4
		g_tmc_dropc4ifct = CreateConVar( "tmc_dropc4ifct", "1", "Drop c4 when switching someone to CT ? 0=No, 1=Yes. Def. 1.", 
			FCVAR_PLUGIN, true, 0.0, true, 1.0 );
	}
		
	//Menu allow
	g_tmc_allow_scramble_fair = CreateConVar( "tmc_allow_scramble_fair", "1", "Allow fair teams scramble (not instant) ? 1=Yes (default).", 
		FCVAR_PLUGIN, true, 0.0, true, 1.0 );
	g_tmc_allow_scramble_unfair = CreateConVar( "tmc_allow_scramble_unfair", "1", "Allow unfair teams scramble (not instant) ? 1=Yes (default).", 
		FCVAR_PLUGIN, true, 0.0, true, 1.0 );
	g_tmc_allow_scramble_specific = CreateConVar( "tmc_allow_scramble_specific", "1", "Allow specific teams scramble (not instant) ? 1=Yes (default).", 
		FCVAR_PLUGIN, true, 0.0, true, 1.0 );
	g_tmc_allow_teamswaps = CreateConVar( "tmc_allow_teamswaps", "1", "Allow to swap teams (not instant) ? 1=Yes (default).", 
		FCVAR_PLUGIN, true, 0.0, true, 1.0 );
		//instants
	g_tmc_allow_scramble_fair_instant = CreateConVar( "tmc_allow_scramble_fair_instant", "1", "Allow fair teams scramble instantly ? 1=Yes (default).", 
		FCVAR_PLUGIN, true, 0.0, true, 1.0 );
	g_tmc_allow_scramble_unfair_instant = CreateConVar( "tmc_allow_scramble_unfair_instant", "1", "Allow unfair teams scramble instantly ? 1=Yes (default).", 
		FCVAR_PLUGIN, true, 0.0, true, 1.0 );
	g_tmc_allow_scramble_specific_instant = CreateConVar( "tmc_allow_scramble_specific_instant", "1", "Allow specific teams scramble instantly ? 1=Yes (default).", 
		FCVAR_PLUGIN, true, 0.0, true, 1.0 );
	g_tmc_allow_teamswaps_instant = CreateConVar( "tmc_allow_teamswaps_instant", "1", "Allow to swap teams instantly ? 1=Yes (default).", 
		FCVAR_PLUGIN, true, 0.0, true, 1.0 );
		
	g_tmc_allow_team_prevent = CreateConVar( "tmc_allow_team_prevent", "0", "Allow to prevent teams scramble ? 1=Yes, 0=No (default).", 
		FCVAR_PLUGIN, true, 0.0, true, 1.0 );
	g_tmc_allow_team_cancel = CreateConVar( "tmc_allow_team_cancel", "1", "Allow to cancel teams scramble ? 1=Yes (default).", 
		FCVAR_PLUGIN, true, 0.0, true, 1.0 );
		
	g_tmc_allow_switch_indiv = CreateConVar( "tmc_allow_changeteam", "1", "Allow to change someone's team (not instant) ? 1=Yes (default).", 
		FCVAR_PLUGIN, true, 0.0, true, 1.0 );
		//instant
	g_tmc_allow_switch_indiv_instant = CreateConVar( "tmc_allow_changeteam_instant", "1", "Allow to change someone's team (instant) ? 1=Yes (default).", 
		FCVAR_PLUGIN, true, 0.0, true, 1.0 );
	
	g_tmc_allow_switch_spec = CreateConVar( "tmc_allow_spec", "1", "Allow switching to spec (instant) ? 1=Yes (default).", 
		FCVAR_PLUGIN, true, 0.0, true, 1.0 );
		
	if ( g_currentMod == Working_Mod:GAME_CSS || g_currentMod == Working_Mod:GAME_CSGO )
	{
		g_tmc_allow_switch_clan = CreateConVar( "tmc_allow_clanchangeteam", "0", "Allow to change clan's members' team via commands ? 1=Yes, 0=No (default, recommended).", 
			FCVAR_PLUGIN, true, 0.0, true, 1.0 );
		g_tmc_allow_switch_clan_menu = CreateConVar( "tmc_allow_clanchangeteam_menu", "1", "Allow to change clan's members' team through menu ? 1=Yes (default).", 
			FCVAR_PLUGIN, true, 0.0, true, 1.0 );
	}
	
	//Config
	AutoExecConfig( true, "teamsmanagementcommands" );
		
	//Commands
	
	//Rest
	//Team
	RegAdminCmd("sm_scramblefair", Command_ScrambleFair, ADMFLAG_BAN, "sm_scramblefair");
	RegAdminCmd("sm_scrambleunfair", Command_ScrambleUnfair, ADMFLAG_BAN, "sm_scrambleunfair");
	RegAdminCmd("sm_scramblespecificteam", Command_ScrambleSpecificTeam, ADMFLAG_BAN, "sm_scramblespecificteam");
	RegAdminCmd("sm_swapteams", Command_SwapTeams, ADMFLAG_BAN, "sm_swapteams");
	
	RegAdminCmd("sm_scramblefairinstant", Command_ScrambleFairInstant, ADMFLAG_BAN, "sm_scramblefairinstant");
	RegAdminCmd("sm_scrambleunfairinstant", Command_ScrambleUnfairInstant, ADMFLAG_BAN, "sm_scrambleunfairinstant");
	RegAdminCmd("sm_scramblespecificteaminstant", Command_ScrambleSpecificTeamInstant, ADMFLAG_BAN, "sm_scramblespecificteaminstant");
	RegAdminCmd("sm_swapteamsinstant", Command_SwapTeamsInstant, ADMFLAG_BAN, "sm_swapteamsinstant");
	
	RegAdminCmd("sm_tmprevent", Command_TeamPrevent, ADMFLAG_BAN, "sm_tmprevent");
	RegAdminCmd("sm_tmcancel", Command_TeamCancel, ADMFLAG_BAN, "sm_tmcancel");
	
	//Single player
	RegAdminCmd("sm_team1", Command_SetTeamTerro, ADMFLAG_BAN, "sm_team1 <#userid|name|[aimedTarget]>");
	RegAdminCmd("sm_team2", Command_SetTeamCT, ADMFLAG_BAN, "sm_team2 <#userid|name|[aimedTarget]>");
	RegAdminCmd("sm_iteam1", Command_SetTeamTerroInstant, ADMFLAG_BAN, "sm_iteam1 <#userid|name|[aimedTarget]>");
	RegAdminCmd("sm_iteam2", Command_SetTeamCTInstant, ADMFLAG_BAN, "sm_iteam2 <#userid|name|[aimedTarget]>");
	if ( g_currentMod != Working_Mod:GAME_DODS )
	{
		RegAdminCmd("sm_teamt", Command_SetTeamTerro, ADMFLAG_BAN, "sm_teamt <#userid|name|[aimedTarget]>");
		RegAdminCmd("sm_teamct", Command_SetTeamCT, ADMFLAG_BAN, "sm_teamct <#userid|name|[aimedTarget]>");
		RegAdminCmd("sm_instantteamt", Command_SetTeamTerroInstant, ADMFLAG_BAN, "sm_instantteamt <#userid|name|[aimedTarget]>");
		RegAdminCmd("sm_instantteamct", Command_SetTeamCTInstant, ADMFLAG_BAN, "sm_instantteamct <#userid|name|[aimedTarget]>");
		RegAdminCmd("sm_iteamt", Command_SetTeamTerroInstant, ADMFLAG_BAN, "sm_iteamt <#userid|name|[aimedTarget]>"); //shortcut
		RegAdminCmd("sm_iteamct", Command_SetTeamCTInstant, ADMFLAG_BAN, "sm_iteamct <#userid|name|[aimedTarget]>"); //shortcut
	}
	else
	{
		RegAdminCmd("sm_teamallies", Command_SetTeamTerro, ADMFLAG_BAN, "sm_teamallies <#userid|name|[aimedTarget]>");
		RegAdminCmd("sm_teamaxis", Command_SetTeamCT, ADMFLAG_BAN, "sm_teamaxis <#userid|name|[aimedTarget]>");
		RegAdminCmd("sm_instantteamallies", Command_SetTeamTerroInstant, ADMFLAG_BAN, "sm_instantteamallies <#userid|name|[aimedTarget]>");
		RegAdminCmd("sm_instantteamaxis", Command_SetTeamCTInstant, ADMFLAG_BAN, "sm_instantteamaxis <#userid|name|[aimedTarget]>");
		RegAdminCmd("sm_iteamallies", Command_SetTeamTerroInstant, ADMFLAG_BAN, "sm_iteamallies <#userid|name|[aimedTarget]>"); //shortcut
		RegAdminCmd("sm_iteamaxis", Command_SetTeamCTInstant, ADMFLAG_BAN, "sm_iteamaxis <#userid|name|[aimedTarget]>"); //shortcut
	}
	RegAdminCmd("sm_teamspec", Command_SetTeamSpec, ADMFLAG_BAN, "sm_teamspec <#userid|name|[aimedTarget]>");
	RegAdminCmd("sm_changeteam", Command_ChangeTeam, ADMFLAG_BAN, "sm_changeteam <#userid|name|[aimedTarget]>");
	RegAdminCmd("sm_cteam", Command_ChangeTeam, ADMFLAG_BAN, "sm_cteam <#userid|name|[aimedTarget]>"); //shortcut
	RegAdminCmd("sm_instantchangeteam", Command_ChangeTeamInstant, ADMFLAG_BAN, "sm_instantchangeteam <#userid|name|[aimedTarget]>");
	RegAdminCmd("sm_icteam", Command_ChangeTeamInstant, ADMFLAG_BAN, "sm_icteam <#userid|name|[aimedTarget]>"); //shortcut
	RegAdminCmd("sm_cancelchangeteam", Command_CancelChangeTeam, ADMFLAG_BAN, "sm_cancelchangeteam <#userid|name|[aimedTarget]>");
	RegAdminCmd("sm_ccteam", Command_CancelChangeTeam, ADMFLAG_BAN, "sm_cancelchangeteam <#userid|name|[aimedTarget]>"); //shortcut
	
	if ( g_currentMod == Working_Mod:GAME_CSS || g_currentMod == Working_Mod:GAME_CSGO )
	{
		//Clan
		//The following ALL fails with tags having quotes in them
		RegAdminCmd("sm_clanteamt", Command_ClanSetTeamTerro, ADMFLAG_BAN, "sm_clanteamt <tag>");
		RegAdminCmd("sm_clanteamct", Command_ClanSetTeamCT, ADMFLAG_BAN, "sm_clanteamct <tag>");
		RegAdminCmd("sm_clanchangeteam", Command_ClanChangeTeam, ADMFLAG_BAN, "sm_clanchangeteam <tag>");
		RegAdminCmd("sm_clanteamtinstant", Command_ClanSetTeamTerroInstant, ADMFLAG_BAN, "sm_clanteamtinstant <tag>");
		RegAdminCmd("sm_clanteamctinstant", Command_ClanSetTeamCTInstant, ADMFLAG_BAN, "sm_clanteamctinstant <tag>");
		RegAdminCmd("sm_clanchangeteaminstant", Command_ClanChangeTeamInstant, ADMFLAG_BAN, "sm_clanchangeteaminstant <tag>");
		RegAdminCmd("sm_clanteamspec", Command_ClanSetTeamSpec, ADMFLAG_BAN, "sm_clanteamspec <tag>");
		RegAdminCmd("sm_clancancelchangeteam", Command_ClanCancelChangeTeam, ADMFLAG_BAN, "sm_clancancelchangeteam <tag>");
	}
	
	//Translation file
	LoadTranslations("common.phrases");
	LoadTranslations("adminmenu.phrases");
	LoadTranslations("teamsmanagementcommands.phrases");
	
	//Menu
	/* Account for late loading */
	new Handle:topmenu;
	if (LibraryExists("adminmenu") && ((topmenu = GetAdminTopMenu()) != INVALID_HANDLE))
	{
		OnAdminMenuCreated(topmenu);
		OnAdminMenuReady(topmenu);
	}
}
public OnMapStart()
{
	//teams name
	getTeamNameConditionalLowerCase( 2, g_szTeamNames[ 0 ], sizeof(g_szTeamNames[]) );
	getTeamNameConditionalLowerCase( 3, g_szTeamNames[ 1 ], sizeof(g_szTeamNames[]) );
}
public OnClientDisconnect(client)
{
	g_szPlayerTeamPrefix[ client ][ 0 ] = '\0';
}
public OnTeamsManagementExecutedRequest( const Handle:plugin, 
	const reasonId,
	const priority, 
	const TeamsManagementType:type,
	const actionId, 
	const any:customValue, 
	const flags)
{
	//No need to check plugin; wherever it is from we need to clean name's prefixes
	if ( TeamsManagementType:type == TeamsManagementType:TMT_TEAMS )
	{
		for ( new i = 1; i <= MaxClients; ++i )
		{
			g_szPlayerTeamPrefix[ i ][ 0 ] = '\0';
		}
	}
	else if ( TeamsManagementType:type == TeamsManagementType:TMT_INDIVIDUALS &&
		customValue >= 1 && 
		customValue <= MAXPLAYERS )
	{
		if ( customValue >= 1 && customValue <= MAXPLAYERS )
		{
			g_szPlayerTeamPrefix[ customValue ][ 0 ] = '\0';
		}
		
		//Check bomb (round end if a team change, so only for TMI_INDIV)
		if ( g_currentMod == Working_Mod:GAME_CSS || g_currentMod == Working_Mod:GAME_CSGO )
		{
			if ( GetConVarBool( g_tmc_dropc4ifct ) == true &&
						IsClientInGame( customValue ) && 
						IsPlayerAlive( customValue ) &&
						GetClientTeam( customValue ) == 3 && //Only if player goes CT should we need to drop C4
						GetPlayerWeaponSlot( customValue , 4 ) != -1 )
			{
				CS_DropWeapon( customValue, GetPlayerWeaponSlot( customValue, 4 ), true, true );
			}
		}
	}
}
public OnTeamsManagementAbandonedRequest( const Handle:plugin, 
	const reasonId,
	const priority, 
	const TeamsManagementType:type,
	const actionId, 
	const any:customValue, 
	const flags)
{
	if ( plugin == GetMyHandle() &&
		TeamsManagementType:type == TeamsManagementType:TMT_INDIVIDUALS &&
		customValue >= 1 && 
		customValue <= MAXPLAYERS )
	{
		if ( customValue >= 1 && customValue <= MAXPLAYERS )
		{
			g_szPlayerTeamPrefix[ customValue ][ 0 ] = '\0';
		}
	}
}

//===== Menu

//OnMenuCreated --> Add categories
public OnAdminMenuCreated(Handle:topmenu)
{
	new String:szBuffer[32] = ADMINMENU_TEAMSMANAGEMENT;
	
	//Create category if it doesn't exist
	if ((obj_teamsmanagementcmds = FindTopMenuCategory(topmenu, szBuffer)) == INVALID_TOPMENUOBJECT)
	{
		obj_teamsmanagementcmds = AddToTopMenu(topmenu,
			szBuffer,
			TopMenuObject_Category,
			TeamsManagementCategoryHandler,
			INVALID_TOPMENUOBJECT,
			"TeamsManagementOverride",
			ADMFLAG_BAN,
			ADMINMENU_TEAMSMANAGEMENT_STR);
	}
}

//Seems required (http://wiki.alliedmods.net/Admin_Menu_(SourceMod_Scripting))
public OnLibraryRemoved(const String:name[])
{
	if (StrEqual(name, "adminmenu"))
	{
		hTopMenu = INVALID_HANDLE;
	}
}

//OnMenuReady --> Add sub-categories
public OnAdminMenuReady(Handle:topmenu)
{
	/* Block us from being called twice */
	if (topmenu == hTopMenu)
	{
		return;
	}
	
	/* Save the Handle */
	hTopMenu = topmenu;
	
	/* Find the category */
	new TopMenuObject:teamsmanagement_commands = FindTopMenuCategory(hTopMenu, ADMINMENU_TEAMSMANAGEMENT);
	
	if (teamsmanagement_commands != INVALID_TOPMENUOBJECT)
	{
		AddToTopMenu(hTopMenu,
			"sm_tmteammenu",
			TopMenuObject_Item,
			AdminMenu_TMTeamMenu,
			teamsmanagement_commands,
			"sm_tmteammenu",
			ADMFLAG_BAN);
		
		AddToTopMenu(hTopMenu,
			"sm_tmplayermenu",
			TopMenuObject_Item,
			AdminMenu_TMPlayerMenu,
			teamsmanagement_commands,
			"sm_tmplayermenu",
			ADMFLAG_BAN);
			
		if ( g_currentMod == Working_Mod:GAME_CSS || g_currentMod == Working_Mod:GAME_CSGO )
		{
			AddToTopMenu(hTopMenu,
				"sm_tmclanmenu",
				TopMenuObject_Item,
				AdminMenu_TMClanMenu,
				teamsmanagement_commands,
				"sm_tmclanmenu",
				ADMFLAG_BAN);
		}
	}
	
}

//Used by the above
public TeamsManagementCategoryHandler(Handle:topmenu, 
						TopMenuAction:action,
						TopMenuObject:object_id,
						param,
						String:buffer[],
						maxlength)
{
	if (action == TopMenuAction_DisplayTitle)
	{
		if (object_id == INVALID_TOPMENUOBJECT)
		{
			FormatEx(buffer, maxlength, "%T:", "Admin Menu", param);
		}
		else if (object_id == obj_teamsmanagementcmds)
		{
			strcopy(buffer, maxlength, ADMINMENU_TEAMSMANAGEMENT_STR);
		}
	}
	else if (action == TopMenuAction_DisplayOption)
	{
		if (object_id == obj_teamsmanagementcmds)
		{
			strcopy(buffer, maxlength, ADMINMENU_TEAMSMANAGEMENT_STR);
		}
	}
}