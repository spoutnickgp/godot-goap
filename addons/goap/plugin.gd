tool
extends EditorPlugin

func _enter_tree():
	add_tool_menu_item("GOAP Simulator", self, "open_simulator")
		
	add_custom_type(
		"GoapBase",
		"Node",
		preload("res://addons/goap/goap_base.gd"),
		preload("res://addons/goap/goap_planner.png")
	)
	
	add_custom_type(
		"GoapPlanner",
		"GoapBase",
		preload("res://addons/goap/goap_planner.gd"),
		preload("res://addons/goap/goap_planner.png")
	)
	
	add_custom_type(
		"GoapAction",
		"GoapBase",
		preload("res://addons/goap/goap_action.gd"),
		preload("res://addons/goap/goap_action.png")
	)

func _exit_tree():
	remove_tool_menu_item("GOAP Simulator")
	remove_custom_type("GoapPlanner")
	remove_custom_type("GoapAction")
	remove_custom_type("GoapBase")

func open_simulator(foo):
	var selection = get_editor_interface().get_selection().get_selected_nodes()
	var node = null
	if selection.size() == 1 && selection[0].get_script() == preload("res://addons/goap/goap_planner.gd"):
		node = selection[0]
	print(node)