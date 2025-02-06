extends Node2D

@onready var fade_rect : Node =  $"fade_rect"
var fade_frame : int = 0
var opacity : float = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fade_rect.modulate.a = opacity


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	fade_rect.modulate.a = opacity
	if fade_frame <= 100 :	opacity -= 0.01
		
	fade_frame += 1

	if fade_frame >= 300 : opacity += 0.01
	
	if fade_frame == 400: Global.changeScene("res://Scenes/title_screen.tscn")
