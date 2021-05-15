extends Node2D


class_name Hero


var _firstname: String setget set_firstname, get_firstname
var _lastname: String setget set_lastname, get_lastname
var _alias: String setget set_alias, get_alias
var _xp: float setget set_xp, get_xp
var _power_score: float setget set_power_score, get_power_score
var _charisma_score: float setget set_charisma_score, get_charisma_score
var _social_presence_score: float setget set_social_presence_score, get_social_presence_score
var _ideal_contract_length 
var _base_contract_cost


# Called when the node enters the scene tree for the first time.
func _ready():
	_firstname = "firstname"
	_lastname = "lastname"
	_alias = "alias"
	_xp = 0
	_power_score = 0
	_charisma_score = 0
	_social_presence_score = 0


# Setters and Getters
func set_firstname(new_firstname: String) -> void:
	_firstname = new_firstname
func get_firstname() -> String:
	return _firstname

func set_lastname(new_lastname: String) -> void:
	_lastname = new_lastname
func get_lastname() -> String:
	return _lastname

func set_alias(new_alias: String) -> void:
	_alias = new_alias
func get_alias() -> String:
	return _alias

func set_xp(new_xp: float) -> void:
	_xp = new_xp
func get_xp() -> float:
	return _xp

func set_power_score(new_power_score: float) -> void:
	_power_score = new_power_score
func get_power_score() -> float:
	return _power_score

func set_charisma_score(new_charisma_score: float) -> void:
	_charisma_score = new_charisma_score
func get_charisma_score() -> float:
	return _charisma_score

func set_social_presence_score(new_social_presence_score: float) -> void:
	_social_presence_score = new_social_presence_score
func get_social_presence_score() -> float:
	return _social_presence_score
