extends Control
class_name NotificationIndicator
@onready var label := $Background/NumberLabel

func setVisible(visible : bool):
	self.visible =visible

func set_text(text:String):
	label.text=text
