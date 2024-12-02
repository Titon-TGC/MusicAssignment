extends Sprite2D

@export var keybind = "a"
@export var sound: Node



func _process(delta: float) -> void:
	if Input.is_action_just_pressed(keybind):
		sound.play()
		self.modulate = Color.RED
	
	if Input.is_action_just_released(keybind):
		self.modulate = Color.WHITE
