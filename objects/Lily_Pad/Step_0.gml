//////random bump machine/////////////////////////////////////////

if (bump > 0) bump = bump -1
if (bump <= 0) { 
if (sprite_index != Lily_Pad_Bump) {
        sprite_index = Lily_Pad_Bump
        if(frog == true) frog_obj.y = frog_obj.y+1
}
if (animation > 0) animation = animation -1
if(animation == 0) {
    if(frog==true) frog_obj.y = frog_obj.y-1
    bump = random(700)
    animation = 20
    sprite_index = Lily_Pad_Idle
}
}
