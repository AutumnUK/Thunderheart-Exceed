extends Node2D

var 	selection		: int 			= 1
var 	sound_bus 		: int			= AudioServer.get_bus_index("Effects")
var		music_bus 		: int			= AudioServer.get_bus_index("Music")

const 	SELECTED_COLOUR : Color 		= Color (1.0,1.0,1.0,1.0)
const 	DEFAULT_COLOUR	: Color 		= Color (0.3,0.3,0.3,1.0)
const	MENU 			: String		= "res://Scenes/main_menu.tscn"
const	OPTIONS			: String		= "res://Scenes/options_menu.tscn"

func _create():
	$"Sound Bar".set("min_value", -80.0)
	$"Sound Bar".set("max_value",   6.0)
	
	$"Music Bar".set("min_value", -80.0)
	$"Music Bar".set("max_value",   6.0)	

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("B"): 
		if $Music.playing == true: $Music.stop()
		Global.changeScene(MENU)
	
	defaultColours()
	match selection :
		## Add a resolution selector.
		1 :	# Fullscreen Selector
			textColour($"Fullscreen"	,SELECTED_COLOUR)
			if Input.is_action_just_pressed("A"):
				if 		DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN	: DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
				elif 	DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED	: DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			if $Music.playing == true: $Music.stop()
		
		## Add a music clip that plays for reference when adjusting volume.	
		2 :	# Sound Effect Volume Control
			textColour($"Sound Volume"	,SELECTED_COLOUR)	
			if Input.is_action_just_pressed("Left"):	Global.sound_volume -= 8.0; $ShootingSound.play()
			if Input.is_action_just_pressed("Right"):	Global.sound_volume += 8.0; $ShootingSound.play()
			if $Music.playing == true: $Music.stop()	

		## Add a sound that plays when you adjust volume.
		3 :	# Music Voume
			textColour($"Music Volume",SELECTED_COLOUR)
			if $Music.playing == false: $Music.play()
			if Input.is_action_just_pressed("Left"):	Global.music_volume -= 8.0;
			if Input.is_action_just_pressed("Right"):	Global.music_volume += 8.0
			
		4 :	# Exit the menu
			textColour($"Back"			,SELECTED_COLOUR)
			if Input.is_action_just_pressed("A"): Global.changeScene(MENU)
			if $Music.playing == true: $Music.stop()
			
	AudioServer.set_bus_volume_db(sound_bus, Global.sound_volume)
	$"Sound Bar".set("value",AudioServer.get_bus_volume_db(sound_bus))	
	
	AudioServer.set_bus_volume_db(music_bus, Global.music_volume)
	$"Music Bar".set("value",AudioServer.get_bus_volume_db(music_bus))
	if Input.is_action_just_pressed("Up"):  	selection -= 1	
	if Input.is_action_just_pressed("Down"):  	selection += 1

	if selection == 0: selection = 4
	if selection == 5: selection = 1

func textColour(target_node : RichTextLabel , target_colour : Color)  -> void:	
	target_node.set("theme_override_colors/default_color",target_colour)

func defaultColours() -> void:
	textColour($"Fullscreen"	, DEFAULT_COLOUR)
	textColour($"Sound Volume"	, DEFAULT_COLOUR)
	textColour($"Music Volume"	, DEFAULT_COLOUR)
	textColour($"Back"			, DEFAULT_COLOUR)	
