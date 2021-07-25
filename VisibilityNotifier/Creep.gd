class_name Creep extends MeshInstance

const rad: float = 57.2958
var speed: float
var velocity: Vector3


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("Creeps")
	
	randomize()
	translate(Vector3(0,0,rand_range(-10, 0)))
	rotate_z(rand_range(-45/rad, 45/rad))
	speed = rand_range(0.2, 1.5)
	velocity = Vector3.LEFT if randf() < 0.5 else Vector3.RIGHT


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	translate(velocity * delta * speed)


func _on_VisibilityNotifier_screen_exited() -> void:
	print(self.name, " exited!")
	remove_from_group("Creeps")
	if get_tree().get_nodes_in_group("Creeps").empty():
		print(self.name, " is lucky last!")
	queue_free()
