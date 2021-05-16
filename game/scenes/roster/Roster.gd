extends Node2D


var hero_list
var _roster_displayed: bool setget set_roster_displayed, is_roster_displayed

signal _roster_display_changed

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("_roster_display_changed", self, "update_roster_state")
	set_roster_displayed(false)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HeroRosterEntry_assign_btn_pressed():
	print("assigning first")


func _on_HeroRosterEntry_fire_btn_pressed():
	print("firing first")


func _on_HeroRosterEntry2_assign_btn_pressed():
	print("assigning second")


func _on_HeroRosterEntry2_fire_btn_pressed():
	print("firing second")


func _on_ToggleRosterBtn_toggled(button_pressed):
	if is_roster_displayed():
		if button_pressed:
			pass
		elif !button_pressed: 
			set_roster_displayed(false)
	elif !is_roster_displayed():
		if button_pressed:
			set_roster_displayed(true)
		elif !button_pressed:
			pass


func set_roster_displayed(new_roster_displayed: bool) -> void:
	_roster_displayed = new_roster_displayed
	emit_signal("_roster_display_changed")

func is_roster_displayed() -> bool:
	return _roster_displayed

func update_roster_state() -> void:
	if is_roster_displayed():
		get_node("ScrollArea").visible = false
		get_node("ToggleRosterBtn").text = "Show roster"
	else:
		get_node("ScrollArea").visible = true
		get_node("ToggleRosterBtn").text = "Hide roster"
