if(hit){
	draw_set_alpha(0.2);
}else{
	draw_set_alpha(1);
}

draw_self();
if(!Dead){
	draw_healthbar(x-25, y-35, x+25, y-45,pc , c_black, c_red, c_lime, 0, true, true);
	draw_text(x,y-50,string(global.num_enemy));
}

