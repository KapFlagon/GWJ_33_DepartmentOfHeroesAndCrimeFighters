tool
extends HBoxContainer


export var _value_name: String setget set_value_name, get_value_name
export var _value_data: int setget set_value_data, get_value_data
export var _change_size_value: int setget set_change_size_value, get_change_size_value
var _add_btn_held: bool
var _minus_btn_held: bool
var _value_change_timer: Timer
var _delta_passed: float


signal value_data_changed(latest_value)


func _ready():
	get_node("ValueNameLbl").text = _value_name
	get_node("ValueDataLbl").text = str(_value_data)
	_value_change_timer = Timer.new()
	_value_change_timer.one_shot = true

func _init():
	_add_btn_held = false
	_minus_btn_held = false
	_delta_passed = 0


func _process(delta):
	if Engine.editor_hint: 
		get_node("ValueNameLbl").text = _value_name
	else: 
		_delta_passed += delta
		if _delta_passed > 0.25:
			if _add_btn_held:
				increase_value_data()
				print("value: " + str(_value_data))
			if _minus_btn_held:
				decrease_value_data()
			_delta_passed = 0


func _on_AddBtn_button_down():
	_add_btn_held = true

func _on_AddBtn_button_up():
	_add_btn_held = false


func _on_MinusBtn_button_down():
	_minus_btn_held = true

func _on_MinusBtn_button_up():
	_minus_btn_held = false


func increase_value_data():
	var new_value = _value_data + _change_size_value
	set_value_data(new_value)
	emit_signal("value_data_changed", _value_data)


func decrease_value_data():
	var new_value = _value_data - _change_size_value
	if new_value >= 0:
		set_value_data(new_value)
		emit_signal("value_data_changed", _value_data)
	else:
		new_value = 0


# Setters and Getters
func set_value_name(new_value_name: String) -> void:
	_value_name = new_value_name
	#get_node("ValueNameLbl").text = _value_name
func get_value_name() -> String:
	return _value_name
	
func set_value_data(new_value_data: int) -> void:
	_value_data = new_value_data
	get_node("ValueDataLbl").text = str(_value_data)
func get_value_data() -> int:
	return _value_data
	
func set_change_size_value(new_change_size_value: int) -> void:
	_change_size_value = new_change_size_value
func get_change_size_value() -> int:
	return _change_size_value
