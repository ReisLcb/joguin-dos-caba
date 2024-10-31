array_colisao_id = ds_list_create() //Lista de colisão
hitbox_list = ds_list_create()// lista dos que já colidiram

var colisao = instance_place_list(x,y, obj_enemie, array_colisao_id, false) // quantidade de colisões, armazenar na lista as colisções ocorridas

if (colisao > 0){ // se houverem colisões...
	for(i = 0; i < ds_list_size(array_colisao_id); i++){
		var inimigo = array_colisao_id[| i] // guarda o inimigo acertado
		
		if(!ds_list_find_value(hitbox_list, inimigo)){ // já foi acertado?
			ds_list_add(hitbox_list, inimigo) // adicionar colisão aos já verificados
			
			with(inimigo){
				vida_inimigo -= 5 // reduzir vidado inimigo
			}
		}
	}
}