extends Node2D

var pattern = []
var indicatorPattern = []
var steps = 12
var currentSample:int
var currentIndicator:int
var samples:int
var indicators:int
var playingTexture = preload("res://IndicatorPlaying.png")
var offTexture = preload("res://IndicatorOff.png")
var onTexture = preload("res://IndicatorPressed.png")

var button0:int = -1
var button1:int = -1
var button2:int = -1
var button3:int = -1
var button4:int = -1
var button5:int = -1
var button6:int = -1
var button7:int = -1
var button8:int = -1
var button9:int = -1
var button10:int = -1
var button11:int = -1

@onready var b0:Node = $"../IndicatorButtons/Indicator"
@onready var b1:Node = $"../IndicatorButtons/Indicator2"
@onready var b2:Node = $"../IndicatorButtons/Indicator3"
@onready var b3:Node = $"../IndicatorButtons/Indicator4"
@onready var b4:Node = $"../IndicatorButtons/Indicator5"
@onready var b5:Node = $"../IndicatorButtons/Indicator6"
@onready var b6:Node = $"../IndicatorButtons/Indicator7"
@onready var b7:Node = $"../IndicatorButtons/Indicator8"
@onready var b8:Node = $"../IndicatorButtons/Indicator9"
@onready var b9:Node = $"../IndicatorButtons/Indicator10"
@onready var b10:Node = $"../IndicatorButtons/Indicator11"
@onready var b11:Node = $"../IndicatorButtons/Indicator12"

@export var sounds:Node
@export var timer:Timer
@export var indicatorButtons:Node

func _on_button0_down():
	if button0 == -1:
		button0 = 0
		b0.texture_normal = onTexture
	elif button0 == 0:
		button0 = -1
		b0.texture_normal = offTexture
func _on_button1_down():
	if button1 == -1:
		button1 = 1
		b1.texture_normal = onTexture
	elif button1 == 1:
		button1 = -1
		b1.texture_normal = offTexture
func _on_button2_down():
	if button2 == -1:
		button2 = 2
		b2.texture_normal = onTexture
	elif button2 == 2:
		button2 = -1
		b2.texture_normal = offTexture
func _on_button3_down():
	if button3 == -1:
		button3 = 3
		b3.texture_normal = onTexture
	elif button3 == 3:
		button3 = -1
		b3.texture_normal = offTexture
func _on_button4_down():
	if button4 == -1:
		button4 = 4
		b4.texture_normal = onTexture
	elif button4 == 4:
		button4 = -1
		b4.texture_normal = offTexture
func _on_button5_down():
	if button5 == -1:
		button5 = 5
		b5.texture_normal = onTexture
	elif button5 == 5:
		button5 = -1
		b5.texture_normal = offTexture
func _on_button6_down():
	if button6 == -1:
		button6 = 6
		b6.texture_normal = onTexture
	elif button6 == 6:
		button6 = -1
		b6.texture_normal = offTexture
func _on_button7_down():
	if button7 == -1:
		button7 = 7
		b7.texture_normal = onTexture
	elif button7 == 7:
		button7 = -1
		b7.texture_normal = offTexture
func _on_button8_down():
	if button8 == -1:
		button8 = 8
		b8.texture_normal = onTexture
	elif button8 == 8:
		button8 = -1
		b8.texture_normal = offTexture
func _on_button9_down():
	if button9 == -1:
		button9 = 9
		b9.texture_normal = onTexture
	elif button9 == 9:
		button9 = -1
		b9.texture_normal = offTexture
func _on_button10_down():
	if button10 == -1:
		button10 = 10
		b10.texture_normal = onTexture
	elif button10 == 10:
		button10 = -1
		b10.texture_normal = offTexture
func _on_button11_down():
	if button11 == -1:
		button11 = 11
		b11.texture_normal = onTexture
	elif button11 == 11:
		button11 = -1
		b11.texture_normal = offTexture

func _ready() -> void:
	samples = sounds.get_child_count()
	indicators = indicatorButtons.get_child_count()
	
	indicatorPattern.append(0)
	indicatorPattern.append(1)
	indicatorPattern.append(2)
	indicatorPattern.append(3)
	indicatorPattern.append(4)
	indicatorPattern.append(5)
	indicatorPattern.append(6)
	indicatorPattern.append(7)
	indicatorPattern.append(8)
	indicatorPattern.append(9)
	indicatorPattern.append(10)
	indicatorPattern.append(11)
	
	pass

func _on_timer_timeout() -> void:
	var sn = pattern[currentSample]
	var ip = indicatorPattern[currentIndicator]
	var i = indicatorButtons.get_child(ip)
	
	var ci = currentIndicator - 1
	var cI = indicatorButtons.get_child(ci)
	cI.set_visible(false)
	
	i.set_visible(true)
		
	if sn != -1:
		var s = sounds.get_child(sn)
		s.play()
	
	currentSample += 1
	currentIndicator += 1
	
	if currentSample == steps:
		currentSample = 0
		currentIndicator = 0
	pass

func _on_button_button_down() -> void:
	pattern.clear()
	pattern.append(button0)
	pattern.append(button1)
	pattern.append(button2)
	pattern.append(button3)
	pattern.append(button4)
	pattern.append(button5)
	pattern.append(button6)
	pattern.append(button7)
	pattern.append(button8)
	pattern.append(button9)
	pattern.append(button10)
	pattern.append(button11)
	
	print(pattern)
	if timer.is_stopped():
		timer.start()
		print("Timer started")
	elif !timer.is_stopped():
		timer.stop()
		currentSample = 0
		currentIndicator = 0
		print("Timer stopped")
	pass # Replace with function body.
