extends RigidBody2D

export (float) var vel_impulso
export (float) var vel_desp
export (float) var vel_incrementar

var vivo = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if (vivo):
		linear_velocity.x = vel_desp
		movimiento()
	get_tree().get_nodes_in_group("limites")[0].global_position.x = global_position.x

func _integrate_forces(state):
	if (vivo):
		for i in range(state.get_contact_count()):
			if (state.get_contact_collider_object(i).is_in_group("kill")):
				vivo = false
				linear_velocity.x = 0
				get_parent().get_node("SFX/Die").play()
				Input.vibrate_handheld(500)
				get_tree().get_nodes_in_group("main")[0].game_over()

func movimiento():	
	if (Input.is_action_just_pressed("tocar")):	
		set_linear_velocity(Vector2.ZERO)
		linear_velocity.y -= vel_impulso
		$AnimationPlayer.play("Aletear")
		get_parent().get_node("SFX/Aletear").play()

