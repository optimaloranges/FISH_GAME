/////////////////bobber cast animation/////////////////////////////////////

if (casting == true){
 if (Player.sprite_index == Player_Left){
    move_and_collide(-xv, -yv);
    splash = 55
}
if (Player.sprite_index == Player_Right){
    move_and_collide(xv, -yv);
    splash = 53
}
    if (Player.sprite_index == Player_Up){
    move_and_collide(0, -yv*2);
    splash = 70
    g = 0.02    
}
    if (Player.sprite_index == Player_Down){
    move_and_collide(0, -yv);
    splash = 77
}
    yv = yv - g;
    bx = bx + xv
    by = by + yv;
    t = t + 1
if (t > splash ){//end animation
    audio_play_sound(Bobber_Splash_snd, 1, false)
    Bobber.sprite_index = Bobber_Splash
    bobberanimation = 6;
    casting = false; 
}
}
/////////////////////////////////////////////////splash animation
if (bobberanimation >= 0 and casting == false){
    bobberanimation = bobberanimation -1;
}
if(bobberanimation < 0 and casting == false and waiting = false) {
    waiting = true;
    sprite_index = Bobber_Still
    nibble = random(1000);
    nibblecount = random(4);
    //nibblecount = 1;
    
    
    
}
/// are the fish biting??////////////////////////////////////////////////////
if (waiting == true){///nibble code///
   if (nibblecount > 0){
    if(nibble < 0){
        if(sprite_index == Bobber_Still){
            audio_play_sound(Blub, 1, false)
            sprite_index = Bobber_Nibble;
            nibble = 6;
            
        }
        if(sprite_index == Bobber_Nibble and nibble <0){
            sprite_index = Bobber_Still
            nibble = random(500);
            nibblecount = nibblecount - 1
            
        }
    }
    nibble = nibble-1;
} 

/////fish on the line//////////////////////////////////////////////////////////
else {

       
if (sprite_index != Bobber_Bite and offtheline==false) {//set reaction timer//
    sprite_index=Bobber_Bite
    audio_play_sound(Fish_Thrash,1, false)
    react = 0
    }   
if(sprite_index==Bobber_Bite)  {
    react = react + 1
    if(react> 100){
            
            offtheline = true
    }
    if(keyboard_check_released(vk_space)){
        if (react < 50){ 
            instance_create_depth(Bobber.x, Bobber.y, depth-3, Fish)
            Fish.sprite_index = fish
            instance_destroy(Bobber)
        }
        
    }
}
}
}


///////////////////////////////////fish off the line///////////////////////////////
if (offtheline==true){
    sprite_index = Bobber_Still
    
}
///////////////////////////////////////////cancel/////////////////////////////////
if(keyboard_check_released(vk_space)){
    audio_stop_sound(Line_Cast)
    instance_destroy(Bobber)
        }