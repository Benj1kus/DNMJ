var _cm_sprite = color_map; 
var _sw = sprite_get_width(_cm_sprite);
var _sh = sprite_get_height(_cm_sprite);

if (!surface_exists(map_surface)) {
    map_surface = surface_create(_sw, _sh);
    surface_set_target(map_surface);
    draw_clear_alpha(c_black, 0);
    draw_sprite(_cm_sprite, 0, 0, 0); 
    surface_reset_target();
}

var _mx = mouse_x / map_scale_x;
var _my = mouse_y / map_scale_y;

// ИЗМЕНЕНИЕ 2: Читаем данные как структуру
var _country_data = undefined;

if (_mx >= 0 && _mx < _sw && _my >= 0 && _my < _sh) {
    var _color = surface_getpixel(map_surface, _mx, _my);
    _country_data = countries[$ string(_color)];
    
    if (!is_undefined(_country_data)) {
        if (sprite_index != _country_data.sprite) {
            sprite_index = _country_data.sprite;
        }
        visible = true;
    } else {
        visible = false;
    }
} else {
    visible = false;
}

// ИЗМЕНЕНИЕ 3: Передаем _country_data в кнопки при клике
if (mouse_check_button_pressed(mb_left) && visible) {
    if (!instance_exists(tab_obj)) {
        var _spawn_x = mouse_x + 20;
        var _spawn_y = mouse_y - 20;
        
        instance_create_depth(_spawn_x, _spawn_y, -1000, tab_obj);
        instance_create_depth(_spawn_x, _spawn_y, -1001, close_obj);
        
        // Создаем кнопки и ПРИВЯЗЫВАЕМ к ним данные
        var _skull = instance_create_depth(_spawn_x, _spawn_y, -1001, skull_obj);
        _skull.target_data = _country_data; // Передали!
        
        var _info = instance_create_depth(_spawn_x, _spawn_y, -1001, info_obj);
        _info.target_data = _country_data;  // Передали!
        
        show_debug_message("Меню создано для: " + _country_data.name);
    }
}