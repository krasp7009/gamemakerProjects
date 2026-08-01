#macro PORT 64350
#macro MAX_CLIENTS 3

server = network_create_server(network_socket_tcp, PORT, MAX_CLIENTS);

clients = ds_map_create();
sockets = ds_list_create();

buffer = buffer_create(1024, buffer_grow, 1)