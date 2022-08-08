extends Area2D

#This controls the Game Player Speed
export var speed=400.0
var Screen_Size=Vector2.ZERO

func _ready():
	Screen_Size=get_viewport_rect().size
	print(Screen_Size)

func _process(delta):
	var Direction=Vector2.ZERO
	#Setting the Player Movement
	if Input.is_action_pressed("move_right"):
		Direction.x+=1
	if Input.is_action_pressed("move_left"):
		Direction.x-=1
	if Input.is_action_pressed("move_up"):
		Direction.y-=1
	if Input.is_action_pressed("move_down"):
		Direction.y+=1
	if Direction.length()>1:
		Direction=Direction.normalized()
	position+=Direction*speed*delta
	position.x=clamp(position.x,0,Screen_Size.x)
	position.y=clamp(position.y,0,Screen_Size.y)
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	



