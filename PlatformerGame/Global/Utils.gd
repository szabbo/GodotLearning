extends Node

# bolja opcija -> const SAVE_PATH = "users://savegame.bin"
const SAVE_PATH = "res://savegame.bin"


func save_game():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data: Dictionary = {
		"player_hp": Game.player_hp,
		"gold": Game.gold
	}
	
	var json_data_string = JSON.stringify(data)
	file.store_line(json_data_string)
	
func load_game():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	
	if FileAccess.file_exists(SAVE_PATH) == true:
		if not file.eof_reached():
			var current_line = JSON.parse_string(file.get_line())
			
			if current_line:
				Game.player_hp = current_line["player_hp"]
				Game.gold = current_line["gold"]