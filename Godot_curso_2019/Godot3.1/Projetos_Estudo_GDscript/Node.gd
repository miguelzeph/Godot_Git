extends Node

var miguel
var priscila

var variavel = "puxei do Pai agora..."


#Classe
class Personagem:
	var nome
	var hp
	var atk
	
	#Método Construtor
	func _init(nome, hp, atk):
		self.nome = nome
		self.hp = hp
		self.atk = atk
	
	#Método Atacar
	func soco(inimigo):
		inimigo.hp = inimigo.hp - self.atk

#Classe com herança (Não sei fazer ainda!!!!)
class PersonagemEspacial:
	extends Personagem #não dá certo...






func _ready():
	miguel = Personagem.new('miguel',100,20)
	priscila = Personagem.new('priscila',100,10)
	
	print(priscila.hp)
	miguel.soco(priscila)
	print(priscila.nome+' está com '+str(priscila.hp)+' de hp')
	priscila.soco(miguel)
	print(miguel.nome+' está com '+str(miguel.hp)+' de hp')
	
	# For
	for i in range(0,3):
		print(i)
		
	#While
	var h =0
	while h <3:
		print(h)
		h +=1
		
	#--------Chamando Funções de outros Nós--------
	#Modo 1 de puxar de outro nó
	#var nodefilho = get_node("NodeFilho")
	#ou
	#Modo 2 de puxar de outro node (Prefiro essa)
	var nodefilho = $NodeFilho
	
	#Chamei a função
	nodefilho.teste()
	#Chamei a variável
	print(nodefilho.digitar)
	#------------------------------------------------
	
	pass