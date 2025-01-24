extends Area2D

const 	HP			= 60
const 	RELOAD		= 50
const 	SCORE		= 10

var 	hp			= HP
var 	reload		= RELOAD
var 	bullet 		= preload("res://Scenes/enemy_bullet_1.tscn")

func shoot():
	reload -= 1
	if reload <= 0:
		var bullet1 = bullet.instantiate()
		bullet1.global_position.y = global_position.y +30
		bullet1.global_position.x = global_position.x
		add_sibling(bullet1)
		reload += RELOAD
		
	if hp <= 0:
		Global.increaseScore(SCORE)
		queue_free()

func _process(delta: float) -> void:
	Global.bosshp 		= hp
	shoot()
	if global_position.x > 240: global_position.x -= 1.5

	
func _ready() -> void:
	add_to_group("enemies");
	Global.bosshpmax 	= HP;
	
func _on_area_entered(area: Area2D) -> void:	
	if area.is_in_group("PlayerBullets"):	hp -= 1
