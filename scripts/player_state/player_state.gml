function player_state_free(){
	var move = -keyboard_check(ord("A")) + keyboard_check(ord("D"))
	var dash = keyboard_check_pressed(ord("S"))
	var atk = mouse_check_button_pressed(mb_left)
	
	hsp = move * spd
	
	#region animações
	if (hsp == 0 && vsp == 0) sprite_index = spr_idle
	if (hsp != 0 && vsp == 0) sprite_index = spr_running
	
	if (vsp < 0 && hsp != 0) sprite_index = spr_jumping
	if (vsp < 0 && hsp == 0) sprite_index = spr_jumping
	if(vsp > 0.5) sprite_index = spr_falling
#endregion
	
	if (hsp > 0) image_xscale = 2.5
	if (hsp < 0) image_xscale = -2.5
	
	if (dash && hsp != 0 && candash){
		hsp = 0
		dash_dir = point_direction(x, y, x + move, y)
		status = player_state_dash
	}
	
	if (atk){
		image_index = 0
		status = player_state_atk
	}
}

function player_state_dash(){
	hsp = lengthdir_x(dash_force, dash_dir)
	dash_time++
	candash = false
	x += hsp
	
	if(dash_time >= dash_distance){
		dash_time = 0
		alarm[0] = 30
		status = player_state_free
	}
}

function player_state_atk(){	
	if(!instance_exists(obj_hitbox)){
		sprite_index = spr_player_atk
		instance_create_layer(x + (25 * image_xscale), y, layer, obj_hitbox)
	} 
	
	if(image_index >= image_number -1){
		if(instance_exists(obj_hitbox)) instance_destroy(obj_hitbox)
		status = player_state_free
	}
}