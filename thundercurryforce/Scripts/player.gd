extends Area2D
var PlayerBullet 	= preload("res://Scenes/player_bullet.tscn")
var reload			= 0
var cancontrol		= false 
var invuln			= 180
const SPEED 		= 140
var 	Player 	= preload("res://Scenes/player.tscn")

func spawn() -> void:
	var player = Player.instantiate()
	add_sibling(player)

func _ready() -> void:
	global_position.x = -40
	global_position.y = 120

func _process(delta: float) -> void:
	Global.player_x	= global_position.x
	Global.player_y = global_position.y
	if invuln > 0:	invuln -= 1
	if cancontrol == false:	global_position.x += 1	
	if global_position.x >= 50:	cancontrol = true	
	if cancontrol == true:	input(delta)
		
func input(delta):	
	if Input.is_action_pressed("A") && reload == 0:
		var bullet1 = PlayerBullet.instantiate();	bullet1.global_position = global_position;	add_sibling(bullet1)	
		var bullet2 = PlayerBullet.instantiate();	bullet2.global_position = global_position;	bullet2.set("rotation", 0.1);	add_sibling(bullet2)		
		var bullet3 = PlayerBullet.instantiate();	bullet3.global_position = global_position;	bullet3.set("rotation", -0.1);	add_sibling(bullet3)
		$ShootingSound.play()
		reload += 14
	
	if reload > 0: reload -= 1
			
	var movement_vector = Vector2.ZERO
	if Input.is_action_pressed("Left"):  	movement_vector.x -= 1
	if Input.is_action_pressed("Right"): 	movement_vector.x += 1
	if Input.is_action_pressed("Up"):   	movement_vector.y -= 1
	if Input.is_action_pressed("Down"):  	movement_vector.y += 1;  	
	if movement_vector.length() > 0:		movement_vector = movement_vector.normalized()
	var new_position = global_position + movement_vector * SPEED * delta

	global_position.x = clamp(new_position.x, 18, 302)
	global_position.y = clamp(new_position.y, 15, 225)	

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemies") && invuln == 0:	death()
	if area.is_in_group("danger") && invuln == 0:	death()

func death():
	$DeathSound.play()
	Global.global_lives -= 1
	if Global.global_lives >= 0:	spawn();
	if Global.global_lives  < 0:	get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")
	queue_free();
	
