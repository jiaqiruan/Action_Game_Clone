

if(mouse_wheel_down()||mouse_wheel_up()){
	if(!reloading){
		is_rifle = !is_rifle;
		audio_play_sound(sound_changeWeapon,10,false);
	}
}

switch(is_rifle){
	case false:
		gun_spr = spr_gun_fire;
		reload_spr = spr_gun_reload;
		shooting_cd = 60;
		reloading_cd = room_speed*2;
		auto_fire = false;
		icon = spr_gun_icon;
		gun_sound = sound_gunshot;
	break;
	case true:
		gun_spr = spr_rifle;
		reload_spr = spr_rifle_reload;
		reloading_cd = room_speed*2;
		shooting_cd = 5;
		auto_fire = true;
		icon = spr_rifle_icon;
		gun_sound = sound_rifle;
	break;
}
if(!shooting){
	shooting_cooldown = shooting_cd;
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
		audio_play_sound(sound_reload,10,false);
	}
}

if(!reloading){
	sprite_index = gun_spr;
	if(auto_fire){
		if(mouse_check_button(mb_left)){
			if(!shooting&&bullet_count_rifle>0){
				bullet_count_rifle--;
				instance_create_layer(x,y,"Instances",obj_bulletshell);
				shooting = true;
				ScreenShake(20, 5, 0.4);
				audio_play_sound(gun_sound,10,false);
				var inst = instance_create_layer(x,y,"Instances",obj_bullet);
				inst.direction = point_direction(x,y,mouse_x,mouse_y);
			}
		}
	}else{
		if(mouse_check_button_pressed(mb_left)){
			if(!shooting&&bullet_count_pistol>0){
				bullet_count_pistol--;
				instance_create_layer(x,y,"Instances",obj_bulletshell);
				shooting = true;
				ScreenShake(20, 2, 0.4);
				audio_play_sound(gun_sound,10,false);
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
	if(is_rifle){
		bullet_count_rifle = bullet_max_rifle;
	}else{
		bullet_count_pistol = bullet_max_pistol;
	}
}



if(obj_player.Hp<=0){
	instance_destroy(self);
}