// 1. Курсор всегда следует за реальными координатами мыши
x = mouse_x;
y = mouse_y;

// 2. Логика таймера для зума
if (zoom_timer > 0) {
    zoom_timer -= 1; // Уменьшаем таймер каждый кадр
}

// Если игрок крутит колесико — "заводим" таймер на 15 кадров (четверть секунды)
if (mouse_wheel_up() || mouse_wheel_down()) {
    zoom_timer = 15; 
}

// 3. Выбор нужного спрайта
if (mouse_check_button(mb_left)) {
    // Если зажата левая кнопка мыши — спрайт перетаскивания (даже если крутим колесо)
    sprite_index = drag; 
} 
else if (zoom_timer > 0) {
    // Если ЛКМ не зажата, но таймер зума еще работает — спрайт зума
    sprite_index = zoom; 
} 
else {
    // Обычное состояние
    sprite_index = cursor; 
}

// --- ЛОГИКА ШЛЕЙФА ---
// Проверяем расстояние от текущей мыши до последнего созданного кружка
var _dist = point_distance(last_trail_x, last_trail_y, mouse_x, mouse_y);

// Если мышка отдалилась на нужное расстояние (trail_spacing)
if (_dist >= trail_spacing) {
    // Создаем кружок чуть "глубже" курсора, чтобы он был под ним (depth + 1)
    instance_create_depth(mouse_x, mouse_y, depth + 1, circle_obj);
    
    // Обновляем координаты последнего кружка
    last_trail_x = mouse_x;
    last_trail_y = mouse_y;
}