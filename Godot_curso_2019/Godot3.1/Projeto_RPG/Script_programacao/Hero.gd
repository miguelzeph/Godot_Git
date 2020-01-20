extends KinematicBody2D

var walk_speed = 150#px/s

var velocity = Vector2(0,0)

enum {UP,DOWN,LEFT,RIGHT}
var facing = DOWN

var switch_delta = Vector2(0,0)

func _physics_process(delta):
	
	if switch_delta == Vector2(0,0):
	
		var walked_left = Input.is_action_pressed("left")
		var walked_right = Input.is_action_pressed("right")
		var walked_up = Input.is_action_pressed("up")
		var walked_down = Input.is_action_pressed("down")
		
		velocity =Vector2()
		
		if walked_left and position.x >0:
			velocity.x = -walk_speed
			facing = LEFT
		if walked_right and position.x <512:
			velocity.x = walk_speed
			facing = RIGHT
		#Na Godot eixo y para cima é NEGATIVO
		if walked_up and position.y >10:
			velocity.y = -walk_speed
			facing = UP
		if walked_down and position.y <512:
			velocity.y = walk_speed
			facing = DOWN
	
	else:
		velocity = switch_delta*walk_speed
		
	#função que atualiza o movimento
	velocity = move_and_slide(velocity)
	
	set_anim()


func set_anim():
	if facing == RIGHT:
		$AnimationPlayer.current_animation = 'right_walk' if velocity.x != 0 else 'right_parado'
		$Head.frame = 21
	if facing == LEFT:
		$AnimationPlayer.current_animation = 'left_walk' if velocity.x != 0 else 'left_parado'
		$Head.frame = 18
	if facing == UP:
		$AnimationPlayer.current_animation = 'up_walk' if velocity.y != 0 else 'up_parado'
		$Head.frame = 23
	if facing == DOWN:
		$AnimationPlayer.current_animation = 'down_walk' if velocity.y != 0 else 'down_parado'
		$Head.frame = 16
		
func anim_switch(from,to):
	switch_delta = to.index - from.index
	var global = global_position
	from.remove_child(self)
	to.add_child(self)
	global_position = global
	
	$SwitchTimer.start()

func pass_door(from, to, door):
	switch_delta = door.out_dir
	from.remove_child(self)
	to.add_child(self)
	
	global_position = door.global_position
	$SwitchTimer.start()
	


func _on_SwitchTimer_timeout():
	switch_delta = Vector2(0,0)
	get_parent().enter_chunk()

