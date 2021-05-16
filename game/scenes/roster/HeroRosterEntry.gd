extends PanelContainer

var _dragging: bool
var _original_position 
var hero: Hero

signal assign_btn_pressed
signal fire_btn_pressed


# Called when the node enters the scene tree for the first time.
func _ready():
	_original_position = self.get_position_in_parent()
	_dragging = false
	pass # Replace with function body.


func set_hero(new_hero: Hero) -> void:
	get_node("GridContainer/NameData").text = new_hero.get_firstname() + " " + new_hero.get_lastname()
	get_node("GridContainer/AliasData").text = new_hero.get_alias()
	get_node("GridContainer/PowerRankData").text = new_hero.get_power_score()
	get_node("GridContainer/EnergyData").text = new_hero.get_energy_level()
	get_node("GridContainer/ActivityData") #?
	get_node("GridContainer/PopularityData").text = new_hero.get_popularity_score()
	get_node("GridContainer/ContractRemainingData").text #?
	get_node("GridContainer/CostData").text #? 


func _on_AssingBtn_pressed():
	emit_signal("assign_btn_pressed")


func _on_FireBtn_pressed():
	emit_signal("fire_btn_pressed")


func _on_HeroRosterEntry_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed:
			_dragging = true
			_original_position = event.get_global_position()
		else: 
			_dragging = false
	if event is InputEventMouseMotion and _dragging:
		_original_position += event.relative
		self.set_global_position(_original_position)
