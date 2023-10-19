if (keyboard_check_pressed(vk_up)) blurriness++;
if (keyboard_check_pressed(vk_down)) blurriness = max(1, --blurriness);

shader_set(shd_blur);
var u_tex_size = shader_get_uniform(shd_blur, "texture_size");
shader_set_uniform_f(u_tex_size, sprite_get_width(spr_bunny), sprite_get_height(spr_bunny));
var u_kernel_size = shader_get_uniform(shd_blur, "blur_radius");
shader_set_uniform_f(u_kernel_size, blurriness);
draw_sprite(spr_bunny, 0, 0, 0);
shader_reset();

draw_text(32, 32, $"FPS: {fps}");
draw_text(32, 48, $"Blurriness: {blurriness} ({power(2 * blurriness + 1, 2)} texture fetches per fragment)");