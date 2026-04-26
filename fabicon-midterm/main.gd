extends Node

@export var enemy_scene: PackedScene
var score 
func _ready():
	new_game()
func game_over():
	$scoretimer.stop()
	$enemytimer.stop()
	$hud.show_game_over()
	$music.stop()
	$death.play()
func new_game():
	get_tree().call_group("enemy","queue_free")
	score=0
	$Player.start($startposition.position)
	$starttimer.start()
	$hud.update_score(score)
	$hud.show_message("getready")
	$music.play()
func _on_scoretimer_timeout():
	score +=1
	$hud.update_score(score)

func _on_starttimer_timeout():
	$enemytimer.start()
	$scoretimer.start()

func _on_enemytimer_timeout():
	var enemy = enemy_scene.instantiate()
	var enemy_spawn_location=$enemypath/enemyspawnlocation
	enemy_spawn_location.progress_ratio=randf()
	
	var direction=enemy_spawn_location.rotation + PI/2
	
	enemy.global_position = enemy_spawn_location.position
	direction += randf_range(-PI/4, PI /4)
	enemy.rotation=direction
	var velocity = Vector2(randf_range(150.0,250),00)
	enemy.linear_velocity=velocity.rotated(direction)
	add_child(enemy)
	
	
