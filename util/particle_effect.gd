@tool
class_name ParticleEffect
extends Resource

## Associated scene of this particle effect.
@export var particle_scene: PackedScene

## Position offset for this particle effect.
@export var particle_offset := Vector2.ZERO

## Amount of frames between continious loop particles.
@export var loop_delay: int = 0
var timer: int = loop_delay

@export_tool_button("Preview Particle", "Play") var action_pressed = _preview_pressed


## Emit the particle at a specific node.[br]
## [param offset_overwrite] is useful if you want to use logic defined offsets instead.
func emit_at(node: Node, offset_overwrite := Vector2.ZERO):
	if timer > 0:
		timer = max(timer - 1, 0)
	else:
		timer = loop_delay

		var particle: CPUParticles2D = particle_scene.instantiate()

		if offset_overwrite != Vector2.ZERO:
			particle.position = offset_overwrite
		else:
			particle.position = particle_offset

		particle.emitting = true

		node.add_child(particle)

		particle.connect(&"finished", particle.queue_free)


func _preview_pressed():
	if not resource_local_to_scene:
		printerr("Cannot preview a particle if local to scene is disabled. Check the variable under Resource -> resource_local_to_scene")
		return

	emit_at(get_local_scene(), particle_offset)
