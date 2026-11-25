extends RefCounted


func run(npc: NPC, player: CharacterBody2D) -> void:
	print("BRIDGE run called")
	var trivia = npc.get_node_or_null("../TriviaGame")
	print("trivia = ", trivia)
	if trivia == null:
		push_warning("TriviaGame not found")
		return
	trivia.start()
