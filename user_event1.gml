//FX change!

fx_change(AT_JAB, 1, 20);
fx_change(AT_JAB, 2, 20);
fx_change(AT_JAB, 3, 197);

fx_change(AT_FTILT, 1, 20);
fx_change(AT_FTILT, 2, 20);
fx_change(AT_FTILT, 3, 197);

fx_change(AT_FSTRONG, 1, 197);
fx_change(AT_FSTRONG, 2, 20);
fx_change(AT_FSTRONG, 3, 197);
fx_change(AT_FSTRONG, 4, 20);

fx_change(AT_DSTRONG, 1, 197);
fx_change(AT_DSTRONG, 2, 20);
fx_change(AT_DSTRONG, 3, 20);
fx_change(AT_DSTRONG, 4, 20);
fx_change(AT_DSTRONG, 5, 197);
fx_change(AT_DSTRONG, 6, 20);
fx_change(AT_DSTRONG, 7, 197);
fx_change(AT_DSTRONG, 8, 20);

fx_change(AT_FSPECIAL, 1, 197);
fx_change(AT_FSPECIAL, 2, 197);

fx_change(AT_FAIR, 1, 197);
fx_change(AT_FAIR, 2, 197);

fx_change(AT_UAIR, 15, 197);
fx_change(AT_UAIR, 16, 197);

fx_change(AT_DAIR, 1, 20);
fx_change(AT_DAIR, 2, 197);
fx_change(AT_DAIR, 3, 197);

#define fx_change(_move, _hitbox, _effect)
if (masked) {
	set_hitbox_value(_move, _hitbox, HG_VISUAL_EFFECT, _effect);
}
else {
	reset_hitbox_value(_move, _hitbox, HG_VISUAL_EFFECT);
}