var _spdExist = variable_instance_exists(id, "spd");
var _direcExist = variable_instance_exists(id, "direc");
var _damageExist = variable_instance_exists(id, "spd");

spd = (_spdExist) ? spd : 1;
direc = (_direcExist) ? direc : 175;
damage = (_damageExist) ? damage : 0;