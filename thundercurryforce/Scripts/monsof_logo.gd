extends Node2D

const	FADETIME 	: float		= 0.016
const	NEXTSCENE	: String	= "res://Scenes/title_screen.tscn"

var 	col			: float 	= 1.0
var 	fade		: float 	= 1.0
var		frame		: int		= 0

func _process(_delta) -> void:
	frame += 1
	$FadeRect.set("color",Color(col,col,col,1))								# Set the background colour.
	$monsof_logo_sprite.modulate.a 			= fade							# Set the logo opacity.
	
	if 	 frame  > 120 && frame < 180: col  -= FADETIME						# Darken background.
	elif frame  > 240 && frame < 340: fade -= FADETIME  					# Fade logo.
	elif frame == 420 :	Global.changeScene(NEXTSCENE)						# Go to the titlescreen.
	
	if Input.is_action_just_pressed("A") : Global.changeScene(NEXTSCENE) 	# Press Z to go to the next scene.
