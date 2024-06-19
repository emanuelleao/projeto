 view_enabled = true;
 view_visible[VIEW] = true;


if(instance_exists(global.view_target)){
x_to = global.view_target.x - VIEW_WIDHT / 2;
 y_to = global.view_target.y - VIEW_HEIGHT / 2;
 
 camera_set_view_pos(view_camera[VIEW],x_to,y_to);
}
