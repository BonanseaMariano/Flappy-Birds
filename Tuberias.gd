extends Node2D

var lista_tubos = []
export (float) var offset_x
export (int) var limite_azar_y_min
export (int) var limite_azar_y_max

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	lista_tubos = get_tree().get_nodes_in_group("tubo")
	
	for i in lista_tubos:
		azar_Y(i)
	

func reposicionar():
	lista_tubos[0].global_position.x = lista_tubos[-1].global_position.x + offset_x
	lista_tubos.push_back(lista_tubos.pop_front())
	azar_Y(lista_tubos[-1])
	
func azar_Y(tubo):
	tubo.global_position.y = randi()%limite_azar_y_max+limite_azar_y_min
