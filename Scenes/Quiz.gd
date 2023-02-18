extends Node2D

var result_json
var correctAnswer


func processJSON(rj):
	if rj.error == OK:  # If parse OK
		var data = rj.result
		return data
	else:  # If parse has errors
		print("Error: ", rj.error)
		print("Error Line: ", rj.error_line)
		print("Error String: ", rj.error_string)



# Called when the node enters the scene tree for the first time.
func _ready():

	#GET JSON DATA
	#var file = File.new()
	#file.open("res://questions.json", file.READ)
	#var text_json = file.get_as_text()
	result_json = JSON.parse(Global.questionData)
	#file.close()
	result_json = processJSON(result_json).Questions

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func answerIsCorrect():
	$CorrectSound.play()
	Global.ammo = 20
	#Global.health += 20
	Global.score += 10
	if Global.questionsAnswered <= 27:
		Global.questionsAnswered +=1
	
	
func answerIsIncorrect():
	$IncorrectSound.play()

	
func processAnswer(x):
	if get_node(x).text == correctAnswer:
		answerIsCorrect()
	else:
		answerIsIncorrect()
	Global.setQuizFalse()
	get_tree().paused = false

func _on_Answer1_pressed():
	processAnswer("Answer1/Label")
	
func _on_Answer2_pressed():
	processAnswer("Answer2/Label")
	
func _on_Answer3_pressed():
	processAnswer("Answer3/Label")
	
func _on_Answer4_pressed():
	processAnswer("Answer4/Label")


func _on_Quiz_visibility_changed():
	if self.visible == true:
		var i = Global.questionsAnswered
		$Question.text = result_json.SKATS[i].Prompt
		$Answer1/Label.text = result_json.SKATS[i].Answer1
		$Answer2/Label.text = result_json.SKATS[i].Answer2
		$Answer3/Label.text = result_json.SKATS[i].Answer3
		$Answer4/Label.text = result_json.SKATS[i].Answer4
		correctAnswer = result_json.SKATS[i].Correct
