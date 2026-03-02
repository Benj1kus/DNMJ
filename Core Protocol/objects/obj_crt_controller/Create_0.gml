// Определяем реальное разрешение комнаты/вьюпорта
var _game_w = surface_get_width(application_surface);
var _game_h = surface_get_height(application_surface);

my_crt = new CRT({
    geometry: {
        content_width: _game_w,
        content_height: _game_h,
        // 1. Устанавливаем соотношение сторон вашей игры, чтобы не было квадрата
        aspect_ratio: _game_w / _game_h, 
        // 2. Убираем искривление (0.0 = плоский экран)
        curvature: 0.0,
        // 3. Убираем черную рамку по краям (ставим в 0)
        border_width: 0.0,
        // 4. На всякий случай зум на 1 (без масштабирования)
        zoom: 1.0,
        do_int_scale: false
    },
    lines: {
        image_softness: 1.0,
        brightness: 3,
        min_sigma: 0.2,
        max_sigma: 0.45,
        deconvergence: 0.15,
		do_interlace: 1
    },
    bloom: {
        strength: 3,
        passes: 2
    },
    ntsc: {
        enabled: true, // Если не нужен эффект «старого ТВ кабеля» с помехами
        chroma_smear: 5,
        cable_noise: 0.05,
		color_saturation: 2.2,
		notch_filter_scale: 1.1
    }
});


my_crt.set_shader(shd_pass_crt);