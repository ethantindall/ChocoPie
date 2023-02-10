extends Node2D

var ChocoPie = preload("res://Scenes/Targets/ChocoPie.tscn")
var score = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ScoreLabel.text = "Score: " + str(Global.score)
	$AmmoLabel.text = "Ammo: " + str(Global.ammo)
	if Global.health <= 0:
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state
		get_node("GameOver/EndGameMenu").visible = true
		get_node("Stats/CanvasLayer/HealthBar").value = 0

	
func _on_Timer_timeout():
	var spawnHeight = int(round(rand_range(10, 170)))
	
	var pie = ChocoPie.instance()
	pie.position = Vector2(330,spawnHeight)
	add_child(pie)

