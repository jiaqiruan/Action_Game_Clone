if(global.hit){
	hitting_cooldown--;
}

if(hitting_cooldown<=0){
	global.hit = false;
	hitting_cooldown = hitting_cd;
	game_set_speed(normal_speed,gamespeed_fps);
}
enemy_wave_cooldown--;
if(enemy_wave_cooldown<=0){
	enemy_wave_cooldown = enemy_wave_cd;
	CreateEnemies();
}
