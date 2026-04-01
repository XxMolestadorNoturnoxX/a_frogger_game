extends Control





func calculos(number1,operation,number2):
	var result
	if operation == "+":
		result = number1 + number2
	if operation == "-":
		result = number1 - number2
	if operation == "*":
		result = number1 * number2
	if operation == "/":
		result = number1 / number2
	$Result.text = str(result)

func _on_button_pressed() -> void:
	var number1 = int($number1.text)
	var number2 = int($number2.text)
	var operation = $operation.text
	if operation == "+" or "-" or "*" or "/" and number1 > 0 and number2 > 0:
		calculos(number1,operation,number2)
	else:
		$Result.text = "ERROR"
