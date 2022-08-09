extends Node2D

export (PackedScene) var mob_scene
var score=0

#When this function is called the ScoreTime is started
func new_game():
	score=0
	$HUD.update_score(score)
	$StartTimer.start()
	$HUD.show_message("Get ready.......")
	yield($StartTimer,"timeout")#Unitl the StartTimer passed 2 seconds the game will not be started
	$ScoreTimer.start()
	$MobTimer.start()

#This function is called when ScoreTimer is Stoped	
func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()

func ready():
	randomize()

#This functin is called every 0.5 seconds
func _on_MobTimer_timeout():
	var mob_spawn_location=$MobPath/MobSpanLocation
	mob_spawn_location.unit_offset=randf()#Generating Location between 0 to 1
	
	var mob=mob_scene.instance()#Creating the mob Scence Instance
	add_child(mob)#Adding the Mob Scene in the Main Scene
	
	mob.position=mob_spawn_location.position#Getting the locatin of the PathFollowNode and setting that location in the mob
	var Direction=mob_spawn_location.rotation+(PI/2)#Rotating the Mobs 90 Degree
	Direction+=rand_range(-PI/4,PI/4)#By adding this the mob will move between 
	mob.rotation=Direction
	
	var Velocity=Vector2(rand_range(mob.min_speed,mob.max_speed),0)
	mob.linear_velocity=Velocity.rotated(Direction)

#Incrementing the score after 1 second
func _on_ScoreTimer_timeout():
	score+=1
	$HUD.update_score(score)




