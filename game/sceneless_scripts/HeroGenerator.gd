extends Node


class_name HeroGenerator


var randomNumberGenerator: RandomNumberGenerator


func ready():
	var random_number_generator = RandomNumberGenerator.new()
	random_number_generator.randomize()

func generate_hero() -> Hero:
	var new_hero = Hero.new()
	return new_hero
