if (!instance_exists(my_window)) {
    var _spawn_x = x + 50; 
    var _spawn_y = y - 100;
    
    my_window = instance_create_depth(_spawn_x, _spawn_y, global.window_depth, obj_info_window);
    my_window.width = 400;
    my_window.height = 150;
    
    // БЕЗОПАСНОЕ чтение названия страны
    if (target_data != noone) {
        my_window.title = "INFECTED: " + target_data.name;
    } else {
        my_window.title = "INFECTED: UNNAMED";
    }
    
    sprite_index = skull_pressed;
    image_index = 0;
} else {
    instance_destroy(my_window);
    my_window = noone; 
    sprite_index = skull_idle;
    image_index = 0;
}