extends Node2D

var ammoMaskPosition = Vector2(280,128)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HealthNode/HealthBar.value = Global.health
	$AmmoNode/AmmoProgressBar.value = Global.ammo
	if $HealthNode/HealthBar.value <= (Global.maxHealth * .3):
		$HealthNode/HealthBar/AnimationPlayer.play("TakeDamage")
	$AmmoNode/AmmoMask.position[1]= ammoMaskPosition[1] - (Global.ammo *4)
	
	$ScoreNode/ScoreLabel.text = str(Global.score)

func _on_HealthBar_value_changed(value):
	get_node("HealthNode/HealthBar/AnimationPlayer").play("TakeDamage")


func _on_AmmoProgressBar_value_changed(value):
	if $AmmoNode/CrateSprite/AnimationPlayer.is_playing() == false:
		$AmmoNode/CrateSprite/AnimationPlayer.play("FirePop")
