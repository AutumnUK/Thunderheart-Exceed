extends Area2D

const	SPEED : int = 400
func _ready() -> void:
	add_to_group("PlayerBullets")
	set("z_index",4)

func _process(delta: float) -> void:	
	var direction = Vector2(cos(rotation), sin(rotation))
	global_position += direction * SPEED * delta
	if global_position.x > 350: 	queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemies"):	queue_free()
