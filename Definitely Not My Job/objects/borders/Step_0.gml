var _cm_sprite = color_map; // ТУТ НАЗВАНИЕ СПРАЙТА ЦВЕТНОЙ КАРТЫ
var _sw = sprite_get_width(_cm_sprite);
var _sh = sprite_get_height(_cm_sprite);

// 1. Управляем поверхностью (Surface)
if (!surface_exists(map_surface)) {
    map_surface = surface_create(_sw, _sh);
    surface_set_target(map_surface);
    draw_clear_alpha(c_black, 0);
    draw_sprite(_cm_sprite, 0, 0, 0); 
    surface_reset_target();
}

// 2. Рассчитываем позицию мыши относительно объекта colormap
// Если colormap стоит в (0,0), то просто делим на масштаб
var _mx = mouse_x / map_scale_x;
var _my = mouse_y / map_scale_y;

// 3. Считываем цвет и меняем спрайт
if (_mx >= 0 && _mx < _sw && _my >= 0 && _my < _sh) {
    var _color = surface_getpixel(map_surface, _mx, _my);
    var _found_sprite = countries[$ string(_color)];
    
    if (!is_undefined(_found_sprite)) {
        if (sprite_index != _found_sprite) {
            sprite_index = _found_sprite;
        }
        visible = true;
    } else {
        visible = false;
    }
} else {
    visible = false;
}