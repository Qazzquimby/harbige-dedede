//

if (has_rune("M") && attack == AT_USPECIAL) {
    attack = AT_USPECIAL_2;
}

if (attack == AT_TAUNT && (shield_down || shield_pressed)) {
    attack = AT_TAUNT_2;
    if (!masked)
        window = 1;
    else
        window = 4;
}