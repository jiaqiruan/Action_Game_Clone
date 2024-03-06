if(hit){
	hitting_cooldown--;
	image_alpha = 0.4;
}else{
	image_alpha = 1;
}

if(hitting_cooldown<=0){
	hit = false;
	hitting_cooldown = hitting_cd
}

if(!Dead){
	if(Hp<=4){
		if(audio_is_playing(sound_battle)){
			audio_stop_sound(sound_battle);
		}
		if(!audio_is_playing(sound_lowhp)){
			audio_play_sound(sound_lowhp,20,true);
		}
	}
	if(keyboard_check(ord("W"))){
		MoveY(-move_speed);
	}
	if(keyboard_check(ord("S"))){
		MoveY(move_speed);
	}
	if(keyboard_check(ord("A"))){
		MoveX(-move_speed);
	}
	if(keyboard_check(ord("D"))){
		MoveX(move_speed);
	}

	if(!keyboard_check(ord("A"))&&!keyboard_check(ord("W"))&&!keyboard_check(ord("S"))&&!keyboard_check(ord("D"))){
		image_speed = 0;
	}else{
		image_speed = 1;
	}
}else{
	sprite_index = spr_player_die;
	image_speed = 1;
	Dead_Animation--;
	if(Dead_Animation<=0){
		image_speed = 0;
	}
}

pc = (Hp/MaxHp)*100;

if(Hp<=0){
	Dead = true;
}

camera_set_view_pos(view_camera[0],x-camera_get_view_width(view_camera[0])/2,y-camera_get_view_height(view_camera[0])/2);


