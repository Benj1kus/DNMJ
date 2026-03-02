sprite_index = info_pressed;
image_index = 0;

// Событие Left Pressed
if (!instance_exists(my_window)) {
    // ОКНА НЕТ -> ОТКРЫВАЕМ
    var _spawn_x = x + 50;
    var _spawn_y = y - 100;
    
    my_window = instance_create_depth(_spawn_x, _spawn_y, global.window_depth, obj_info_window);
    my_window.width = 250;
    my_window.height = 300;
    my_window.title = "Данные страны";
    
    sprite_index = info_pressed;
    image_index = 0;
} else {
    // ОКНО ЕСТЬ -> ЗАКРЫВАЕМ
    instance_destroy(my_window);
    my_window = noone;
    
    sprite_index = info_idle;
    image_index = 0;
}