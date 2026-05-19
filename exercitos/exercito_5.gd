extends Control

func calculos(number1,operation,number2):
	print("calculou")
	var result
	if operation == "+":
		result = number1 + number2
	if operation == "-":
		result = number1 - number2
	if operation == "*":
		result = number1 * number2
	if operation == "/" or "x":
		if number1 or number2 == 0:
			$Result.text = "ERROR"
		else:
			result = number1 / number2
	print(result)
	if result == "<null>":
		$Result.text = "ERROR"
	else:
		$Result.text = str(result)

func _on_button_pressed() -> void:
	var number1 := int($number1.text)
	var number2 := int($number2.text)
	var operation: String = $operation.text
	print(operation)
	$number1.text = str(number1)
	$number2.text = str(number2)
	if operation == "+" or "-" or "*" or "/" or "x":
		calculos(number1,operation,number2)
	else:
		$Result.text = "ERROR"


#n sei oq fazr aqui tudo é muito estranho
