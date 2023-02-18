extends Node

var score = 0
var maxHealth = 100
var health = maxHealth
var maxAmmo = 20
var ammo = maxAmmo
var playerName = ""
var quizTime = false
var questionsAnswered = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if health > maxHealth:
		health = maxHealth

func update_score(x):
	self.score += x


func update_health(x):
	self.health += x

func setQuizFalse():
	quizTime = false

func setQuizTrue():
	quizTime = true

func restartGame():
	print("restart")
	score = 0
	maxHealth = 100
	health = maxHealth
	ammo = 20
	playerName = ""
	get_tree().change_scene("res://Scenes/GUI/MainMenu.tscn")


var questionData = """{ "Questions": 
	{ "SKATS": 
	[
			{
				"Prompt": "In SKATS, what letter is ㄱ?",
				"Answer1":"R",
				"Answer2":"H",
				"Answer3":"K",
				"Answer4":"L",
				"Correct": "L" },
			{
				"Prompt": "In SKATS, what letter is ㄴ?",
				"Answer1":"E",
				"Answer2":"F",
				"Answer3":"K",
				"Answer4":"P",
				"Correct": "F" },
			{
				"Prompt": "In SKATS, what letter is ㄷ?",
				"Answer1":"X",
				"Answer2":"B",
				"Answer3":"J",
				"Answer4":"Y",
				"Correct": "B" },		
			{
				"Prompt": "In SKATS, what letter is ㄹ?",
				"Answer1":"Q",
				"Answer2":"V",
				"Answer3":"B",
				"Answer4":"N",
				"Correct": "V" },
			{
				"Prompt": "In SKATS, what letter is ㅁ?",
				"Answer1":"M",
				"Answer2":"R",
				"Answer3":"E",
				"Answer4":"A",
				"Correct": "M" },
			{
				"Prompt": "In SKATS, what letter is ㅂ?",
				"Answer1":"M",
				"Answer2":"W",
				"Answer3":"Z",
				"Answer4":"L",
				"Correct": "W" },
			{
				"Prompt": "In SKATS, what letter is ㅅ?",
				"Answer1":"G",
				"Answer2":"H",
				"Answer3":"J",
				"Answer4":"B",
				"Correct": "G" },
			{
				"Prompt": "In SKATS, what letter is ㅇ?",
				"Answer1":"H",
				"Answer2":"T",
				"Answer3":"Y",
				"Answer4":"K",
				"Correct": "G" },
			{
				"Prompt": "In SKATS, what letter is ㅈ?",
				"Answer1":"E",
				"Answer2":"R",
				"Answer3":"P",
				"Answer4":"O",
				"Correct": "P" },
			{
				"Prompt": "In SKATS, what letter is ㅊ?",
				"Answer1":"Z",
				"Answer2":"O",
				"Answer3":"S",
				"Answer4":"C",
				"Correct": "C" },
			{
				"Prompt": "In SKATS, what letter is ㅋ?",
				"Answer1":"X",
				"Answer2":"S",
				"Answer3":"U",
				"Answer4":"M",
				"Correct": "X" },
			{
				"Prompt": "In SKATS, what letter is ㅌ?",
				"Answer1":"M",
				"Answer2":"W",
				"Answer3":"Z",
				"Answer4":"L",
				"Correct": "Z" },
			{
				"Prompt": "In SKATS, what letter is ㅍ?",
				"Answer1":"W",
				"Answer2":"D",
				"Answer3":"O",
				"Answer4":"A",
				"Correct": "O" },
			{
				"Prompt": "In SKATS, what letter is ㅎ?",
				"Answer1":"J",
				"Answer2":"K",
				"Answer3":"S",
				"Answer4":"V",
				"Correct": "J" },
			{
				"Prompt": "In SKATS, what letter is ㅏ?",
				"Answer1":"E",
				"Answer2":"W",
				"Answer3":"S",
				"Answer4":"T",
				"Correct": "E" },
			{
				"Prompt": "In SKATS, what letter is ㅑ?",
				"Answer1":"E",
				"Answer2":"I",
				"Answer3":"N",
				"Answer4":"A",
				"Correct": "I" },
			{
				"Prompt": "In SKATS, what letter is ㅓ?",
				"Answer1":"D",
				"Answer2":"H",
				"Answer3":"T",
				"Answer4":"R",
				"Correct": "T" },
			{
				"Prompt": "In SKATS, what letter is ㅕ?",
				"Answer1":"M",
				"Answer2":"W",
				"Answer3":"G",
				"Answer4":"S",
				"Correct": "S" },
			{
				"Prompt": "In SKATS, what letter is ㅗ?",
				"Answer1":"M",
				"Answer2":"N",
				"Answer3":"Q",
				"Answer4":"A",
				"Correct": "A" },
			{
				"Prompt": "In SKATS, what letter is ㅛ?",
				"Answer1":"N",
				"Answer2":"J",
				"Answer3":"K",
				"Answer4":"L",
				"Correct": "N" },			
			{
				"Prompt": "In SKATS, what letter is ㅜ?",
				"Answer1":"H",
				"Answer2":"U",
				"Answer3":"I",
				"Answer4":"P",
				"Correct": "H" },
			{
				"Prompt": "In SKATS, what letter is ㅠ?",
				"Answer1":"M",
				"Answer2":"R",
				"Answer3":"S",
				"Answer4":"A",
				"Correct": "R" },
			{
				"Prompt": "In SKATS, what letter is ㅡ?",
				"Answer1":"F",
				"Answer2":"W",
				"Answer3":"X",
				"Answer4":"D",
				"Correct": "D" },
			{
				"Prompt": "In SKATS, what letter is ㅣ?",
				"Answer1":"T",
				"Answer2":"U",
				"Answer3":"R",
				"Answer4":"D",
				"Correct": "U" },
			{
				"Prompt": "In SKATS, what letters are ㅔ?",
				"Answer1":"TU",
				"Answer2":"EU",
				"Answer3":"SU",
				"Answer4":"IU",
				"Correct": "TU" },
			{
				"Prompt": "In SKATS, what letters are ㅐ?",
				"Answer1":"TU",
				"Answer2":"EU",
				"Answer3":"SU",
				"Answer4":"IU",
				"Correct": "EU" },
			{
				"Prompt": "In SKATS, what letters are ㅖ?",
				"Answer1":"TU",
				"Answer2":"EU",
				"Answer3":"SU",
				"Answer4":"IU",
				"Correct": "SU" },
			{
				"Prompt": "In SKATS, what letters are ㅒ?",
				"Answer1":"TU",
				"Answer2":"EU",
				"Answer3":"SU",
				"Answer4":"IU",
				"Correct": "IU" }
			]
		}
	}
"""
