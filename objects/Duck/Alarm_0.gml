///target change
d = choose(0,90,180,270)
m = choose(0,1)

if (m ==1){
    move=0.1
if (d==0){
    xd = 1
    yd=0
    sprite_index = Duckm_Right_Walk
}
if (d==90){
    xd = 0
    yd= -1
    sprite_index = Duckm_Up_Walk
}
if (d==180){
    xd = -1
    yd=0
    sprite_index = Duckm_Left_Walk
}
if (d==270){
    xd = 0
    yd=1
    sprite_index = Duckm_Down_Walk
}   
}
if(m==0){
  move=0  
  if (d==0){
    
    sprite_index = Duckm_Right
}  
if (d==90){
   
    sprite_index = Duckm_Up
} 
if (d==180){
    
    sprite_index = Duckm_Left
}      
if (d==270){

    sprite_index = Duckm_Down
}     
}     

alarm[0]= random(1000)