// Твои настройки масштаба
map_scale_x = 3.285714;
map_scale_y = 3.305085;

// Сразу масштабируем сам объект подсветки
image_xscale = map_scale_x;
image_yscale = map_scale_y;

visible = false;
map_surface = -1; 
countries = {};

function add_c(_r, _g, _b, _sprite, _name) {
    var _color = make_color_rgb(_r, _g, _b);
    countries[$ string(_color)] = {
        sprite: _sprite,
        name: _name
    };
}

// --- СПИСОК СТРАН (БЕЗ spr_) ---
add_c(255, 181, 0, alaska,"Alaska");
add_c(167, 0, 156, alger,"Algeria");
add_c(0, 51, 255, amazona,"Amazonas");
add_c(104, 167, 0, arab,"Arabia");
add_c(167, 0, 44, argentina,"Argentina");
add_c(46, 66, 0, auteast,"Australia East");
add_c(0, 66, 8, autup,"Australia North");
add_c(0, 66, 48, autwest,"Australia West");
add_c(56, 0, 66, bengal,"Bengalia");
add_c(149, 0, 255, brazil,"Brazil");
add_c(101, 255, 0, califor,"California");
add_c(114, 89, 0, centralafrika,"Central Africa");
add_c(0, 255, 155, centralamerica,"Central America");
add_c(255, 0, 209, centralbrazil,"Central Brazil");
add_c(114, 60, 0, chad,"Chad");
add_c(255, 0, 67, chile,"Chile");
add_c(39, 0, 66, china,"China");
add_c(0, 136, 255, columbia,"Columbia");
add_c(167, 106, 0, darf,"Darfur");
add_c(60, 167, 0, egypt,"Egypt");
add_c(0, 255, 3, florida,"Florida");
add_c(167, 0, 112, frank,"Frankland");
add_c(114, 26, 0, gabon,"Gabon");
add_c(147, 0, 167, germany,"Germanland");
add_c(17, 0, 167, greece,"Greece");
add_c(3, 0, 114, greendown,"Greenland South");
add_c(88, 0, 114, greeneast,"Greenland East");
add_c(45, 0, 114, greenwest,"Greenland West");
add_c(63, 0, 255, guat,"Guatia");
add_c(167, 0, 75, Iberia,"Iberia");
add_c(0, 44, 114, iceland,"Iceland");
add_c(66, 0, 57, india,"India");
add_c(21, 0, 66, indochina,"Indochina");
add_c(0, 167, 8, iran,"Iran");
add_c(79, 0, 167, italy,"Italy");
add_c(0, 23, 66, japan,"Japan");
add_c(0, 167, 77, kazakh,"Kazakhia");
add_c(80, 114, 0, kenya,"Kenya");
add_c(0, 255, 79, latin,"Latinia");
add_c(114, 0, 0, mali,"Mali");
add_c(114, 0, 64, mongolia,"Mongolia");
add_c(58, 114, 0, namibia,"Namib");
add_c(255, 0, 0, northeast,"North East");
add_c(255, 105, 0, northwest,"North West");
add_c(66, 47, 0, nzl,"New Zealand");
add_c(160, 167, 0, oman,"Oman");
add_c(0, 40, 66, ostind,"Ost India");
add_c(66, 0, 37, pakistan,"Pakistani");
add_c(0, 60, 66, papua,"Papua");
add_c(206, 0, 255, peru,"Peru");
add_c(0, 46, 167, poland,"Poland");
add_c(215, 255, 0, quebec,"Quebec");
add_c(11, 114, 0, rhodesia,"Rhodesia");
add_c(0, 127, 167, russia,"Russia");
add_c(167, 56, 0, sahara,"Sahara");
add_c(0, 3, 66, siberia,"Siberia");
add_c(114, 114, 0, somali,"Somalia");
add_c(0, 114, 44, southafrika,"South Africa");
add_c(255, 0, 143, southbrazil,"Rio Grando de Sul");
add_c(0, 114, 78, swazi,"Swaziland");
add_c(0, 95, 114, sweden,"Sweden");
add_c(0, 164, 167, turkey,"Turkey");
add_c(0, 95, 167, ukraine,"Ukraine");
add_c(0, 167, 127, ural,"Ural");
add_c(149, 255, 0, usa,"Usa");
add_c(255, 238, 0, vancvr,"Vancouver");
add_c(0, 241, 255, venezuela,"Venezuela");
add_c(167, 0, 0, westafrika,"West Afrika");
add_c(114, 0, 98, yakut,"Yakutia");



global.window_depth = -2000;