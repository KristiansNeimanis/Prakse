extends Node

@onready var pick_up_fx = $"."
@export var pickup_sounds : Array[AudioStreamMP3]
@onready var pick = $Pick

var page_1 = true
var page_2 = true
var page_3 = true
var page_4 = true
var page_5 = true
var page_6 = true
var page_7 = true

func _process(delta):
	if Autoloads.collected_collectibles == 1 and page_1 == true:
		play_pick_up()
		page_1 = false
	if Autoloads.collected_collectibles == 2 and page_2 == true:
		play_pick_up()
		page_2 = false
	if Autoloads.collected_collectibles == 3 and page_3 == true:
		play_pick_up()
		page_3 = false
	if Autoloads.collected_collectibles == 4 and page_4 == true:
		play_pick_up()
		page_4 = false
	if Autoloads.collected_collectibles == 5 and page_5 == true:
		play_pick_up()
		page_5 = false
	if Autoloads.collected_collectibles == 6 and page_6 == true:
		play_pick_up()
		page_6 = false
	if Autoloads.collected_collectibles == 7 and page_7 == true:
		play_pick_up()
		page_7 = false

func play_pick_up():
	var audio_player : AudioStreamPlayer3D = AudioStreamPlayer3D.new()
	audio_player.area_mask = 2
	audio_player.volume_db = 10
	var random_index : int = randi_range(0,pickup_sounds.size() - 1)
	audio_player.stream = pickup_sounds[random_index]
	audio_player.pitch_scale = randf_range(1.0,1.5)
	pick_up_fx.add_child(audio_player)
	audio_player.play()
	audio_player.finished.connect(func destroy(): audio_player.queue_free())
