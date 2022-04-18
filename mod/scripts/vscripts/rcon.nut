global function RconInit

void function RconInit() {
	AddClientCommandCallback("rcon", RconCommand);
}

bool function RconCommand(entity player, array<string> args) {
	if (GetConVarString("rcon_admin_uids").find(player.GetUID()) != null) {
		string command;
		foreach (arg in args) {
			if (command.len() > 0) command += " ";
			command += arg;
		}
		ServerCommand(command);
		return true;
	}
	return false;
}
