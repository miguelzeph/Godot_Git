extends Node

var digitar = 'Chamei a variavel digitar de outro node......'

#Função para ser chamada
func teste():
	var x = 0
	var y = 10
	var z = 5
	
	print("A soma vai dar "+str(x+y+z))
	
func _ready():
	
	var pai = get_node("..") #Volto um Nó
	print("************************")
	print(pai.variavel)
	print("************************")
	
	pass