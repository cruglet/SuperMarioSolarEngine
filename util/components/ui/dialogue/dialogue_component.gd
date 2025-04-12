class_name DialogueComponent extends Component

enum ScrollType {
	INSTANT,
}

## The actual text for dialogue
@export_multiline var dialogue_text: Array[String]
## Whether the text scrolls or appears all at once
@export var scrolling: bool = true
## The animation to play when scrolling
@export var scroll_type: ScrollType
## The id used for replacing the dialogue with another language
@export var locale_id: StringName
