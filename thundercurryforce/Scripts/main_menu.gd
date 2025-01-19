extends Node2D

var 	selection		: int 			= 1
const 	SELECTED_COLOUR : Color 		= Color (1.0,1.0,1.0,1.0)
const 	DEFAULT_COLOUR	: Color 		= Color (0.3,0.3,0.3,1.0)
const	STAGE1 			: String		= "res://Scenes/stage_1.tscn"
const	OPTIONS			: String		= "res://Scenes/options_menu.tscn"

func _process(_delta: float) -> void:
	defaultColours();	# Resets menu items back to grey when not selected.
	
	match selection :
		1 :	textColour($"Start Game"	,SELECTED_COLOUR);	if Input.is_action_just_pressed("A"): Global.changeScene(STAGE1)
		2 :	textColour($"High Scores"	,SELECTED_COLOUR);	if Input.is_action_just_pressed("A"): pass
		3 :	textColour($"Options"		,SELECTED_COLOUR);	if Input.is_action_just_pressed("A"): Global.changeScene(OPTIONS)
		4 :	textColour($"Quit"			,SELECTED_COLOUR);	if Input.is_action_just_pressed("A"): get_tree().quit()

	if Input.is_action_just_pressed("Up"):  	selection -= 1	
	if Input.is_action_just_pressed("Down"):  	selection += 1

	if selection == 0: selection = 4
	if selection == 5: selection = 1

### FUNCTIONS -- IGNORE ###
# Changes the target RichTextLabel's default colour.
func textColour(target_node : RichTextLabel , target_colour : Color)  -> void:
	target_node.set("theme_override_colors/default_color",target_colour)

# Sets the default (gray) colours.
func defaultColours() -> void:
	textColour($"Start Game"	, DEFAULT_COLOUR)
	textColour($"High Scores"	, DEFAULT_COLOUR)
	textColour($"Options"		, DEFAULT_COLOUR)
	textColour($"Quit"			, DEFAULT_COLOUR)	
