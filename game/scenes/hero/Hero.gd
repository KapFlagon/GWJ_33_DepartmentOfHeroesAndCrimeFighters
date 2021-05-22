extends Node2D


class_name Hero


var _name: String setget set_name, get_name
var _power_score: float setget set_power_score, get_power_score
var _popularity_score: float setget set_popularity_score, get_popularity_score


# Called when the node enters the scene tree for the first time.
func _ready():
	_name = "name"
	_power_score = 0
	_popularity_score = 0


# Setters and Getters
func set_name(new_name: String) -> void:
	_name = new_name
func get_name() -> String:
	return _name

func set_power_score(new_power_score: float) -> void:
	_power_score = new_power_score
func get_power_score() -> float:
	return _power_score

func set_popularity_score(new_popularity_score: float) -> void:
	_popularity_score = new_popularity_score
func get_popularity_score() -> float:
	return _popularity_score
