extends Camera2D

var follow_target = self
var current_speed = 0
var max_speed = 3
var speed_incra = 0.02
var delta_mod = 5

func _process(delta: float) -> void:
	self.position = follow_target.position
	#if self.position.distance_to(follow_target.position) > 40:
		#if self.position.x < follow_target.position.x - 40:
			#self.position.x = follow_target.position.x - 40
			##self.position.y = 
		#elif self.position.x > follow_target.position.x + 40:
			#self.position.x = follow_target.position.x + 40
	#elif self.position.distance_to(follow_target.position) > 5:
		#if current_speed < max_speed:
			#current_speed = current_speed - speed_incra
		#move_towards(delta)
	#else:
		#if current_speed > 0:
			#current_speed = current_speed - (speed_incra*2)
		#TODO work on smooth camera later, lets get a game down first

func move_towards(delta):
	if self.position.y > follow_target.position.y:
		self.position.y = round(self.position.y - (current_speed * delta * delta_mod))
	elif self.position.y < follow_target.position.y:
		self.position.y = round(self.position.y + (current_speed * delta * delta_mod))
	if self.position.x > follow_target.position.x:
		self.position.x = round(self.position.x - (current_speed * delta * delta_mod))
	elif self.position.x < follow_target.position.x:
		self.position.x = round(self.position.x + (current_speed * delta * delta_mod))
