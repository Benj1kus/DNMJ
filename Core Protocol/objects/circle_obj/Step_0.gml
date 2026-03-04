// Плавно уменьшаем прозрачность
image_alpha -= fade_speed;

// Плавно уменьшаем размер (для красоты)
image_xscale -= shrink_speed;
image_yscale -= shrink_speed;

// Как только кружок стал полностью невидимым — удаляем его из памяти
if (image_alpha <= 0) {
    instance_destroy();
}