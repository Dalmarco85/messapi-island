extends Node

signal hour_changed(hour:int)
signal season_changed(season:String)

@export var minutes_per_second := 12.0 # time speed
var minutes := 8 * 60 # start at 08:00
var day := 1
var season := "Primavera" # Primavera, Estate, Autunno, Inverno

func _process(delta):
    var prev_hour = int(minutes/60)
    minutes += minutes_per_second * delta
    if minutes >= 24*60:
        minutes = 0
        day += 1
        _maybe_advance_season()
    var hour = int(minutes/60)
    if hour != prev_hour:
        hour_changed.emit(hour)

func _maybe_advance_season():
    # Change every 10 days for demo
    var idx = ["Primavera","Estate","Autunno","Inverno"].find(season)
    if day % 10 == 0:
        season = ["Primavera","Estate","Autunno","Inverno"][(idx+1)%4]
        season_changed.emit(season)

func get_time_string() -> String:
    var h = int(minutes/60)
    var m = int(minutes) % 60
    return "%02d:%02d" % [h,m]
