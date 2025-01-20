extends Area2D

var hp
var reload
var vertical_center;  # Center of the screen height
var bullet 	= preload("res://Scenes/enemy_bullet_1.tscn")
var exit = 0

const HP = 30
const RELOAD = 120
const SCORE = 10

func _ready() -> void:
	add_to_group("enemies")
	hp = HP
	reload = RELOAD
	
func _process(delta: float) -> void:
	reload -= 1;
	if global_position.x > 300: global_position.x -= 1.5
	
	exit += 1;
	if exit > 240 :
		global_position.x -= 1.5;

		
	if global_position.x < -30:
		queue_free();
	
	if reload <= 0:
		var bullet1 = bullet.instantiate()
		bullet1.global_position = global_position
		add_sibling(bullet1)
		
		var bullet2 = bullet.instantiate()
		bullet2.global_position = global_position
		bullet2.set("rotation",-0.05);
		add_sibling(bullet2)
		
		var bullet3 = bullet.instantiate()
		bullet3.global_position = global_position
		bullet3.set("rotation", 0.05);
		add_sibling(bullet3)
		
		reload += RELOAD;
		

	
	if hp <= 0:
		queue_free()
		Global.increaseScore(SCORE)

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("PlayerBullets"): hp -= 1
