extends enemyBase

func _ready():
	set_physics_process(false)

func _physics_process(delta: float) -> void:
	apply_gravity(delta)
	_set_boss_animation()

func _set_boss_animation():
	var anim = "run"
	
	if $ray_wall.is_colliding():
		anim = "idle"
	elif motion.x != 0 and health > 3:
		anim = "run"
	elif motion.x != 0 and health < 3:
		anim = "angryRun"
		speed = 86
	
	if hitted == true:
		anim = "hit"
	
	if health < 1:
		anim = "die"
	
	if $anim.assigned_animation != anim:
		$anim.play(anim)

func _on_ArenaDor2_DoorClosed():
	set_physics_process(true)
