/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 
if(is_rifle){
	var bullet_message = string(bullet_count_rifle)+"/"+string(bullet_max_rifle);
}else{
	var bullet_message = string(bullet_count_pistol)+"/"+string(bullet_max_pistol);
}

draw_text(1000,500,bullet_message);
draw_sprite(icon,0,1000,600);