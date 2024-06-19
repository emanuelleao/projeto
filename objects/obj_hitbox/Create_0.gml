collision_list = ds_list_create();//lista da dolisao
hitbox_list = ds_list_create();// lista dos objetos ja verificados
var c = instance_place_list(x,y,obj_target,collision_list,false);

if (c > 0){
    for(var i = 0;i < ds_list_size(collision_list);i++){
	    var target = collision_list[| i ];
		if(!ds_list_find_index(hitbox_list,target)){
		with(target){
		    life-=5;
			
			
		    }
		}
	}
}
