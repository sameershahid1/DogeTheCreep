extends Node2D

export (PackedScene) var mob_scene


func ready():
	randomize()


func _on_MobTimer_timeout():
	var mob_spawn_location=$MobPath/MobSpanLocation
	mob_spawn_location.unit_offset=randf()#Generating Location between 0 to 1
	
	var mob=mob_scene.instance()#Creating the mob Scence Instance
	add_child(mob)#Adding the Mob Scene in the Main Scene
	
	mob.position=mob_spawn_location.position#Getting the locatin of the PathFollowNode and setting that location in the mob
	var Direction=mob_spawn_location.rotation+(PI/2)#Rotating the Mobs 90 Degree
	Direction+=rand_range(-PI/4,PI/4)
	mob.rotation=Direction	
	
	var Velocity=Vector2(rand_range(mob.min_speed,mob.max_speed),0)
	mob.linear_velocity=Velocity.rotated(Direction)
	
	
