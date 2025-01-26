extends Area2D

const 	SPEED 			: int			= 4
const 	SCORE 			: int			= 3
const 	amplitude 		: float			= 13.0
const 	frequency 		: float 		= 0.04 

var 	hp				: int			= 4
var 	vertical_center	: int			## Must be defined on _ready()

func _ready() -> void:
	add_to_group("enemies")
	vertical_center = global_position.y;

func wave_movement() -> void:
	var wave_offset 	= sin(global_position.x * frequency) * amplitude
	global_position.y 	= vertical_center + wave_offset
	
func _process(delta: float) -> void:
	global_position.x -= SPEED
	wave_movement()
	
	if hp <= 0:
		Global.increaseScore(SCORE)
		queue_free()

func _on_area_entered(area: Area2D) -> void: 	
	if area.is_in_group("PlayerBullets"):	hp -= 1
