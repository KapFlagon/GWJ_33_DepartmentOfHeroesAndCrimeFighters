extends Node


class_name HeroGenerator


var _random_number_generator: RandomNumberGenerator


func ready():
	pass


func _init(new_random_number_generator: RandomNumberGenerator):
	_random_number_generator = new_random_number_generator


func generate_hero(player_popularity_score:float) -> Hero:
	var new_hero = Hero.new()
	new_hero.set_name(random_name())
	new_hero.set_power_score(random_power_rank(player_popularity_score))
	new_hero.set_popularity_score(random_popularity_score(player_popularity_score))
	return new_hero


func random_name() -> String:
	var random_num
	var the = ""
	var adjective = "" 
	var noun = ""
	
	random_num = _random_number_generator.randi_range(1, 2)
	match random_num:
		1: 
			the = ""
		2: 
			the = "The "
	
	random_num = _random_number_generator.randi_range(0, 10)
	match random_num:
		0:
			adjective = ""
		1:
			adjective = "High "
		2:
			adjective = "Fearless "
		3:
			adjective = "Smokey "
		4:
			adjective = "Backflipping "
		5:
			adjective = "Crimson "
		6: 
			adjective = "Magnificent "
		7:
			adjective = "Otherworldly "
		8:
			adjective = "Gassy "
		9:
			adjective = "Upset "
		10:
			adjective = "Nasty "
			
	random_num = _random_number_generator.randi_range(1, 10)
	match random_num:
		1:
			noun = "Hammer"
		2:
			noun = "Shark"
		3:
			noun = "Tempest"
		4:
			noun = "Hurricane"
		5:
			noun = "Nail"
		6: 
			noun = "Zephyr"
		7:
			noun = "Shockwave"
		8:
			noun = "Raptor"
		9:
			noun = "Clown"
		10:
			noun = "Season"
	
	var output = the + adjective + noun
	return output


func random_power_rank(player_popularity_score:float) -> float:
	var power = random_based_on_player_popularity(player_popularity_score)
	power = stepify(power, 0.01)
	return power


func random_popularity_score(player_popularity_score:float) -> float:
	var popularity = random_based_on_player_popularity(player_popularity_score)
	popularity = stepify(popularity, 0.01)
	return popularity


func random_based_on_player_popularity(player_popularity_score:float) -> float:
	var output = _random_number_generator.randf_range((player_popularity_score-0.2), (player_popularity_score+0.2))
	output = clamp(output, 0.1, 1.0)
	return output
