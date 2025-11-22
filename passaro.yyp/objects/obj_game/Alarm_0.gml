randomize()
var yy1= choose
(
	-90,-60,-30,0,30
)
var yy2= 0
if yy1= -30
{
	yy2= 410
}else if yy1= -60
{
	yy2= 390
}else if yy1= 0
{
	yy2= 440	
}else if yy1=30
{
	yy2=470
}else if yy1= -90
{
	yy2=360
}



/*
var yy2= choose
(
	390,410,440
)
*/
instance_create_layer(672,yy1,"Instances",obj_cano_inverso);
instance_create_layer(672,yy2,"Instances",obj_cano);

alarm[0]= 100







