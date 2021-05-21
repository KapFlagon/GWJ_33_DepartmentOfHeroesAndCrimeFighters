tool
extends HBoxContainer


export var _value_name: String setget set_value_name, get_value_name
export var _value_data: int setget set_value_data, get_value_data
export var _change_size_value: int setget set_change_size_value, get_change_size_value


signal value_data_changed(latest_value)


func _ready():
	get_node("ValueNameLbl").text = _value_name
	get_node("ValueDataLbl").text = str(_value_data)


func _process(delta):
	if Engine.editor_hint: 
		get_node("ValueNameLbl").text = _value_name	
	pass


func _on_MinusBtn_button_up():
	var new_value = _value_data - _change_size_value
	set_value_data(new_value)
	emit_signal("value_data_changed", _value_data)


func _on_AddBtn_button_up():
	var new_value = _value_data + _change_size_value
	set_value_data(new_value)
	emit_signal("value_data_changed", _value_data)


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
