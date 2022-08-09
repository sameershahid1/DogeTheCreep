extends Area2D

signal hit

#Player Movement Speed
export var speed=400.0
var Screen_Size=Vector2.ZERO

func _ready():
#Getting the Screen Size
	Screen_Size=get_viewport_rect().size
	hide()

func _process(delta):
	var Direction=Vector2.ZERO
	#Player Movement
	if Input.is_action_pressed("move_right"):
		Direction.x+=1
	if Input.is_action_pressed("move_left"):
		Direction.x-=1
	if Input.is_action_pressed("move_up"):
		Direction.y-=1
	if Input.is_action_pressed("move_down"):
		Direction.y+=1
	
	if Direction.length()>0:
		Direction=Direction.normalized()
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	position+=Direction*speed*delta
	position.x=clamp(position.x,0,Screen_Size.x)#Limiting the position.x between 0 to Screen_size.x
	position.y=clamp(position.y,0,Screen_Size.y)#Limiting the position.y between 0 to Screen_size.y
	
	#The animation will be played according to these conditions
	if Direction.x!=0:
		#Setting the animation Left and Right
		$AnimatedSprite.animation="right"
		$AnimatedSprite.flip_v=false
		#The fliping is used for when we are moving left in x-axis
		$AnimatedSprite.flip_h=Direction.x<0
	elif Direction.y!=0:
	   #Setting the animation UP and Down
		$AnimatedSprite.animation="up"
		#The fliping is used for when we are moving up in y-axis
		$AnimatedSprite.flip_v=Direction.y>0

func start(new_position):
	position=new_position
	show()
	$CollisionShape2D.disabled=false
	

#It will check whather player body was touch by the Enemy body, if it was touch the player node will be Distroyed.
func _on_Player_body_entered(body):
	hide()
#Safe Method to change the node Property
	$CollisionShape2D.set_deferred("disabled",true)
	emit_signal("hit")



