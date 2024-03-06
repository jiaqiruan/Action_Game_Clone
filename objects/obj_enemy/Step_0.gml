pc = (Hp/MaxHp)*100;
if(Hp<=0){
	if(!audio_is_playing(sound_enemy_dying)&&!Dead){
		audio_play_sound(sound_enemy_dying,30,false);
	}
	Dead = true;
	//global.num_enemy--;
}
if(!Dead){
	if(distance_to_object(obj_player)>=200){
		move_towards_point(obj_player.x,obj_player.y,move_speed);
		image_speed = image_sp;
	}else{
		speed = 0;
		image_speed = 0;
		image_index = 1;
	}
	if(obj_player.x<x){
		image_xscale = -1;
	}else{
		image_xscale = 1;
	}

	if(!ready_shooting){
		ready_shooting = true;
		audio_play_sound(sound_enemy_gun,10,false);
		var inst = instance_create_layer(x,y,"Instances",obj_bullet_enemy);
		inst.direction = point_direction(x,y,obj_player.x,obj_player.y);
	}else{
		ready_shooting_cooldown--;
		shooting_cooldown--;
	}

	if(shooting_cooldown>=0){
		sprite_index = spr_enemy_firing;
		speed = 0;
	}else{
		sprite_index = spr_enemy_walking;
		speed = move_speed;
	}

	if(ready_shooting_cooldown<=0){
		ready_shooting = false;
		ready_shooting_cooldown = ready_shooting_cd;
		shooting_cooldown = shooting_cd;
	}
}
else{
	sprite_index = spr_enemy_death;
	speed = 0;
	image_speed = 1;
	Dead_Animation--;
	if(Dead_Animation<=0){
		image_speed = 0;
	}else{
		x+=0.5;
		y-=0.5;
	}
}