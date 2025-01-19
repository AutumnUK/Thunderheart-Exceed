extends Node2D

var 	col			: float 	= 1.0
var 	fade		: float 	= 1.0
var		frame		: int		= 0

const	FADETIME 	: float		= 0.016
const	NEXTSCENE	: String	= "res://Scenes/title_screen.tscn"

func _process(_delta):
	$ColorRect.set("color",Color(col,col,col,1))		# Set the background colour.
	$Monsof.modulate.a = fade;							# Set the logo opacity.
	
	if 	 frame  >  60 && frame < 140: col  -= FADETIME	# Darken background.
	elif frame  > 200 && frame < 300: fade -= FADETIME  # Fade logo.
	elif frame == 360 :	Global.changeScene(NEXTSCENE)	# Go to the titlescreen.

	frame += 1;
