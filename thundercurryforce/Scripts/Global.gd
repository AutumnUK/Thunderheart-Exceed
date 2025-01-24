extends Node

var 	global_score
var 	global_lives
var 	bosshp
var		bosshpmax
var 	player_x
var 	player_y
var 	menu_font

var		sound_volume	: float		= -16.0
var		music_volume	: float		= -16.0

const	GAME_NAME		: String	= "Thunderheart Exceed"
const	FONT_MENU		: String	= "res://Misc/Orbitron-Regular.ttf"
	

func _ready():
	menu_font 			= FontFile.new()
	menu_font.font_data = load(FONT_MENU)
	global_score 		= 0

	bosshp 				= 100
	bosshpmax 			= 100
	
	displaySettings()
	
func displaySettings():
	DisplayServer.window_set_size(Vector2(640, 480))
	DisplayServer.window_set_title(GAME_NAME,0)
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Reset"): get_tree().change_scene_to_file("res://Scenes/MonsofLogo.tscn")
	
func increaseScore(score):	global_score += score;
func setLives(x):			global_lives = x;
func delay(seconds):		await get_tree().create_timer(seconds).timeout
func changeScene(scene):	get_tree().change_scene_to_file(scene)

	
