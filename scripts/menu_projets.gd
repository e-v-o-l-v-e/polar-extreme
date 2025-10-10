extends MarginContainer

@export var projectScene : PackedScene
@export var projectContainer : VBoxContainer
@export var container : MarginContainer
@export var text : Label
@export var prev : Button
@export var next : Button

var nbProject = 0;
var nbPage = 1;
var nbPageTot = 1;
var nbProjPerPage = 0;

var arrayProjects = Array()

func pageAj() -> void :
	if nbProject%5 != 0 :
		nbProjPerPage = nbProject/5
	else :
		nbProjPerPage = 0


func _process(delta: float) -> void:
	if (nbProject == 0):
		text.visible = true
	else :
		text.visible = false
	
	if (nbProject >= 5):
		prev.visible = true
		next.visible = true
	else :
		prev.visible = false
		next.visible = false


func _on_prev_pressed() -> void:
	if (nbPage > 1) :
		#if (nbPage == nbPageTot) :
		#	for i in nbProject%5 :
		#		arrayProjects.get(i+5*(nbPage-1)).setVisibility(false)
		#else :
		#	for i in 5 :
		#		arrayProjects.get(i+5*(nbPage-1)).setVisibility(false)
		for proj in arrayProjects :
			proj.setVisibility(false)
			
		nbPage -= 1
		nbProjPerPage = 0
		
		for i in 5 :
			arrayProjects.get(i+5*(nbPage-1)).setVisibility(true)
			nbProjPerPage += 1


func _on_next_pressed() -> void:
	if (nbPage < nbPageTot) :
		for i in 5 :
			arrayProjects.get(i+5*(nbPage-1)).setVisibility(false)
			
		nbPage += 1
		nbProjPerPage = 0
		
		if (nbPage == nbPageTot) :
			for i in nbProject%5 :
				arrayProjects.get(i+5*(nbPage-1)).setVisibility(true)
				nbProjPerPage += 1
		else :
			for i in 5 :
				arrayProjects.get(i+5*(nbPage-1)).setVisibility(true)
				nbProjPerPage += 1


func _on_button_test_pressed() -> void:
	nbProject += 1
	if (nbProject-1)%5 == 0 and nbProject > 1 :
		nbPageTot += 1

	var project = projectScene.instantiate()
	project.setName(str(nbProject))
	project.setVisibility(false)
	
	arrayProjects.append(project)
	projectContainer.add_child(project)
	if nbProjPerPage < 5 :
		project.setVisibility(true)
		nbProjPerPage += 1
		print(nbProjPerPage)


func _on_button_test_2_pressed() -> void:
	if (nbProject > 0) :
		if (nbProject-1)%5 == 0 and nbProject > 1 :
			nbPageTot -= 1
		
		projectContainer.remove_child(arrayProjects.get(nbProject-1))
		arrayProjects.remove_at(nbProject-1)
		
		nbProject -= 1
		nbProjPerPage -= 1
		if nbProjPerPage == 0 :
			nbProjPerPage = 4
			nbPageTot -= 1
			print(str(nbProject) + " " + str(nbPageTot) + " " + str(nbPage) + " " + str(nbProjPerPage))
			test()


func test() -> void:
	if (nbPage > 1) :
		for proj in arrayProjects :
			proj.setVisibility(false)
			
		nbPage -= 1
		nbProjPerPage = 0
		
		for i in 5 :
			arrayProjects.get(i+5*(nbPage-1)).setVisibility(true)
			nbProjPerPage += 1
			print(nbProjPerPage)
