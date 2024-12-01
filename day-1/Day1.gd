extends Node2D

var data: Array = []
var left_column: Array = []
var right_column: Array = []


func _ready() -> void:
	load_file("res://day-1/input.txt")
	format_data()
	var distance = get_total_distance(left_column, right_column)
	var sim_score = get_similarity_score(left_column, right_column)
	
	# Challenge One Output
	print("Total Distance: %s" % distance)
	
	# Challenge Two Output
	print("Similarity Score: %s" % sim_score)


func load_file(file_path: String) -> void:
	var file := FileAccess.open(file_path, FileAccess.READ)

	while !file.eof_reached():
		var line = file.get_line()
		var split_line = line.split("   ")
		data.append(split_line)
	
	file.close()


func format_data() -> void:
	for i in range(data.size() - 1):
		left_column.append(int(data[i][0]))
		right_column.append(int(data[i][1]))
		
	left_column.sort()
	right_column.sort()


func get_total_distance(left_side: Array, right_side: Array) -> int:
	var total_distance := 0
	for i in range(left_side.size()):
		total_distance += abs(left_side[i] - right_side[i])
	
	return total_distance


func get_similarity_score(left_side: Array, right_side: Array) -> int:
	var score := 0
	for item in left_side:
		if right_side.has(item):
			score += item * right_side.count(item)
	
	return score
