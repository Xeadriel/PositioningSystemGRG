extends Sprite

var dragMouse = false
var lastMousePosition
var objectToBeScaled = null

func _ready():
	pass # Replace with function body.

func _process(delta):
	if dragMouse:
		objectToBeScaled.scale.x  = (global_position.x - objectToBeScaled.global_position.x)/(50*scale.x)
		objectToBeScaled.scale.y  = (global_position.y - objectToBeScaled.global_position.y)/(50*scale.y)
		global_position +=  get_global_mouse_position()-lastMousePosition
	lastMousePosition = get_global_mouse_position()



func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			dragMouse = true
		else: 
			dragMouse = false
