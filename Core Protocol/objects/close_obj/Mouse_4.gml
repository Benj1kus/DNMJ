// Перед удалением кнопок, просим их закрыть свои окна
with (skull_obj) {
    if (instance_exists(my_window)) instance_destroy(my_window);
}
with (info_obj) {
    if (instance_exists(my_window)) instance_destroy(my_window);
}


// Заставляем окно начать анимацию закрытия
with (tab_obj) {
    sprite_index = tab_close;
    image_index = 0;
}

// Удаляем кнопки
instance_destroy(skull_obj);
instance_destroy(info_obj);
instance_destroy(); // Удаляем сам close_obj