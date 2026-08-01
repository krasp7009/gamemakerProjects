var _id = async_load[? "id"];
var _type = async_load[? "type"];

switch(_type)
{
	case network_type_connect:
		var _socket = async_load[? "socket"];
		var _inst = instance_create_layer(room_width*.15 + _socket * 64, room_height/2, "Instances", oPlayer);
		ds_map_add(clients, _socket, _inst);
		ds_list_add(sockets, _socket);
		
		buffer_seek(buffer, buffer_seek_start, 0);
		
		if (instance_number(oPlayer) > 1)
		{
			
			buffer_write(buffer, buffer_u8, typeOfBuffer.initGameForClient);
			for(var i = 0; i < array_length(instance_id); i++)
			{
				if (instance_id[i].object_index == oServer)
					continue;
			
				buffer_write(buffer, buffer_string, json_stringify(instance_id[i].self));
			}	
			show_debug_message("ENVIEI OQ N DEVIA"	)
			network_send_packet(_socket, buffer, buffer_tell(buffer));
		}
		
		
	break;
	
	case network_type_disconnect:
		instance_destroy(clients[? async_load[? "socket"]]);
		ds_map_delete(clients, async_load[? "socket"]);
		ds_list_delete(sockets, ds_list_find_index(sockets, async_load[? "socket"]));
		//network_destroy(_socket)
	break;
	
	case network_type_data:
		
	break;
}