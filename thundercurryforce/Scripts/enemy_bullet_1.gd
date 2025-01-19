extends Area2D

var speed
var duration
var target_angle
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("danger")
	duration = 8
	speed = 150
	# aim_at_player();
	
func aim_at_player() -> void:
	# Calculate the direction vector from this object to the player's position
	var direction_to_player = Vector2(Global.player_x - global_position.x, Global.player_y - global_position.y)
	
	# Get the angle in radians using atan2, which gives you the correct quadrant
	target_angle = atan2(direction_to_player.y, direction_to_player.x)
	
	# Set the rotation to face the player; note we add PI to fire in the opposite direction
	rotation = target_angle + PI

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Adjust speed based on duration
	
	if duration > 8:
		speed = max(speed - 1, 80)

	# Move the object based on its rotation
	var direction = Vector2(cos(rotation), sin(rotation)) * -1
	global_position += direction * speed * delta

	duration += delta

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		queue_free()
