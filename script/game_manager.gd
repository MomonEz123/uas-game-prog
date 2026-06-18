extends Node

@onready var game_manager: Node = %GameManager
@onready var score_label: Label = $ScoreLabel
@onready var timer: Timer = $Timer
@onready var player: CharacterBody2D = $"../Player"


var score = 0
const MAX_COIN = 13

func _process(delta):
	score_label.global_position = player.global_position + Vector2(-130, -65)

func add_point():
	score += 1
	score_label.text = "You collected " + str(score) + "/" + str(MAX_COIN) + " coins."

	if score >= MAX_COIN:
		score_label.text = "GAME SELESAI!"
		timer.start()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
