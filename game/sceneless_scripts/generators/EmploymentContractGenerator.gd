extends Node

class_name EmploymentContractGenerator


var _random_number_generator: RandomNumberGenerator
var _hero_generator: HeroGenerator


func ready():
	pass


func _init(new_random_number_generator: RandomNumberGenerator):
	_random_number_generator = new_random_number_generator
	_hero_generator = HeroGenerator.new(_random_number_generator)


func generate_contract(player_popularity_score:float) -> EmploymentContract:
	var generated_employment_contract: EmploymentContract = EmploymentContract.new()
	var generated_hero: Hero = _hero_generator.generate_hero(player_popularity_score)
	generated_employment_contract.hero = generated_hero
	#generated_employment_contract.days_remaining = generate_contract_length()
	#generated_employment_contract.cost_per_day = generate_cost_per_day(player_popularity_score)
	return generated_employment_contract


func generate_contract_length() -> int:
	var length = _random_number_generator.randi_range(10, 60)
	return length


func generate_cost_per_day(player_popularity_score) -> int:
	var cost = _random_number_generator.randi_range(300, 2000)
	cost = cost - (cost % 100)
	return cost
