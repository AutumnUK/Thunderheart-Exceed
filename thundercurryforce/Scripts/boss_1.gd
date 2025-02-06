extends Area2D

const 	HP			= 120
const 	RELOAD		= 50
const 	SCORE		= 10

var		wave_timer	= 0
var		waves		= 0
var 	hp			= HP
var 	reload		= RELOAD
var 	bullet 		= preload("res://Scenes/enemy_bullet_1.tscn")

func spawn_bullet(rot):
	var bullet1 = bullet.instantiate()
	bullet1.global_position = global_position
	bullet1.set("rotation", rot)
	add_sibling(bullet1)

# cone waves of bullets
func attack_1():
	match wave_timer :
		5  : spawn_bullet(-0.4)
		10 : spawn_bullet(-0.2)
		15 : spawn_bullet( 0.0)
		20 : spawn_bullet( 0.2)
		25 : spawn_bullet( 0.4)

func _ready() -> void:
	add_to_group("enemies");
	Global.bosshpmax 	= HP;

func _process(_delta: float) -> void:
	Global.bosshp = hp
	
	
	if global_position.x <= 240 :
		wave_timer += 1
		if waves <= 5: attack_1()
		if wave_timer == 26 : waves += 1 ;wave_timer = 0
		if waves == 10:
			waves = 0
	if global_position.x > 240: global_position.x -= 1.5
	if hp <= 0:	Global.increaseScore(SCORE); queue_free()

func _on_area_entered(area: Area2D) -> void: if area.is_in_group("PlayerBullets"):	hp -= 1
