//////random bump machine/////////////////////////////////////////

if (bump > 0) bump = bump -1
if (bump <= 0) { 
if (sprite_index != Lily_Pad_Bump) {
        sprite_index = Lily_Pad_Bump
        if(frog == true) frog_obj.y = frog_obj.y+1
}
if (animation > 0) animation = animation -1
if(animation == 0) {
    if(frog==true and frog_obj.sprite_index == Frog_Idle) frog_obj.y = frog_obj.y-1
    bump = random(700)
    animation = 20
    sprite_index = Lily_Pad_Idle
}
}

//frog jump////////////////////////////////////////////////////////////////////
if (frog==true){
if ( jump <= 0 and frog_obj.sprite_index == Frog_Idle) {
    var layer_id = layer_get_id("Water");
    var map_id = layer_tilemap_get_id(layer_id);
    var right = tilemap_get_at_pixel(map_id, frog_obj.x+100,frog_obj.y)
    var left = tilemap_get_at_pixel(map_id, frog_obj.x-100,frog_obj.y)
    if (right != 0) frog_obj.sprite_index = Frog_Jump_Right
    if (left != 0)  frog_obj.sprite_index = Frog_Jump_Left
    if (right!=0 and left!=0){
    if ((Player.x - frog_obj.x) >=0 ) frog_obj.sprite_index = Frog_Jump_Left
    if ((Player.x - frog_obj.x) < 0) frog_obj.sprite_index = Frog_Jump_Right
    }
    }
   
if (frog_obj.sprite_index == Frog_Jump_Left){
    frog_obj.x = frog_obj.x -xv
    frog_obj.y = frog_obj.y -yv
    splash = 30
    yv = yv - g;
    t = t + 1
}
if (frog_obj.sprite_index == Frog_Jump_Right) {
    frog_obj.x = frog_obj.x +xv
    frog_obj.y = frog_obj.y -yv
    splash = 30
    yv = yv - g;
    t = t + 1
    }      
if (t > splash and frog_obj.sprite_index != Frog_Splash ){//end animation
    audio_play_sound(Bobber_Splash_snd, 1, false)
    frog_obj.sprite_index = Frog_Splash
    frog_obj.image_xscale = 1
    frog_obj.image_yscale = 1
    jump = 10000//10000
    t=0
    yv=1
}
if (frog_obj.sprite_index == Frog_Splash ) jumpanimation = jumpanimation -1
if (jumpanimation <= 0) {
    frog = false
    instance_destroy(frog_obj)
    jumpanimation = 25
} 
 if  (point_distance(Player.x, Player.y, x, y) <30) jump = 0
  jump = jump -1  
}    
