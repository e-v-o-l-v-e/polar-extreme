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
	if nbProjPerPage < 5 :
		nbProjPerPage += 1
		projectContainer.add_child(arrayProjects.get(nbProjPerPage*nbPage-1))
		#print("pageaj " , nbProjPerPage*nbPage-1 ," ", nbProject ," ", nbProjPerPage ," ", nbPage)


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
		if (nbPage == nbPageTot) :
			for i in nbProject%5 :
				#projectContainer.remove_child(arrayProjects.get(i+5*(nbPage-1)))
				arrayProjects.get(i+5*(nbPage-1)).setVisibility(false)
				#print("testee " , i+5*(nbPage-1) ," ", i ," ", nbProject ," ", nbProjPerPage ," ", nbPage)
		else :
			for i in 5 :
				#projectContainer.remove_child(arrayProjects.get(i+5*(nbPage-1)))
				arrayProjects.get(i+5*(nbPage-1)).setVisibility(false)
				#print("testee " , i+5*(nbPage-1) ," ", i ," ", nbProject ," ", nbProjPerPage ," ", nbPage)
		nbPage -= 1
		nbProjPerPage = 0
		for i in 5 :
			#projectContainer.add_child(arrayProjects.get(i+5*(nbPage-1)))
			arrayProjects.get(i+5*(nbPage-1)).setVisibility(true)
			nbProjPerPage += 1
			#print("teste " , i+5*(nbPage-1) ," ", nbProject ," ", nbProjPerPage ," ", nbPage)


func _on_next_pressed() -> void:
	if (nbPage < nbPageTot) :
		for i in 5 :
			arrayProjects.get(i+5*(nbPage-1)).setVisibility(false)
			#print("testeee " , i+5*(nbPage-1) ," ", nbProject ," ", nbProjPerPage ," ", nbPage)
		nbPage += 1
		nbProjPerPage = 0
		if (nbPage == nbPageTot) :
			for i in nbProject%5 :
				#projectContainer.add_child(arrayProjects.get(i+5*(nbPage-1)))
				arrayProjects.get(i+5*(nbPage-1)).setVisibility(true)
				nbProjPerPage += 1
				#print("test " , i+5*(nbPage-1) ," ", nbProject ," ", nbProjPerPage ," ", nbPage)
		else :
			for i in 5 :
				#projectContainer.add_child(arrayProjects.get(i+5*(nbPage-1)))
				arrayProjects.get(i+5*(nbPage-1)).setVisibility(true)
				nbProjPerPage += 1
				#print("testt " , i+5*(nbPage-1) ," ", nbProject ," ", nbProjPerPage ," ", nbPage)


func _on_button_test_pressed() -> void:
	nbProject += 1
	#print("nbpage ", (nbProject-1)%5)
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
	#pageAj()


func _on_button_test_2_pressed() -> void:
	nbProject -= 1
	#print("nbpage ", (nbProject)%5)
	if (nbProject-1)%5 == 0 and nbProject > 1 :
		nbPageTot -= 1
	
	arrayProjects.remove_at(-1)
	
	#pageAj()
