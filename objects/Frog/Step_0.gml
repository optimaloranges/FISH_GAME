if (croak <= 0){
    if (point_distance(Player.x, Player.y, x, y) <100) audio_play_sound(Croak, 1, false)
    sprite_index = Frog_Croak
    croak = random(4000)
}
if (sprite_index == Frog_Croak) animation = animation -1
    
if (animation <= 0){
    sprite_index = Frog_Idle
    animation = 7*5
    
}
croak = croak-1
