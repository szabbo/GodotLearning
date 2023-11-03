extends CharacterBody2D

var SPEED = 25
var is_attacking_player = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var player = get_node("../../MainCharacter/Player")
@onready var frog_anim = get_node("AnimatedSprite2D")

# Called when the node enters the scene tree for the first time.
func _ready():
	frog_anim.play("Idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass # Replace with function body.

func _physics_process(delta):
	self.velocity.y += gravity * delta
	
	if is_attacking_player and frog_anim.animation != "Death":
		var direction = (player.position - self.position).normalized()
		if direction.x > 0:
			frog_anim.flip_h = true
		else:
			frog_anim.flip_h = false
			
		self.velocity.x = direction.x * SPEED
		frog_anim.play("Jump")
	else:
		if frog_anim.animation != "Death":
			frog_anim.play("Idle")
			
		self.velocity.x = 0
	
	move_and_slide()

func _on_player_detection_body_entered(body):
	if body.name == "Player":
		is_attacking_player = true


func _on_player_detection_body_exited(body):
	if body.name == "Player":
		is_attacking_player = false


func _on_player_death_body_entered(body):
	if body.name == "Player":
		death()


func _on_player_death_body_exited(body):
	pass


func _on_player_collision_body_entered(body):
	if body.name == "Player":
		Game.player_hp -= 3
		Utils.save_game()
		
#		death()
		# promijeniti logiku tako da kad dotaknem zabu da ne explodira
		# vec da ostane i dalje prisutna i radi najeb


func death():
	is_attacking_player = false
	
	Game.gold += 5
	Utils.save_game()
	
	frog_anim.play("Death")
	await frog_anim.animation_finished
	
	self.queue_free()
