x = obj_player.x;
y = obj_player.y+10;

if(mouse_x>x){
	image_yscale = 1;
	image_angle = point_direction(x,y,mouse_x,mouse_y);
}else{
	image_yscale = -1;
	image_angle = point_direction(x,y,mouse_x,mouse_y);
}

if(keyboard_check_pressed(vk_space)||mouse_check_button_pressed(mb_left)){
	if(!shooting){
		shooting = true;
		ScreenShake(20, 2, 0.4);
		audio_play_sound(sound_gunshot,10,false);
		var inst = instance_create_layer(x,y,"Instances",obj_bullet);
		inst.direction = point_direction(x,y,mouse_x,mouse_y);
	}
}

if(!shooting){
	image_index = 0;
}else{
	shooting_cooldown--;
}

if(shooting_cooldown<=0){
	shooting = false;
	shooting_cooldown = shooting_cd;
}

if(obj_player.Hp<=0){
	instance_destroy(self);
}