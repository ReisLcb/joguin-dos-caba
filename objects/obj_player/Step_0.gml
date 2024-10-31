status()

#region colisão
if place_meeting(x+hsp, y, obj_spawner){
	while !place_meeting(x+sign(hsp), y, obj_spawner){
		x+= sign(hsp)
	}
	hsp = 0
} x += hsp
	
if place_meeting(x, y+vsp, obj_chao){
	while !place_meeting(x, y+sign(vsp), obj_chao){
		y += sign(vsp)
	}
	vsp = 0
} y += vsp
#endregion

#region pulos e gravidade
	if keyboard_check_pressed(vk_space) && pulos > 0{
		vsp = jspeed
		pulos--
	}
	
	if place_meeting(x,y+1, obj_chao){
	pulos = 2
}else vsp += grav
#endregion

if place_meeting(x, y, obj_enemie) && levar_dano{
	vida -= 5
	if (vida <= 0) room_restart()
	
	levar_dano = false
	alarm[1] = 60
}

