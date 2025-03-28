class_name WarningScreen
extends Screen
## A confirmation dialogue screen with editable text.

@export var warning_text: RichTextLabel

## The text that replaces the placeholder text.
var text: String
## The screen to return to when the cancel button is pressed.
var return_screen: StringName = &"PauseScreen"
## Which function should run when the confirm button is pressed.
## If new behaviour is desired, a new function can be created in this script.
var confirm_behaviour: Callable


func on_load() -> void:
	warning_text.text = text


func restart() -> void:
	GameState.reload.emit()
	manager.switch_screen(self)


func quit() -> void:
	get_tree().quit()


func reset_settings() -> void:
	LocalSettings.reset_settings()
	manager.switch_screen(self, manager.get_screen(&"OptionsScreen"))


func _on_cancel_pressed() -> void:
	manager.switch_screen(self, manager.get_screen(return_screen))


func _on_confirm_pressed() -> void:
	confirm_behaviour.call()
