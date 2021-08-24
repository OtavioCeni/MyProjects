extends Control

onready var plus_button := get_node('Plus_Button')
onready var minus_button := get_node('Minus_Button')
onready var times_button := get_node('Times_Button')
onready var divided_button := get_node('Divided_Button')
onready var reset_button := get_node("Reset_Calculator")

var first_number : int = 0
var second_number : int = 0

var array_button_colors = ['#3CD3D8','#FFBD59','#F497D0','#C9E265','#969696']

func _ready():
	plus_button.connect('pressed',self,'plus_button_operation')
	minus_button.connect('pressed',self,'minus_button_operation')
	times_button.connect('pressed',self,'times_button_operation')
	divided_button.connect('pressed',self,'divided_button_operation')
	reset_button.connect('pressed',self,'reset_calculator')
	
# Editing	
func get_numbers() -> void:
	first_number = float(get_node('First_Number').get_text())
	second_number = float(get_node('Second_Number').get_text())
#
	
func plus_button_operation() -> void:
	get_numbers()
	var plus_result : float = first_number + second_number
	$Background.color = array_button_colors[0]
	$Result.text = "O resultado de %d + %d é: %d " % [int(first_number),int(second_number),int(plus_result)]
	
func minus_button_operation() -> void:
	get_numbers()
	var minus_result : float = first_number - second_number
	$Background.color = array_button_colors[1]
	$Result.text = "O resultado de %d - %d é: %d " % [int(first_number),int(second_number),(minus_result)]

func times_button_operation() -> void:
	get_numbers()
	var times_result : float = first_number * second_number
	$Background.color = array_button_colors[2]
	$Result.text = "O resultado de %d * %d é: %d " % [int(first_number),int(second_number),int(times_result)]

func divided_button_operation() -> void:
	get_numbers()
	if second_number == 0:
		$Background.color = array_button_colors[4]
		$Result.text = "Não é possível dividir por zero..."
	else:
		var divided_result : float = first_number / second_number
		$Background.color = array_button_colors[3]
		$Result.text = "O resultado de %d / %d é: %d " % [int(first_number),int(second_number),int(divided_result)]

func reset_calculator() -> void:
	get_tree().reload_current_scene()
