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

// ... (тут твой код отрисовки тайлов окна) ...

// 1. Включаем твой новый шрифт
draw_set_font(fnt_window);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _text_x = x + 20; // Отступ слева
var _text_y = y + 20; // Отступ сверху

// 2. Рисуем ТЕНЬ текста (черным цветом, чуть-чуть сместив вниз и вправо)
draw_set_color(c_black);
draw_text(_text_x + 2, _text_y + 2, title);

// 3. Рисуем ОСНОВНОЙ текст (белым цветом поверх тени)
var _custom_color = make_color_rgb(43, 222, 233); // Создаем твой цвет
draw_set_color(_custom_color); // Применяем его
draw_text(_text_x, _text_y, title); // Рисуем текст

// Сбрасываем шрифт по умолчанию, чтобы не сломать другие тексты в игре
draw_set_font(-1);