if (vida_inimigo <= 0) instance_destroy();

var dir = point_direction(x, y, obj_player.x, obj_player.y)
x += lengthdir_x(0.5, dir)

