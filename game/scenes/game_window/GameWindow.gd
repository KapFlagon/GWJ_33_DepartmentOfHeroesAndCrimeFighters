extends Node2D


var current_day setget set_current_day
var player_popularity_score setget set_player_popularity_score
var current_cash setget set_current_cash
var daily_income setget set_daily_income 
var daily_expenses setget set_daily_expenses

var employment_contract_list = []
var ongoing_crime_list = []
var corporate_event_list = []
var movie_tv_list = []
var disaster_list = []

var employment_contract_generator:EmploymentContractGenerator
var crime_generator
var corporate_event_generator
var movie_tv_generator
var disaster_generator

var random_number_generator: RandomNumberGenerator

onready var employment_negotiation_scene = load("res://game/scenes/negotiation/EmploymentNegotiation.tscn")

func _ready():
	get_node("StatusBar/BaseHbox/PublicOpinionHbox/PlayerStarRating").set_rating(player_popularity_score)
	get_node("StatusBar/BaseHbox/MoneyHbox2/CashData").text = str(current_cash)
	get_node("StatusBar/BaseHbox/IncomeHbox/CashData").text = str(daily_income)
	get_node("StatusBar/BaseHbox/ExpensesHbox/CashData").text = str(daily_expenses)
	pass


func _init():
	random_number_generator = RandomNumberGenerator.new()
	random_number_generator.randomize()
	current_cash = 10000
	daily_income = 0
	daily_expenses = 0
	player_popularity_score = 0.4
	employment_contract_generator = EmploymentContractGenerator.new(random_number_generator)



func _on_NextThingBtn_button_up():
	var random_chance = random_number_generator.randi_range(1,4)
	random_chance = 1
	match random_chance:
		1:
			var employ_contract = employment_contract_generator.generate_contract(player_popularity_score)
			var employment_negotiation = employment_negotiation_scene.instance()
			employment_negotiation.random_number_generator = random_number_generator
			employment_negotiation.set_proposed_employment_contract(employ_contract)
			employment_negotiation.connect("contract_accepted", self, "contract_accepted")
			add_child(employment_negotiation)
			
			
		2: 
			# generate contract
			pass
		3:
			# generate contract
			pass
		4: # generate contract
			pass


func contract_accepted(new_employment_contract : EmploymentContract) -> void:
	employment_contract_list.append(new_employment_contract)
	var new_expenses = daily_expenses + new_employment_contract.cost_per_day
	set_daily_expenses(new_expenses)


# Setters & Getters
func set_current_day(new_current_day : int) -> void:
	current_day = new_current_day
	get_node("StatusBar/BaseHbox/DaysHbox/DayData").text = str(current_day)

func set_player_popularity_score(new_popularity_score : float) -> void:
	player_popularity_score = new_popularity_score
	get_node("StatusBar/BaseHbox/PublicOpinionHbox/PlayerStarRating").set_rating(player_popularity_score)

func set_current_cash(new_current_cash : int) -> void:
	current_cash = new_current_cash
	get_node("StatusBar/BaseHbox/MoneyHbox2/CashData").text = str(current_cash)

func set_daily_income(new_daily_income : int) -> void:
	daily_income = new_daily_income
	get_node("StatusBar/BaseHbox/IncomeHbox/CashData").text = str(daily_income)
	
func set_daily_expenses(new_daily_expenses : int) -> void:
	daily_expenses = new_daily_expenses
	get_node("StatusBar/BaseHbox/ExpensesHbox/CashData").text = str(daily_expenses)
