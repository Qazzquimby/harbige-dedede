//UStrong color overlay
if (state == PS_ATTACK_GROUND || state == PS_ATTACK_AIR) {
    if (attack == AT_USTRONG) {
        draw_sprite_ext(sprite_get("ustrong_overlay"), image_index, round(x), round(y), image_xscale*2, image_yscale*2, image_angle, image_blend, image_alpha)
    }
    
}