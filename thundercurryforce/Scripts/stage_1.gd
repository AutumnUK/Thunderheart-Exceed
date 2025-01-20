extends Node2D
var frame = 0;
var second = 0;

var Enemy = preload("res://Scenes/enemy_1.tscn")
var Enemy2 = preload("res://Scenes/enemy_2.tscn")
var boss = preload("res://Scenes/boss.tscn")
var pause_menu_scene = preload("res://Scenes/pause_scene.tscn")
var Player 	= preload("res://Scenes/player.tscn")

@onready var score = $TextScore
@onready var timer = $TextTimer
@onready var lives = $TextLives
@onready var BossHP = $BossHP
var pause_menu
var time = 0;
var bosslives;

var text_stage1_pos = -100;
var text_scroll_speed = 0.5;
var forest_text_pos = 520;

func spawnPlayer():
	var player = Player.instantiate()
	player.global_position.x = 160;
	player.global_position.y = 120;
	add_child(player)

func spawnEnemy(x,y):
	var enem = Enemy.instantiate();
	enem.global_position.x = x;
	enem.global_position.y = y;
	add_child(enem);

func raiseBossHealthBar():
	if time < 30:
		BossHP.global_position.y -= 1;
		time += 1;

func spawnEnemy2(x,y):
	var enem2 = Enemy2.instantiate();
	enem2.global_position.x = x;
	enem2.global_position.y = y;
	add_child(enem2);
	
func spawnBoss(x,y):
	var boss1 = boss.instantiate();
	boss1.global_position.x = x;
	boss1.global_position.y = y;
	add_child(boss1);

func _ready() -> void:
	Global.setLives(3)
	spawnPlayer();
	BossHP.global_position.y += 30;
	pause_menu = pause_menu_scene.instantiate()
	add_child(pause_menu)
	pause_menu.visible = false
	bosslives = true;

func _process(delta: float) -> void:
	if $Music.playing == false: $Music.play()
	$"Stage 1 Text".set("position", Vector2(text_stage1_pos,82))
	$"Stage 1 Text Back".set("position", Vector2(text_stage1_pos + 3, 85))
	if text_stage1_pos < 111: text_stage1_pos += text_scroll_speed;
	
	$"Forest Text".set("position", Vector2(forest_text_pos,100))
	$"Forest Back".set("position", Vector2(forest_text_pos + 3,103))
	if forest_text_pos > 164: forest_text_pos -= text_scroll_speed;
	
	if text_scroll_speed >= 10:
		$"Stage 1 Text".modulate.a -= 0.1;
		$"Stage 1 Text Back".modulate.a -= 0.1;
		$"Forest Back".modulate.a -= 0.1;
		$"Forest Text".modulate.a -= 0.1;
		
	text_scroll_speed += 0.1
	if Input.is_action_just_pressed("Start"):
		if get_tree().paused == false:
			get_tree().paused = true
			pause_menu.visible = true
		else:
			get_tree().paused = false
			pause_menu.visible = false

	$BossHP.set("max_value",Global.bosshpmax)
	$BossHP.set("value",Global.bosshp)
	frame += 1;
	if frame >=  60 :	second += 1; 	frame  = 0;

	if second ==  4 && frame ==  0:	spawnEnemy(330, 50)
	if second ==  4 && frame == 30:	spawnEnemy(330, 50)	
	if second ==  5 && frame ==  0:	spawnEnemy(330, 50)
	if second ==  5 && frame == 30:	spawnEnemy(330, 50)	
	if second ==  6 && frame ==  0:	spawnEnemy(330, 50)		
	if second ==  6 && frame == 30: spawnEnemy(330, 50)
	
	if second ==  8 && frame ==  0:	spawnEnemy(330,190)
	if second ==  8 && frame == 30:	spawnEnemy(330,190)	
	if second ==  9 && frame ==  0:	spawnEnemy(330,190)
	if second ==  9 && frame == 30:	spawnEnemy(330,190)	
	if second == 10 && frame ==  0:	spawnEnemy(330,190)	
	if second == 10 && frame == 30: spawnEnemy(330,190)
	
	if second == 12 && frame ==  0: spawnEnemy(330,120)
	if second == 12 && frame == 30: spawnEnemy(330,120)	
	if second == 13 && frame ==  0:	spawnEnemy(330,120)
	if second == 13 && frame ==  0:	spawnEnemy(330,120)	
	if second == 14 && frame ==  0:	spawnEnemy(330,120)
	if second == 14 && frame ==  0:	spawnEnemy(330,120)	
	
	if second == 16 && frame ==  0:	spawnEnemy(330, 50)
	if second == 16 && frame == 30:	spawnEnemy(330, 70)	
	if second == 17 && frame ==  0:	spawnEnemy(330, 90)	
	if second == 17 && frame == 30:	spawnEnemy(330,110)
	if second == 18 && frame ==  0:	spawnEnemy(330,130)	
	if second == 18 && frame == 30:	spawnEnemy(330,150)	
	if second == 19 && frame ==  0:	spawnEnemy(330,170)	
	if second == 19 && frame == 30:	spawnEnemy(330,190)	
	

	
	if second == 22 && frame == 0: spawnEnemy2(360,120);
	
	if second == 28 && frame == 0:	spawnEnemy(330,50)
	if second == 29 && frame == 0:	spawnEnemy(330,50)	
	if second == 30 && frame == 0:	spawnEnemy(330,50)
	if second == 31 && frame == 0:	spawnEnemy(330,50)	
	if second == 32 && frame == 0:	spawnEnemy(330,50)	
	
	if second == 28 && frame == 0: spawnEnemy2(360,50);	
	
	if second == 35 && frame == 0:	spawnEnemy(330,190)
	if second == 36 && frame == 0:	spawnEnemy(330,180)	
	if second == 37 && frame == 0:	spawnEnemy(330,170)
	if second == 38 && frame == 0:	spawnEnemy(330,160)	
	if second == 39 && frame == 0:	spawnEnemy(330,150)	
	
	if second == 43 && frame == 0: spawnEnemy2(360,50);
	if second == 43 && frame == 0: spawnEnemy2(360,190);	
	
	if second == 55 && frame == 0: spawnBoss(360,120); 
	
	if second >= 55: raiseBossHealthBar();
	
	score.text = "SCORE: " 	+ str(Global.global_score)
	timer.text = "TIME: " 	+ str(second)
	lives.text = "LIVES: " 	+ str(Global.global_lives)
	
	if Global.bosshp == 0:	get_tree().change_scene_to_file("res://Scenes/monsof_logo.tscn")
