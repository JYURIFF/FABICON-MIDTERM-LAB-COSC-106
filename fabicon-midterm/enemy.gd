extends RigidBody2D
func _ready():
	var enemy_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(enemy_types[randi()% enemy_types.size()])


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
