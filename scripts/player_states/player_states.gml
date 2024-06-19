 function player_state_free(){
	 
 var key_left = keyboard_check(ord("A"));
 var key_right = keyboard_check(ord("D"));
 var key_jump = keyboard_check(ord("W"));
 var key_dash = keyboard_check(vk_space);
 
 var move = key_right - key_left != 0;
 
 
  
   
 if(move){
	 
	 
	 
sprite_index = Spr_player_running;	 
  move_dir = point_direction(0,0,key_right - key_left,0);
 move_spd = approach(move_spd,move_spd_max,acc);
 
 }else{
	 sprite_index = Spr_player_idle;
     move_spd = approach(move_spd,0,dcc);
}
 hspd = lengthdir_x(move_spd,move_dir);
  if(hspd != 0){
   image_xscale = sign(hspd);
  }
  
  
 
  
   
  
  var ground = place_meeting(x,y+1,obj_wall);
 
   
 
  
  if(ground){
     coyote_time = coyote_time_max;
  }else{
	  coyote_time--;
	  
      if(vspd < 0){
	  sprite_index = Spr_player_jumpinicial;
	  }else if(vspd > 0){
		  sprite_index = Spr_player_fall;
	  
      }
}	  
	  
 	  
 
  
  if(key_jump and coyote_time > 0){
	  coyote_time = 0;
	 vspd = 0;
     vspd-=jump_height;
  
  }
  
  
   
 
  
  if(key_dash and dash){
		  hspd = 0;
		  vspd = 0
		  dash_time = 0;
		  dash = false;
		  alarm[0] = dash_deley;
	      state = player_states_dash;
  
 }
     
	  
	  
 
  function player_states_dash(){
 //ESTADO DE DASH
 	
 hspd = lengthdir_x(dash_force,move_dir);
 dash_time = approach(dash_time,dash_distance,1);
 if(dash_time >= dash_distance){
            state = player_state_free;
 } 
  }  
  
  
  if(keyboard_check(ord("L"))){
	  if(mouse_x < x) image_xscale = -1; else image_xscale = 1;
	  image_index = 0;
	  state = player_states_atk;
   
  
  
  }
 
 }
  
 function player_states_atk(){
	 
	 if(image_index > 0){
	 if(!instance_exists(obj_hitbox)){
	  instance_create_layer(x + (35 * image_xscale),y,layer,obj_hitbox);
        }
}
sprite_index = spr_player_ataque;
if(image_index >=image_number - 1){
	if(instance_exists(obj_hitbox)) instance_destroy(obj_hitbox);
	 state = player_state_free;
	 } 
 } 
  
 