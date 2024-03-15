switch(gun_type){
	case "pistol":
		gun_spr = spr_gun_fire;
		reload_spr = spr_gun_reload;
		shooting_cd = 60;
		reloading_cd = room_speed*2;
		auto_fire = false;
		bullet_max = 10;
		icon = spr_gun_icon;
	break;
	case "rifle":
		gun_spr = spr_rifle;
		reload_spr = spr_rifle_reload;
		reloading_cd = room_speed*2;
		shooting_cd = 15;
		auto_fire = true;
		bullet_max = 30;
		icon = spr_rifle_icon;
	break;
}



x = obj_player.x;
y = obj_player.y+10;

if(mouse_x>x){
	image_yscale = 1;
	image_angle = point_direction(x,y,mouse_x,mouse_y);
}else{
	image_yscale = -1;
	image_angle = point_direction(x,y,mouse_x,mouse_y);
}

if(keyboard_check_pressed(ord("R"))){
	if(!reloading){
		reloading = true;
	}
}

if(!reloading){
	sprite_index = gun_spr;
	if(auto_fire){
		if(mouse_check_button(mb_left)){
			if(!shooting&&bullet_count>0){
				bullet_count--;
				instance_create_layer(x,y,"Instances",obj_bulletshell);
				shooting = true;
				ScreenShake(20, 5, 0.4);
				audio_play_sound(sound_gunshot,10,false);
				var inst = instance_create_layer(x,y,"Instances",obj_bullet);
				inst.direction = point_direction(x,y,mouse_x,mouse_y);
			}
		}
	}else{
		if(mouse_check_button_pressed(mb_left)){
			if(!shooting&&bullet_count>0){
				bullet_count--;
				instance_create_layer(x,y,"Instances",obj_bulletshell);
				shooting = true;
				ScreenShake(20, 2, 0.4);
				audio_play_sound(sound_gunshot,10,false);
				var inst = instance_create_layer(x,y,"Instances",obj_bullet);
				inst.direction = point_direction(x,y,mouse_x,mouse_y);
			}
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
}else{
	sprite_index = reload_spr;
	reloading_cooldown--;
}

if(reloading_cooldown<=0){
	reloading = false;
	reloading_cooldown = reloading_cd;
	bullet_count = bullet_max;
}



if(obj_player.Hp<=0){
	instance_destroy(self);
}