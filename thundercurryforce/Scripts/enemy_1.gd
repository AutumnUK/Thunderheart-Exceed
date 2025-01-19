extends Area2D

var hp		= HP
var amplitude = 13.0
var frequency = 0.04 
var vertical_center

const HP 	= 4
const SPEED = 2
const SCORE = 3

func wave():
	var wave_offset = sin(global_position.x * frequency) * amplitude
	global_position.y = vertical_center + wave_offset

func _ready() -> void:
	add_to_group("enemies")
	vertical_center = global_position.y;
	
func _process(delta: float) -> void:
	global_position.x -= 2
	wave();
	
	if hp <= 0:
		Global.increaseScore(SCORE)
		queue_free();

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("PlayerBullets"):	hp -= 1
	if area.is_in_group("Player"):			hp -= 10
