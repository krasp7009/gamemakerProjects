hp = 1;
damageReceived = 0;

hsp = 0;
vsp = 0;
spd = 3;

directionToPlayer = 0;

dizzy = false;
takedShot = false;
shotEffectTime = 10; //number of frames in alarm


#region drawing section
uniformId = shader_get_uniform(shBlink, "blinkEffect");
blinkPercentage = 0; //1 is 100%

#endregion