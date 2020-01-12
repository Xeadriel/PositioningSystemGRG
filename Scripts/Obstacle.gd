extends Sprite

var dragMouse = false
var lastMousePosition = Vector2(0,0)
var deletable = false

onready var nameLabel = $nameLabel

func _process(delta):
	lastMousePosition = get_global_mouse_position()
	if dragMouse:
		global_position =  get_global_mouse_position()

func _input(event):
	if deletable and event.is_action_pressed("delete"):
		queue_free()

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			dragMouse = true
			get_parent().get_node("Distance").global_position = global_position
			get_parent().get_node("Distance").visible = true
		else: 
			dragMouse = false

func _on_Area2D_mouse_entered():
	deletable = true

func _on_Area2D_mouse_exited():
	deletable = false