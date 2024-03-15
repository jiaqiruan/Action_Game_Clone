/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 
draw_text(780,550,"Space");
if(dash_ready){
	draw_sprite(spr_dash,0,800,600);
}else{
	draw_sprite(spr_dash_noready,0,800,600);
}
