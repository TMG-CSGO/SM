/*
* Note : this was coded with CS in mind; that's why I use CT & Terro rather than team1 / team2 sometimes
*/
#pragma semicolon 1

#include <adminmenu>
#include <sdktools>
#include <teamsmanagementinterface>

#undef REQUIRE_EXTENSIONS
#include <cstrike>
#define REQUIRE_EXTENSIONS

#define PLUGIN_VERSION "1.8.0"

public Plugin:myinfo =
{
	name = "Teams Management Commands",
	author = "RedSword / Bob Le Ponge",
	description = "Allow various Teams Management related commands.",
	version = PLUGIN_VERSION,
	url = "http://www.sourcemod.net/"
};

#include "teamsmanagementcommands/tmc_header.sp"
#include "teamsmanagementcommands/tmc_forwards.sp"
#include "teamsmanagementcommands/tmc_adminmenus.sp"
#include "teamsmanagementcommands/tmc_admincmds.sp"
#include "teamsmanagementcommands/tmc_stringhelper.sp"