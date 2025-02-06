extends Node2D

var selected_node 	: RichTextLabel
var selection		: int 	= 0
var col_fade		: Color = Color(0.4,0.4,0.4,0.4)
var col_white		: Color = Color(0.4,0.4,0.4,1)
var fade_progress	: float = 0.00
var fade_direction	: int	= 1


@onready 	var text_paused	: RichTextLabel	= $Paused
@onready	var text_resume	: RichTextLabel	= $Resume
@onready 	var text_quit	: RichTextLabel	= $Quit
@onready 	var text_yes	: RichTextLabel	= $Yes
@onready 	var text_no		: RichTextLabel	= $No

func _process(_delta: float) -> void:
	match selection :
		0 : selected_node = text_resume
		1 : selected_node = text_quit 
		2 : selected_node = text_yes
		3 : selected_node = text_no
		
	if selected_node != text_resume : text_resume.set(	"theme_override_colors/default_color" , col_white)
	if selected_node != text_quit 	: text_quit.set(	"theme_override_colors/default_color" , col_white)
	
	selected_node.set("theme_override_colors/default_color",col_fade)

	if Input.is_action_just_released("Down") : 	selection += 1
	if Input.is_action_just_released("Up"): 	selection -= 1
	
	if selection < 0 : selection = 1
	if selection > 1 : selection = 0
	
	if fade_direction 	== 1 	: fade_progress  += 0.01
	if fade_progress 	>= 1.0 	: fade_direction = 	0
	if fade_progress 	<= 0.4 	: fade_direction = 	1
	if fade_direction 	== 0 	: fade_progress  -= 0.01
	
	col_fade = Color(fade_progress,fade_progress,fade_progress,1)
	
	if selection == 0 && Input.is_action_just_pressed("A") :
		get_tree().paused 	= false
		self.visible 		= false
	
	if selection == 1 && Input.is_action_just_pressed("A") :
		get_tree().paused 	= false
		self.visible 		= false
		Global.changeScene("res://Scenes/main_menu.tscn")
