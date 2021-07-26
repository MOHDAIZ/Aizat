#include <a_samp>
#include <discord-connector>
#include <discord-cmd>
#define DISCORD_CMD_PREFIX '?'

new MengNaomi;
new DCC_Channel:wahbagus;
main()
{
	wahbagus = DCC_FindChannelById("836256469338423314");
}
public OnFilterScriptInit()
{
	print("Simple player online checker by naomi iwatani");
	return 1;
}
public OnPlayerConnect(playerid)
{
	MengNaomi += 1;
	new name[MAX_PLAYER_NAME + 1];
    GetPlayerName(playerid, name, sizeof(name));
    new plrIP[16];
    GetPlayerIp(playerid, plrIP, sizeof(plrIP));
	new manaa[34];
	format(manaa, sizeof manaa, "%s Telah bergabung kedalam game IP : %s", name, plrIP);
	DCC_SendChannelMessage(wahbagus, manaa);
	return 1;
}
public OnPlayerDisconnect(playerid, reason)
{
    MengNaomi -= 1;
	new manas[MAX_PLAYER_NAME + 1];
    GetPlayerName(playerid, manas, sizeof(manas));
    new ipeh[16];
    GetPlayerIp(playerid, ipeh, sizeof(ipeh));
	new dasi[34];
	format(dasi, sizeof dasi, "%s Telah keluar dari game IP : %s", manas, ipeh);
	DCC_SendChannelMessage(wahbagus, dasi);
	return 1;
}
DCMD:player(user, channel, params[])
{
	new hahaha[64];
	format(hahaha, sizeof hahaha, "sebanyak %d player on in game", MengNaomi);
	DCC_SendChannelMessage(channel, hahaha);
	return 1;
}
