extends Label

#@onready var hp_handler = get_node("../../MainCharacter/Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	self.text = "Gold: " + str(hp_handler.gold)
	self.text = "Gold: " + str(Game.gold)
