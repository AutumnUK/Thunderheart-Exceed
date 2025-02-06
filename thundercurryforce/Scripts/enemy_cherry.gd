extends Area2D

const 	SPEED 			: int			= 2
const 	SCORE 			: int			= 3

var		path_progress	: int			= 0
var 	hp				: int			= 3
var		patternTimer	: int			= 0
var		hitflash		: int			= 0

func cherry_pattern() -> void:
	path_progress += 1
	if path_progress >   0 && path_progress < 100 :	global_position.x -= SPEED
	if path_progress > 120 && path_progress < 200 :	global_position.y -= SPEED
	if path_progress > 240 && path_progress < 340 :	global_position.x += SPEED 
	if path_progress > 340 : queue_free()

func _process(_delta: float) -> void:
	if hp <= 0:
		Global.increaseScore(SCORE)
		queue_free()
		
	if hitflash  > 1: modulate.a 	= 0.5
	if hitflash == 0: modulate.a	= 1
	if hitflash  > 0: hitflash 		-= 1
	if hitflash  > 20: hitflash = 20
	
	cherry_pattern()
	patternTimer += 1

func _ready() -> void: 							add_to_group("enemies")
func _on_area_entered(area: Area2D) -> void: 	if area.is_in_group("PlayerBullets"):	hp -= 1; 		hitflash += 2
