extends Node

signal build_batiment
signal build_path

func emit_build_batiment():
	build_batiment.emit()

func emit_build_path():
	build_path.emit()
