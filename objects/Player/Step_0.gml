//facing water?////////////////////////////////////////////////////////////////////////
d[0] = 0;
d[1] = 0;
if (sprite_index == Player_Left or sprite_index == Player_Left_Walk) d[0] = -1;
if (sprite_index == Player_Right or sprite_index == Player_Right_Walk) d[0] = 1;
if (sprite_index == Player_Up or sprite_index == Player_Up_Walk) d[1] = -1;
if (sprite_index == Player_Down or sprite_index == Player_Down_Walk) d[1] = 1;

var layer_id = layer_get_id("Water");
var map_id = layer_tilemap_get_id(layer_id);
var tile = tilemap_get_at_pixel(map_id, Player.x+(d[0]*60),Player.y+(d[1]*60));

//is space pressed?/////////////////////////////////////////////////////////////////////////////

if (keyboard_check_pressed(vk_space)){
     space = 1;
    audio_stop_sound(Pond_Walk)
    
    object_set_sprite(Bobber, Bobber_Cast)
}
if (keyboard_check_released(vk_space)){
    space = 0;
    rodanimation = 11;
    instance_destroy(Rod);
   
}

// fishing///////////////////////////////////////////////////////////////////////////////
if(space == 1 && tile != 0)
{
    
    move_speed=0; 
    if (sprite_index==Player_Up_Walk ) sprite_index = Player_Up;
    if (sprite_index==Player_Left_Walk) sprite_index = Player_Left;
    if (sprite_index==Player_Right_Walk) sprite_index = Player_Right;
    if (sprite_index==Player_Down_Walk) sprite_index = Player_Down;
    
    if (instance_exists(Rod)){//rod animation timer//
        if(rodanimation > -1){
            
            rodanimation=rodanimation-1;
        }
        else
        {
            if (instance_exists(Bobber) == false ){//create rod idle//
                instance_create_depth(x, y, depth, Bobber)
            }
            instance_destroy(Rod);
            if(sprite_index==Player_Up) {
                object_set_sprite(Rod, Rod_Up);
                xx = x;
                dep = depth + 1;
                yy = y;
            }
            if(sprite_index==Player_Left) {
                object_set_sprite(Rod, Rod_Left);
                xx = x;
                dep = depth -1;
                yy = y;
            }
            if(sprite_index==Player_Right) {
                object_set_sprite(Rod, Rod_Right);
                xx = x+1;
                dep = depth -1;
                yy = y;
            }
            if(sprite_index==Player_Down) {
                object_set_sprite(Rod, Rod_Down); 
                xx = x;
                dep = depth -1;
                yy = y;
            }           
            instance_create_depth(xx, yy, dep, Rod)
        }
   
}
    
    else{
        
        if(sprite_index==Player_Up) {///create rod casting////////////
                object_set_sprite(Rod, Rod_Up_Cast);
                xx = x;
                dep = depth - 1;
                yy = y;
            }
            if(sprite_index==Player_Left) {
                object_set_sprite(Rod, Rod_Left_Cast);
                xx = x;
                dep = depth -1;
                yy = y;
            }
            if(sprite_index==Player_Right) {
                object_set_sprite(Rod, Rod_Right_Cast);
                xx = x+1;
                dep = depth -1;
                yy = y;
            }
            if(sprite_index==Player_Down) {
                object_set_sprite(Rod, Rod_Down_Cast); 
                xx = x;
                dep = depth -1;
                yy = y;
            }        
        var _inst = instance_create_depth(xx, yy, dep, Rod);
        _inst.image_angle = point_direction(0,0, 0, 0);
        
}

    

}
//roaming/////////////////////////////////////////////////////////////////////
else{
    move_speed = 2;
    
    
//movement//
    var xd = keyboard_check(ord("D")) - keyboard_check(ord("A"));
    var yd = keyboard_check(ord("S")) - keyboard_check(ord("W")); 
    move_and_collide(xd*move_speed, yd*move_speed, boundary);
	
	if (abs(xd)+abs(yd) != 0 and audio_is_playing(Pond_Walk) != true){
		audio_play_sound(Pond_Walk, 1, true)
	}
	if(abs(xd)+abs(yd) == 0){
		audio_stop_sound(Pond_Walk)
	}



//room boundary enforcment//
if (Player.x > room_width-sprite_width)  Player.x = room_width-sprite_width;
else if (Player.x < 0) Player.x = 0;
else if (Player.y > room_height-sprite_height) Player.y = room_height-sprite_height;
else if (Player.y < 0)  Player.y = 0;
   


//walk animation//
if (xd != 0 or yd != 0){
    if (yd == -1) sprite_index = Player_Up_Walk;
    else if (yd == 1) sprite_index = Player_Down_Walk;
    else if (xd == 1) sprite_index = Player_Right_Walk;
    else if (xd == -1) sprite_index = Player_Left_Walk;
        
}
else{
    if (sprite_index==Player_Up_Walk) sprite_index = Player_Up;
    if (sprite_index==Player_Left_Walk) sprite_index = Player_Left;
    if (sprite_index==Player_Right_Walk) sprite_index = Player_Right;
    if (sprite_index==Player_Down_Walk) sprite_index = Player_Down;
        
    
}
}
//random blink////////////////////////////////////////////////////////////////
if (blinkt <= 0 and object_exists(Rod) == false){
if (blink == 0){
if (sprite_index==Player_Up) sprite_index=Player_Up;
else if (sprite_index==Player_Left) sprite_index=Player_Left_Blink;
else if (sprite_index==Player_Right) sprite_index=Player_Right_Blink;
else if (sprite_index==Player_Down) sprite_index=Player_Down_Blink;
  
blinkt = 10; 
blink = 1;    
}
else{
    
if (sprite_index==Player_Up) sprite_index=Player_Up;
else if (sprite_index==Player_Left_Blink) sprite_index=Player_Left;
else if (sprite_index==Player_Right_Blink) sprite_index=Player_Right;
else if (sprite_index==Player_Down_Blink) sprite_index=Player_Down;
    
blinkt = random(500); 
blink = 0;   
}}
blinkt = blinkt-1