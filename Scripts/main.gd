extends Node2D

var puntos = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	puntos = 0
	$HUD/winlose.hide()
	$HUD/Iniciar.hide()
	$SFX/Musica.play()

func agregar_puntos():
	puntos += 1
	$HUD/puntos.text = str(puntos)
	if(puntos %5 == 0 && get_tree().get_nodes_in_group("bird")[0].vel_desp<200):
		get_tree().get_nodes_in_group("bird")[0].vel_desp += get_tree().get_nodes_in_group("bird")[0].vel_incrementar

func game_over():
	$HUD/winlose.show()
	$SFX/Musica.stop()
	$HUD/MessageTimer.start()

func _on_MessageTimer_timeout():
	$HUD/Iniciar.show()

func _on_Iniciar_pressed():
	$HUD/Iniciar.hide()
	$HUD/winlose.hide()
	get_tree().reload_current_scene()
