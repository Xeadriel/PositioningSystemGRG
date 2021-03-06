extends Node2D

onready var nameInput =  $LineEdit
onready var friendly = preload("res://Objects/Unit.tscn")
onready var enemy = preload("res://Objects/EnemyUnit.tscn")
onready var obstacle = preload("res://Objects/Obstacle.tscn")
onready var distanceCircle = $Distance
onready var scaler = $Scaler
var zindex = 5 

func _process(delta):
	pass

func _unhandled_input(event):
	if event is InputEventMouseButton and event.is_pressed():
		distanceCircle.visible = false

func _on_CreateUnit_button_up():
	var newFriendly = friendly.instance()
	add_child(newFriendly)
	newFriendly.global_position = Vector2(200, 200)
	newFriendly.z_index = zindex
	zindex+=1
	newFriendly.nameLabel.set_text(nameInput.text)
	nameInput.text = ""

func _on_CreateEnemy_button_up():
	var newEnemy = enemy.instance()
	add_child(newEnemy)
	newEnemy.global_position = Vector2(200, 200)
	newEnemy.z_index = zindex
	zindex+=1
	newEnemy.nameLabel.set_text(nameInput.text)
	nameInput.text = ""

func _on_CreateObstacle_button_up():
	var newObstacle = obstacle.instance()
	add_child(newObstacle)
	newObstacle.global_position = Vector2(200, 200)
	newObstacle.nameLabel.set_text(nameInput.text)
	newObstacle.z_index = zindex
	zindex+=1
	nameInput.text = ""


func _on_SelectGrass_button_down():
	$Grass.visible = true
	$Stone.visible = false
	$Sand.visible = false


func _on_SelectStone_button_down():
	$Grass.visible = false
	$Stone.visible = true
	$Sand.visible = false


func _on_SelectSand_button_down():
	$Grass.visible = false
	$Stone.visible = false
	$Sand.visible = true
