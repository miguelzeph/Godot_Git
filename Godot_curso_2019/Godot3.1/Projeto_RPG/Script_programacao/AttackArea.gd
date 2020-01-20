extends Node2D

func attack(side,d):
	var bodies
	
	if side == get_parent().LEFT:
		bodies = $Left.get_overlapping_areas()
	if side == get_parent().RIGHT:
		bodies = $Right.get_overlapping_areas()
	if side == get_parent().UP:
		bodies = $Up.get_overlapping_areas()
	if side == get_parent().DOWN:
		bodies = $Down.get_overlapping_areas()
	
	for b in bodies:
		if b.has_method("damage") and b != get_parent():
			b.damage(side,d)
			
		