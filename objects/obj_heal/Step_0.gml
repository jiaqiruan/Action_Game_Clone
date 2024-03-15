/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 
if(place_meeting(x,y,obj_player)){
	if(obj_player.Hp<obj_player.MaxHp&&!obj_player.Dead){
		obj_player.Hp++;
		instance_destroy(self);
	}
}