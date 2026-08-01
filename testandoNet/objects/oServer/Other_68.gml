var _id = async_load[? "id"];
var _type = async_load[? "type"];

switch(_type)
{
	case network_type_connect:
		var _socket = async_load[? "socket"];
		var _inst = instance_create_layer(room_width*.15 + _socket * 64, room_height/2, "Instances", oPlayer);
		ds_map_add(clients, _socket, _inst);
		ds_list_add(sockets, _socket);
		
	break;
	
	case network_type_disconnect:
		instance_destroy(clients[? async_load[? "socket"]]);
		ds_map_delete(clients, async_load[? "socket"]);
		ds_list_delete(sockets, ds_list_find_index(sockets, async_load[? "socket"]));
		//network_destroy(_socket)
	break;
}