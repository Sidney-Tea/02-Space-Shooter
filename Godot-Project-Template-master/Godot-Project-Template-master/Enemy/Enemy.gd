extends KinematicBody2D

onready var HUD = get_node("/root/Game/HUD")
export var points = 10
export var move_probability = 0.3
export var shoot_probability = 0.3
export var speed = 2.0
onready var w = int(get_viewport_rect().size.x)
onready var h = int(get_viewport_rect().size.y)

onready var BulletE = load("res://BulletE/BulletE.tscn")

func _ready():
	randomize()


func move():
	var new_position = Vector2(randi() % w, randi() % h)
	$Tween.interpolate_property(self,"position", position, new_position, speed, Tween.TRANS_EXPO, Tween.EASE_IN_OUT)
	$Tween.start()
	position = new_position 


func shoot():
	var bullet = BulletE.instance()
	bullet.position = position + Vector2(0,10)
	get_node("/root/Game/Bullets(E)").add_child(bullet)

func _on_Move_timeout():
	if randf() < move_probability:
		move()


func _on_Shoot_timeout():
	if randf() < shoot_probability:
		shoot()
		
func die():
	HUD.update_score(points)
