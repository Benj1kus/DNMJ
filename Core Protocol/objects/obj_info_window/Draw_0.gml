var _tw = sprite_get_width(windowcornertopleft);  // Ширина одного тайла (угла)
var _th = sprite_get_height(windowcornertopleft); // Высота тайла

// 1. Центр (растягиваем под размер окна)
draw_sprite_stretched(windowcentre, 0, x + _tw, y + _th, width - _tw*2, height - _th*2);

// 2. Границы (растягиваем стороны)
draw_sprite_stretched(windowbordertop, 0, x + _tw, y, width - _tw*2, _th); // Верх
draw_sprite_stretched(windowborderbottom, 0, x + _tw, y + height - _th, width - _tw*2, _th); // Низ
draw_sprite_stretched(windowborderleft, 0, x, y + _th, _tw, height - _th*2); // Лево
draw_sprite_stretched(windowborderight, 0, x + width - _tw, y + _th, _tw, height - _th*2); // Право

// 3. Углы (просто рисуем)
draw_sprite(windowcornertopleft, 0, x, y);
draw_sprite(windowcornertopright, 0, x + width - _tw, y);
draw_sprite(windowcornerbottomleft, 0, x, y + height - _th);
draw_sprite(windowcornerbottomright, 0, x + width - _tw, y + height - _th);

// 4. Текст (опционально)
draw_set_color(c_white);
draw_text(x + _tw, y + _th/2, title);
