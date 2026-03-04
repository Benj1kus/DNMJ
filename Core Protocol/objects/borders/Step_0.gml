// ==========================================
// 0. МЕХАНИКА ПЕРЕМЕЩЕНИЯ КАРТЫ (WASD)
// ==========================================
var _move_speed = 15; 

var _h_move = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _v_move = keyboard_check(ord("S")) - keyboard_check(ord("W"));

if (_h_move != 0 || _v_move != 0) {
    x -= _h_move * _move_speed;
    y -= _v_move * _move_speed;
}

// ==========================================
// 1. МЕХАНИКА ЗУМА
// ==========================================
var _wheel = mouse_wheel_down() - mouse_wheel_up(); 

if (_wheel != 0) {
    var _zoom_speed = 0.15; 
    var _prev_zoom = zoom_level;

    if (_wheel < 0) {
        zoom_level += _zoom_speed * zoom_level; 
    } else {
        zoom_level -= _zoom_speed * zoom_level; 
    }

    zoom_level = clamp(zoom_level, zoom_min, zoom_max);

    if (zoom_level != _prev_zoom) {
        var _rel_x = (mouse_x - x) / map_scale_x;
        var _rel_y = (mouse_y - y) / map_scale_y;

        map_scale_x = base_scale_x * zoom_level;
        map_scale_y = base_scale_y * zoom_level;

        image_xscale = map_scale_x;
        image_yscale = map_scale_y;

        x = mouse_x - (_rel_x * map_scale_x);
        y = mouse_y - (_rel_y * map_scale_y);
    }
}

// ==========================================
// 1.5. ОГРАНИЧЕНИЕ ГРАНИЦ КАРТЫ (НОВОЕ)
// ==========================================
// Вычисляем реальный размер карты на экране прямо сейчас
var _map_w = sprite_get_width(color_map) * map_scale_x;
var _map_h = sprite_get_height(color_map) * map_scale_y;

// Рассчитываем, как далеко можно сдвинуть карту влево/вверх (это будут отрицательные числа)
var _min_x = min(0, room_width - _map_w);
var _max_x = max(0, room_width - _map_w);

var _min_y = min(0, room_height - _map_h);
var _max_y = max(0, room_height - _map_h);

// Жестко фиксируем координаты X и Y в пределах комнаты
x = clamp(x, _min_x, _max_x);
y = clamp(y, _min_y, _max_y);

// ==========================================
// 1.6. СИНХРОНИЗАЦИЯ ФОНА (ОДИН РАЗ ЗА КАДР)
// ==========================================
// Делаем это после WASD, зума и ограничений, чтобы фон идеально совпадал с границами
if (instance_exists(background)) {
    background.x = x;
    background.y = y;
    background.image_xscale = map_scale_x;
    background.image_yscale = map_scale_y;
}

// ==========================================
// 2. ЛОГИКА ОПРЕДЕЛЕНИЯ СТРАНЫ
// ==========================================
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

var _mx = (mouse_x - x) / map_scale_x;
var _my = (mouse_y - y) / map_scale_y;

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

// ==========================================
// 3. ОТКРЫТИЕ МЕНЮ
// ==========================================
if (mouse_check_button_pressed(mb_left) && visible) {
    if (!instance_exists(tab_obj)) {
        var _spawn_x = mouse_x + 20;
        var _spawn_y = mouse_y - 20;
        
        instance_create_depth(_spawn_x, _spawn_y, -1000, tab_obj);
        instance_create_depth(_spawn_x, _spawn_y, -1001, close_obj);
        
        var _skull = instance_create_depth(_spawn_x, _spawn_y, -1001, skull_obj);
        _skull.target_data = _country_data; 
        
        var _info = instance_create_depth(_spawn_x, _spawn_y, -1001, info_obj);
        _info.target_data = _country_data;  
        
        show_debug_message("Меню создано для: " + _country_data.name);
    }
}