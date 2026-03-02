if (sprite_index == tab_open) {
    sprite_index = tab_idle;
    image_index = 0;
}
if (sprite_index == tab_close) {
    instance_destroy(); // Удаляем объект после анимации закрытия
}