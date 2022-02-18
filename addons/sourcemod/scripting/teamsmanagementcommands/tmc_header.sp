//Flags : (used for menus)
#define	REMOVE_TEAMLESS		(1<<0)
#define	REMOVE_SPECTATORS	(1<<1)
#define	REMOVE_TERRORISTS	(1<<2)
#define	REMOVE_CTS			(1<<3)

public Plugin:myinfo =
{
	name = "Teams Management Commands",
	author = "RedSword / Bob Le Ponge",
	description = "Allow various Teams Management related commands.",
	version = PLUGIN_VERSION,
	url = "http://www.sourcemod.net/"
};

//Better use of interface
#define TMC_PRIORITY 100
enum TM_Reason
{
	REASON_ADMIN = 1
};

//Cvars
new Handle:g_tmc;
new Handle:g_tmc_verbose_global;
new Handle:g_tmc_verbose_indiv;
new Handle:g_tmc_verbose_clan;
new Handle:g_tmc_log;
new Handle:g_tmc_sound;
new Handle:g_tmc_fadeColor;
new Handle:g_tmc_required_value;
new Handle:g_tmc_required_team;
new Handle:g_tmc_dropc4ifct;

//actions CVars

new Handle:g_tmc_allow_scramble_fair;
new Handle:g_tmc_allow_scramble_unfair;
new Handle:g_tmc_allow_scramble_specific;
new Handle:g_tmc_allow_teamswaps; //1.6
new Handle:g_tmc_allow_scramble_fair_instant;
new Handle:g_tmc_allow_scramble_unfair_instant;
new Handle:g_tmc_allow_scramble_specific_instant;
new Handle:g_tmc_allow_teamswaps_instant; //1.6
new Handle:g_tmc_allow_team_prevent;
new Handle:g_tmc_allow_team_cancel;
new Handle:g_tmc_allow_switch_indiv;
new Handle:g_tmc_allow_switch_indiv_instant;
new Handle:g_tmc_allow_switch_spec;
new Handle:g_tmc_allow_switch_clan;
new Handle:g_tmc_allow_switch_clan_menu;

//Menu
#define ADMINMENU_TEAMSMANAGEMENT		"TeamsManagementCat"
#define ADMINMENU_TEAMSMANAGEMENT_STR	"Teams Management"
new Handle:hTopMenu = INVALID_HANDLE;
new TopMenuObject:obj_teamsmanagementcmds = INVALID_TOPMENUOBJECT;

//Vars
new String:g_szPlayerTeamPrefix[ MAXPLAYERS + 1 ][ 5 ]; //doesn't look like a 6th element is needed, PrintTo probably do a sizeof

//Mod specific
enum Working_Mod
{
	GAME_UNKNOWN,
	GAME_CSS = 1,
	GAME_CSGO = 2,
	GAME_DODS = 3
};

new Working_Mod:g_currentMod;

new String:g_szTeamNames[ 2 ][ 16 ];