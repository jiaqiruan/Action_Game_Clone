if(place_meeting(x,y,obj_solid)){
	instance_create_layer(x,y,"Instances",obj_explsion);
	instance_destroy(self);
}
if(place_meeting(x,y,obj_player)&&obj_player.Hp>0){
	if(!obj_player.hit){
		obj_player.hit = true;
		global.hit = true;
		game_set_speed(1,gamespeed_fps);
	}
	/*if(x<obj_player.x){
		obj_player.MoveX(30);
	}else{
		obj_player.MoveX(-30);
	}
	if(y<obj_player.y){
		obj_player.MoveY(30);
	}else{
		obj_player.MoveY(-30);
	}*/
	instance_create_layer(x,y,"Instances",obj_explsion);
	instance_destroy(self);
	ScreenShake(20, 2, 0.4);
	obj_player.Hp--;
}