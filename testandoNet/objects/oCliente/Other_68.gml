var type = async_load[? "type"];
show_debug_message("socket que me ativou {0}", async_load[? "id"])

switch(type)
{
	case network_type_data:
		var buffer = async_load[? "buffer"];
		var _typeOfBuffer = buffer_read(buffer, buffer_u8);
	
		
		if (_typeOfBuffer == typeOfBuffer.initGameForClient)
		{
			while(buffer_tell(buffer) != async_load[? "size"])
			{
				jsonInstance = buffer_read(buffer, buffer_string);
				structInstance = (json_parse(jsonInstance));
				if (structInstance.object_index != object_index)
					instance_create_layer(structInstance.x, structInstance.y, "Instances", 
					structInstance.object_index, structInstance);
				
			}
		}
		
	break;
}