extends Button

func _on_pressed():
	UiController.emit_build_batiment(Enums.BUILDING_TYPE.ICEMINE)
