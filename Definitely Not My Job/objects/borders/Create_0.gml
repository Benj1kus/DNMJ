// Твои настройки масштаба
map_scale_x = 3.285714;
map_scale_y = 3.305085;

// Сразу масштабируем сам объект подсветки
image_xscale = map_scale_x;
image_yscale = map_scale_y;

visible = false;
map_surface = -1; 
countries = {};

// Функция добавления страны (теперь названия совпадают с твоими спрайтами)
function add_c(_r, _g, _b, _sprite) {
    var _color = make_color_rgb(_r, _g, _b);
    countries[$ string(_color)] = _sprite;
}

// --- СПИСОК СТРАН (БЕЗ spr_) ---
add_c(255, 181, 0, alaska);
add_c(167, 0, 156, alger);
add_c(0, 51, 255, amazona);
add_c(104, 167, 0, arab);
add_c(167, 0, 44, argentina);
add_c(46, 66, 0, auteast);
add_c(0, 66, 8, autup);
add_c(0, 66, 48, autwest);
add_c(56, 0, 66, bengal);
add_c(149, 0, 255, brazil);
add_c(101, 255, 0, califor);
add_c(114, 89, 0, centralafrika);
add_c(0, 255, 155, centralamerica);
add_c(255, 0, 209, centralbrazil);
add_c(114, 60, 0, chad);
add_c(255, 0, 67, chile);
add_c(39, 0, 66, china);
add_c(0, 136, 255, columbia);
add_c(167, 106, 0, darf);
add_c(60, 167, 0, egypt);
add_c(0, 255, 3, florida);
add_c(167, 0, 112, frank);
add_c(114, 26, 0, gabon);
add_c(147, 0, 167, germany);
add_c(17, 0, 167, greece);
add_c(3, 0, 114, greendown);
add_c(88, 0, 114, greeneast);
add_c(45, 0, 114, greenwest);
add_c(63, 0, 255, guat);
add_c(167, 0, 75, Iberia);
add_c(0, 44, 114, iceland);
add_c(66, 0, 57, india);
add_c(21, 0, 66, indochina);
add_c(0, 167, 8, iran);
add_c(79, 0, 167, italy);
add_c(0, 23, 66, japan);
add_c(0, 167, 77, kazakh);
add_c(80, 114, 0, kenya);
add_c(0, 255, 79, latin);
add_c(114, 0, 0, mali);
add_c(114, 0, 64, mongolia);
add_c(58, 114, 0, namibia);
add_c(255, 0, 0, northeast);
add_c(255, 105, 0, northwest);
add_c(66, 47, 0, nzl);
add_c(160, 167, 0, oman);
add_c(0, 40, 66, ostind);
add_c(66, 0, 37, pakistan);
add_c(0, 60, 66, papua);
add_c(206, 0, 255, peru);
add_c(0, 46, 167, poland);
add_c(215, 255, 0, quebec);
add_c(11, 114, 0, rhodesia);
add_c(0, 127, 167, russia);
add_c(167, 56, 0, sahara);
add_c(0, 3, 66, siberia);
add_c(114, 114, 0, somali);
add_c(0, 114, 44, southafrika);
add_c(255, 0, 143, southbrazil);
add_c(0, 114, 78, swazi);
add_c(0, 95, 114, sweden);
add_c(0, 164, 167, turkey);
add_c(0, 95, 167, ukraine);
add_c(0, 167, 127, ural);
add_c(149, 255, 0, usa);
add_c(255, 238, 0, vancvr);
add_c(0, 241, 255, venezuela);
add_c(167, 0, 0, westafrika);
add_c(114, 0, 98, yakut);