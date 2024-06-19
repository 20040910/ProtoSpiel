extends Area2D

func _physics_process(delta):
	print("Checking for enemies")
	var enemies_in_range = get_overlapping_bodies()
	print("Enemies in range: ", enemies_in_range.size())
	for body in enemies_in_range:
		if body is CharacterBody2D:
			print("Detected enemy: ", body.name)
			look_at(body.global_position)
			break
		else:
			print("No enemies in range")

func shoot():
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	var shooting_point = $WeaponPivot/Pistol/ShootingPoint
	new_bullet.global_position = shooting_point.global_position
	new_bullet.global_rotation = shooting_point.global_rotation
	get_parent().add_child(new_bullet)

func _on_timer_timeout():
	shoot()
