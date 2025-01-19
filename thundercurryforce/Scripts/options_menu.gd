extends Node2D

var 	selection		: int 			= 1
const 	SELECTED_COLOUR : Color 		= Color (1.0,1.0,1.0,1.0)
const 	DEFAULT_COLOUR	: Color 		= Color (0.3,0.3,0.3,1.0)
const	MENU 			: String		= "res://Scenes/main_menu.tscn"
const	OPTIONS			: String		= "res://Scenes/options_menu.tscn"

func _process(_delta: float) -> void:
	defaultColours();	# Resets menu items back to grey when not selected.
	match selection :
		1 :	
			textColour($"Fullscreen"	,SELECTED_COLOUR)
			if Input.is_action_just_pressed("A"):
				if 		DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN	: DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
				elif 	DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED	: DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			
		2 :	textColour($"Sound Volume"	,SELECTED_COLOUR);	if Input.is_action_just_pressed("A"): pass
		3 :	textColour($"Music Volume"	,SELECTED_COLOUR);	if Input.is_action_just_pressed("A"): pass
		4 :	textColour($"Back"			,SELECTED_COLOUR);	if Input.is_action_just_pressed("A"): Global.changeScene(MENU)

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
	textColour($"Fullscreen"	, DEFAULT_COLOUR)
	textColour($"Sound Volume"	, DEFAULT_COLOUR)
	textColour($"Music Volume"	, DEFAULT_COLOUR)
	textColour($"Back"			, DEFAULT_COLOUR)	
