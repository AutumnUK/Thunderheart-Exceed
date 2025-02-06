extends Area2D

const 	HP 				: int			= 30
const	RELOAD			: int			= 120
const 	SPEED 			: int			= 2
const 	SCORE 			: int			= 10
const 	amplitude 		: float			= 13.0
const 	frequency 		: float 		= 0.04 

var 	hp				: int			= HP
var 	reload			: int			= RELOAD
var 	bullet 			: PackedScene	= preload("res://Scenes/enemy_bullet_1.tscn")
var 	exit 			: int			= 0
var		hitflash		: int			= 0

func _ready() -> void:
	add_to_group("enemies")

func reload_process() -> void:
	reload -= 1
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

func movement_process():
	exit += 1
	if global_position.x > 240: global_position.x -= SPEED 
	if exit > 240 : 			global_position.x -= SPEED
		
	if global_position.x < -30:	queue_free();

	if hitflash  > 1: modulate.a 	= 0.5
	if hitflash == 0: modulate.a	= 1
	if hitflash  > 0: hitflash 		-= 1
	if hitflash  > 20: hitflash = 20

func _process(_delta: float) -> void:
	movement_process()
	reload_process()
	if hp <= 0:
		queue_free()
		Global.increaseScore(SCORE)

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("PlayerBullets"): 
		hp -= 1
		hitflash += 2
