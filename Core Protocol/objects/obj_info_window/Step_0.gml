// 1. ПРОВЕРКА НАЖАТИЯ (Фокус и начало перетаскивания)
if (mouse_check_button_pressed(mb_left)) {
    // Проверяем, находится ли мышь над ЭТИМ окном
    if (mouse_x >= x && mouse_x <= x + width && mouse_y >= y && mouse_y <= y + height) {
        
        // Магия фокуса: перетаскиваем только то окно, которое сверху
        // Ищем самое "верхнее" окно (с минимальным depth) под мышкой
        var _top_window = noone;
        var _min_depth = 100000;
        
        with (obj_info_window) {
            if (mouse_x >= x && mouse_x <= x + width && mouse_y >= y && mouse_y <= y + height) {
                if (depth < _min_depth) {
                    _min_depth = depth;
                    _top_window = id;
                }
            }
        }

        // Если ЭТО окно оказалось самым верхним
        if (_top_window == id) {
            is_dragging = true;
            drag_offset_x = x - mouse_x;
            drag_offset_y = y - mouse_y;
            
            // Выводим на передний план
            global.window_depth -= 1;
            depth = global.window_depth;
        }
    }
}

// 2. ПРОЦЕСС ПЕРЕМЕЩЕНИЯ
if (is_dragging) {
    x = mouse_x + drag_offset_x;
    y = mouse_y + drag_offset_y;
    
    // Остановка перетаскивания
    if (mouse_check_button_released(mb_left)) {
        is_dragging = false;
    }
}

