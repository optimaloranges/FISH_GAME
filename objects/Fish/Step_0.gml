//fish return ro player///////////////////////////////////////////////////////////////

if (Player.sprite_index == Player_Left){
    move_and_collide(xv, -yv);
    splash = 85
}
if (Player.sprite_index == Player_Right){
    move_and_collide(-xv+0.15, -yv);
    splash = 85
}
    if (Player.sprite_index == Player_Up){
    move_and_collide(0, -yv+0.7);
    splash = 75
    g = 0.05  
}
    if (Player.sprite_index == Player_Down){
    move_and_collide(0, -yv*2);
    splash = 75
}
    yv = yv - g;
    fx = fx + xv
    fy = fy + yv;
    t = t + 1
// update fish count///////////////////////////////

if (t > splash ){
    global.FISH_COUNT = global.FISH_COUNT + 1
    audio_play_sound(Plus_One, 1, false)
    instance_destroy(Fish)
    
}