extends HSlider

var bus_index: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	value_changed.connect(_on_value_changed)
	pass # Replace with function body.

func _on_value_changed(value: float) -> void:
	var f:AudioEffectReverb = AudioServer.get_bus_effect(0, 1)
	f.set_wet(value)
