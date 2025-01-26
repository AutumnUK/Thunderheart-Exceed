extends Area2D

const 	SPEED 			: int			= 4
const 	SCORE 			: int			= 3

var 	hp				: int			= 2
var		pattern			: int			= 1
		# Pattern 1 = Top Start
		# Pattern 2 = Bottom Start

var		patternTimer	: int			= 0

func _ready() -> void:
	add_to_group("enemies")

func _process(delta: float) -> void:
	if hp <= 0:
		Global.increaseScore(SCORE)
		queue_free()
		
	patternTimer += 1
	
	if pattern == 1:
		pass
	
	if pattern == 2:
		pass

func _on_area_entered(area: Area2D) -> void: 	
	if area.is_in_group("PlayerBullets"):	hp -= 1
