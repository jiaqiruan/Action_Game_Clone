// v2.3.0的脚本资产已更改，请参见\ n // https://help.yoyogames.com/hc/en-us/articles/360005277377
function CreateEnemies(){
	for(var i = 8;i>0;i--){
		var randomX = irandom_range(400,2000);
		var randomY = irandom_range(200,1000);
		instance_create_layer(randomX,randomY,"Instances",obj_enemy);
	}
}