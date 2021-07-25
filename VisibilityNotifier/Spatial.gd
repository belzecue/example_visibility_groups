extends Spatial


export(PackedScene) var creep: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in 10:
		var new_obj: Creep = creep.instance()
		add_child(new_obj)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
