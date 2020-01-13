extends Sprite

var dragMouse = false
var lastMousePosition = Vector2(0,0)
var deletable = false
var scaler 

onready var nameLabel = $nameLabel

func _process(delta):
	
	if dragMouse and scaler != null:
		scaler.global_position = global_position + Vector2(30*scale.x,30*scale.y)/2
		global_position +=  get_global_mouse_position()-lastMousePosition
	if scaler != null:
		if scaler.objectToBeScaled != self:
			scaler = null
	lastMousePosition = get_global_mouse_position()

func _input(event):
	if deletable and event.is_action_pressed("delete"):
		scaler.visible = false
		queue_free()

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			dragMouse = true
			get_parent().get_node("Distance").global_position = global_position
			get_parent().get_node("Distance").visible = true
			scaler = get_parent().scaler
			scaler.global_position = global_position + Vector2(30*scale.x,30*scale.y)/2
			scaler.visible = true
			scaler.objectToBeScaled = self
		else: 
			dragMouse = false

func _on_Area2D_mouse_entered():
	deletable = true

func _on_Area2D_mouse_exited():
	deletable = false