extends Node2D

onready var HUD = get_node("/root/Game/HUD")

export var points = 10
onready var Enemy = load("res://Enemy/Enemy.tscn")
export var spawn_probablity = 0.3
export var max_count = 8
onready var w = int(get_viewport_rect().size.x)

func _ready():
	randomize()


func _on_Timer_timeout():
	if randf() < spawn_probablity and get_child_count() < max_count + 1:
		var enemy = Enemy.instance()
		enemy.position = Vector2(randi()% w, -20)
		get_node("/root/Game/Enemies").add_child(enemy)

func die():
	HUD.update_score += 10


