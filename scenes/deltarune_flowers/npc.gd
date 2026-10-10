extends Node


func run(npc:CharacterBody2D,player:CharacterBody2D)->void:
	var mode = npc.get_parent().get_node("DeltaruneFlowers")
	mode.start(player)
