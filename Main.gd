extends Node2D

@onready var start_timer=$StartTimer
@onready var start_321=$start321
@onready var car=$Car
var checkpoints = [false,false]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if start_timer.time_left > 1:
		start_321.text = str(floor(start_timer.time_left))
	elif start_timer.time_left > 0:
		start_321.text = "START"
	else:
		start_321.text = ""
		
func _on_start_end_area_entered(area):
	if area.name == "Hitarea":
		if checkpoints == [true,true]:
			#print("end")
			car.can_drive = false
			await (get_tree().create_timer(1.0).timeout)
			get_tree().reload_current_scene()


func _on_start_timer_timeout():
	car.can_drive = true


func _on_checkpoint_1_area_entered(area):
	if area.name == "Hitarea":
		checkpoints[0]= true
		print('1',checkpoints[0])


func _on_checkpoint_2_area_entered(area):
	if area.name == "Hitarea":
		checkpoints[1]= true
		print('2',checkpoints[0])
