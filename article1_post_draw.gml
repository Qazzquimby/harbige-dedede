//Gordo color change
with (player_id) {
    draw_sprite_ext(sprite_get("gordo_white"), other.image_index, other.x, other.y, other.image_xscale * other.spr_dir, other.image_yscale, other.image_angle, get_player_hud_color(other.owned_player), other.image_alpha)
}

// OFFSCREEN
var offset = 32;
var need_draw = false;

var xv = view_get_xview();
var wv = view_get_wview();
var yv = view_get_yview();
var hv = view_get_hview();
var image = 0;

var x_draw = x;
var y_draw = y;

// right
if (x_draw > xv + wv)
{
    while(x_draw > xv + wv - offset)
    {
        x_draw -= 1;
        
        need_draw = true;
    }
    
    image = 2;
}

// left
if (x_draw < xv)
{
    while(x_draw < xv + offset)
    {
        x_draw += 1;
        
        need_draw = true;
    }
    
    image = 6;
}

// bottom
if (y_draw > yv + hv - offset * (image != 0)) // this weird thing means, if already offscreen, then bubble do not wait for the object to cross 0, but offset.
{
    while(y_draw > yv + hv - offset)
    {
        y_draw -= 1;
        
        need_draw = true;
    }
    
    if (image > 0)
    {
        image += 4;
        image *= 0.5;
    }
    else
    {
        image = 4;
    }
}

// top
if (y_draw < yv + offset * (image != 0))
{
    while(y_draw < yv + offset)
    {
        y_draw += 1;
        
        need_draw = true;
    }
    if (image == 2)
    {
        image = 1;
    }
    if (image == 6)
    {
        image = 7;
    }
    //image = 0;
}


var sprite = sprite_get("offscreen_ind");

if (need_draw)
{
    draw_sprite_ext(sprite,image,x_draw,y_draw, 1, 1, 0, get_player_hud_color(player_id.player), 1);
    draw_sprite(sprite_get("gordo_offscreen"),0,x_draw,y_draw);
}