m_xRemainder = 0.0;
m_yRemainder = 0.0;

move_speed = 4;

MaxHp = 10;
Hp = MaxHp;
pc = (Hp/MaxHp)*100;

Dead = false;
Dead_Animation = 40;

dash_ready = true;
dash_charge = 0;
dash = false;
dashing_cd = 30;
dashing_cooldown = dashing_cd;

hit = false;
hitting_cd = room_speed/3;
hitting_cooldown = hitting_cd;

audio_play_sound(sound_battle,20,true);