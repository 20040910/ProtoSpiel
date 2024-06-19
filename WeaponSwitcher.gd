extends Node2D

@export var weapon_sprites: Array[Texture2D]
@export var projectile_scenes: Array[PackedScene]
@onready var weapon_sprite = $WeaponSprite
@onready var projectile_spawn_point = $ProjectileSpawnPoint

var current_weapon_index: int = 0

func _ready():
	update_weapon()

func switch_weapon(index: int):
	current_weapon_index = index
	update_weapon()

func update_weapon():
	if current_weapon_index < weapon_sprites.size():
		weapon_sprite.texture = weapon_sprites[current_weapon_index]
	
	if current_weapon_index < projectile_scenes.size():
		var projectile_scene = projectile_scenes[current_weapon_index]
		projectile_spawn_point.projectile_scene = projectile_scene

func fire():
	if current_weapon_index < projectile_scenes.size():
		var projectile_scene = projectile_scenes[current_weapon_index]
		var projectile = projectile_scene.instantiate()
		projectile.position = projectile_spawn_point.global_position
		get_parent().add_child(projectile)
