extends Node2D

#export(bool) var teste
#export(int) var teste2
#export(float) var test3

export var top = false
export var bottom = false
export var left = false
export var right = false



func _on_up_body_entered(body):
	if top:
		get_parent().exit_chunk(Vector2(0,-1))


func _on_left_body_entered(body):
	if left:
		get_parent().exit_chunk(Vector2(-1,0))


func _on_right_body_entered(body):
	if right:
		get_parent().exit_chunk(Vector2(1,0))
