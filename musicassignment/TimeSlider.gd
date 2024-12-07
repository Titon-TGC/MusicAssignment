extends HSlider

func _ready() -> void:
	value_changed.connect(_on_value_changed)
	pass # Replace with function body.

func _on_value_changed(value: float) -> void:
	$"../../Looper/Timer".wait_time = remap(value, 0, 1, 1, 0.01)
	print($"../../Looper/Timer".wait_time)
