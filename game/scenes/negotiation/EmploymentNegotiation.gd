extends Node2D


class_name EmploymentNegotiation

signal contract_rejected
signal contract_accepted(contract)

var random_number_generator : RandomNumberGenerator
var _proposed_employment_contract : EmploymentContract setget set_proposed_employment_contract, get_proposed_employment_contract
var proposal_accepted : bool
var proposal_made: bool

# Called when the node enters the scene tree for the first time.
func _ready():
	if !proposal_made:
		get_node("NegotiationPanel/MainHBox/OfferPanel/VBoxContainer2/OfferResponseHBox").hide()
		get_node("NegotiationPanel/MainHBox/OfferPanel/VBoxContainer2/OfferResponseSeperator").hide()
		get_node("NegotiationPanel/MainHBox/OfferPanel/VBoxContainer2/HireDecisionHBox").hide()


func _init():
	proposal_made = false
	proposal_accepted = false


# Setters and Getters
func set_proposed_employment_contract(new_proposed_employment_contract: EmploymentContract) -> void:
	_proposed_employment_contract = new_proposed_employment_contract
	get_node("NegotiationPanel/MainHBox/ResuméPanel/VBoxContainer/NameData").text = _proposed_employment_contract.hero.get_name()
	get_node("NegotiationPanel/MainHBox/ResuméPanel/VBoxContainer/PowerData").text = str(_proposed_employment_contract.hero.get_power_score() * 100)


func get_proposed_employment_contract() -> EmploymentContract:
	return _proposed_employment_contract



func _on_MakeOfferBtn_button_up():
	get_node("NegotiationPanel/MainHBox/OfferPanel/VBoxContainer2/OfferResponseHBox").show()
	get_node("NegotiationPanel/MainHBox/OfferPanel/VBoxContainer2/OfferResponseSeperator").show()
	get_node("NegotiationPanel/MainHBox/OfferPanel/VBoxContainer2/HireDecisionHBox").show()
	get_node("NegotiationPanel/MainHBox/OfferPanel/VBoxContainer2/OfferResponseHBox/OfferResponseData").text = "Offer accepted"


func _on_AcceptBtn_button_up():
	_proposed_employment_contract.days_remaining = get_node("NegotiationPanel/MainHBox/OfferPanel/VBoxContainer2/HBoxContainer/VBoxContainer/DaysOfService").get_value_data()
	_proposed_employment_contract.cost_per_day = get_node("NegotiationPanel/MainHBox/OfferPanel/VBoxContainer2/HBoxContainer/VBoxContainer2/DailyPayment").get_value_data()
	emit_signal("contract_accepted", _proposed_employment_contract)
	queue_free()


func _on_RejectBtn_button_up():
	emit_signal("contract_rejected")
	queue_free()
