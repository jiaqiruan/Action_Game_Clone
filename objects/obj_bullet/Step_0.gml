if(place_meeting(x,y,obj_solid)){
	instance_create_layer(x,y,"Instances",obj_explsion);
	instance_destroy(self);
}
var inst = instance_place(x,y,obj_enemy);
if(inst != noone&&inst.Hp>0){
	if(x<inst.x){
		inst.x += 30;
	}else{
		inst.x -= 30;
	}
	if(y<inst.y){
		inst.y += 30;
	}else{
		inst.y -= 30;
	}
	instance_create_layer(x,y,"Instances",obj_explsion);
	instance_destroy(self);
	inst.Hp--;
}