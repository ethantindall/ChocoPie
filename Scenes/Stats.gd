extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_node("CanvasLayer/HealthBar").value > Global.health:
		get_node("CanvasLayer/HealthBar/AnimationPlayer").play("TakeDamage")
	if $CanvasLayer/HealthBar.value <=30 :
		$CanvasLayer/HealthBar/AnimationPlayer.play("TakeDamage")
	get_node("CanvasLayer/HealthBar").value = Global.health
