m_xRemainder = 0.0;
m_yRemainder = 0.0;

move_speed = 2;

ready_shooting = true;
ready_shooting_cd = room_speed*2;
ready_shooting_cooldown = ready_shooting_cd;
shooting_cd = irandom_range(20,30);
shooting_cooldown = shooting_cd;

image_sp = image_speed;

MaxHp = 3;
Hp = MaxHp;
pc = (Hp/MaxHp)*100;
Dead = false;
Dead_Animation = 40;