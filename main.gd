extends Node2D

@onready var time := $GameTime
@onready var sky_overlay := $SkyOverlay
@onready var clock_label := $CanvasLayer/Clock
@onready var season_label := $CanvasLayer/Season
var boat_scene := preload("res://scenes/Boat.tscn")
var boat_timer := 0.0

func _ready():
    time.hour_changed.connect(_on_hour_changed)
    time.season_changed.connect(_on_season_changed)
    _on_season_changed(time.season)
    _on_hour_changed(int(time.minutes/60))

func _process(delta):
    # update clock
    clock_label.text = time.get_time_string()
    # day/night tint based on hour
    var h = int(time.minutes/60)
    var alpha := 0.0
    if h < 6:
        alpha = 0.6
    elif h < 8:
        alpha = lerp(0.6, 0.0, float(h-6)/2.0)
    elif h < 18:
        alpha = 0.0
    elif h < 20:
        alpha = lerp(0.0, 0.6, float(h-18)/2.0)
    else:
        alpha = 0.6
    sky_overlay.modulate = Color(0,0,0,alpha)
    # spawn boats from the top periodically (simulate raids)
    boat_timer += delta
    var base_interval := 8.0
    if time.season == "Inverno":
        base_interval = 12.0 # mare agitato, meno sbarchi
    if boat_timer >= base_interval:
        boat_timer = 0.0
        var b = boat_scene.instantiate()
        b.position = Vector2(randf_range(100, 860), -30)
        add_child(b)

func _on_hour_changed(h:int) -> void:
    pass

func _on_season_changed(s:String) -> void:
    season_label.text = s
