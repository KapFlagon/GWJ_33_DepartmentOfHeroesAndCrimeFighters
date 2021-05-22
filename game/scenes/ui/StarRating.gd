extends TextureProgress


var _rating : float setget set_rating, get_rating


# Called when the node enters the scene tree for the first time.
func _ready():
	value = _rating
	pass # Replace with function body.

func _init():
	_rating = 0


func set_rating(new_rating : float) -> void:
	_rating = new_rating
	value = _rating
	
func get_rating() -> float:
	return _rating
