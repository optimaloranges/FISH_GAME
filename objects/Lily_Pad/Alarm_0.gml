var f = random(100)
if (frog == false and f >=90){
    frog_obj = instance_create_depth(x+3, y+1,depth-1, Frog)
    frog_obj.sprite_index = Frog_Idle
    frog_obj.image_xscale = 0.2
    frog_obj.image_yscale = 0.2
    frog = true
}
alarm[0]= random(3600) //3600