extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_VisibilityNotifier2D_screen_exited():
	get_tree().get_nodes_in_group("tub")[0].reposicionar()


func _on_Area2D_body_entered(body):
	if(body.is_in_group("bird")):
		get_tree().get_nodes_in_group("main")[0].agregar_puntos()
		get_tree().get_nodes_in_group("sfx")[0].get_node("Punto").play()
