extends Node2D
	
var 	breathing			: float = 0.5
var 	breathing_direction : int = 1
var 	press_z_opacity		: float = 1.0

const 	BREATHING_SPEED		: float 	= 0.005
const	FADE_SPEED			: float		= 0.016
const	NEXTSCENE			: String	= "res://Scenes/main_menu.tscn"
const 	SHADOW_COLOR		: Color		= Color( 0 , 0 , 0 , 1 )

func _ready() -> void:
	create_text_menu("Press Z", 114, 180)
	for i in 60:
		await get_tree().create_timer(0.01).timeout
		$FadeOut.modulate.a -= 0.016

func _process(_delta: float) -> void:		
	$"Press Z".set("theme_override_colors/default_color",Color(breathing,breathing,breathing,press_z_opacity))
	if breathing_direction == 1 : breathing += BREATHING_SPEED
	if breathing_direction == 0 : breathing -= BREATHING_SPEED
	if breathing >= 0.8 : breathing_direction = 0
	if breathing <= 0.5 : breathing_direction = 1
	
	if Input.is_action_just_pressed("A"):	Global.changeScene(NEXTSCENE)

### FUNCTIONS -- IGNORE ###
func create_text_menu(label_name : String, x_pos : int, y_pos) -> void:
	var text = RichTextLabel.new()
	text.set("name",label_name)
	text.set("text",label_name)
	text.set("z_index", 3)
	text.set("size",Vector2i(300,200))
	text.add_theme_font_override("normal_font",Global.menu_font)
	text.set("theme_override_colors/font_shadow_color", SHADOW_COLOR)
	text.global_position = Vector2(x_pos, y_pos)
	add_child(text)

	
