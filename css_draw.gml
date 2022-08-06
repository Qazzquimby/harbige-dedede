//--- ---
//
// hyuponia's "ae" css code
//
// this is my single most user-UNfriendly code.
// read my code and suffer, or just simply edit the only things you need to change.
// feel free to use or edit or redistribute, long as you don't claim the original template as yours.
// shoutouts to muno for css+ functions.
//
// to refresh the custom code proper, you have to temporarily change qe_b value or load another character with this code,
// for example hyuponia's characters, and then load your character back. sorry, there wasn't really any better way i could find.
//
// and just in case, this code goes into css_draw.gml.
//
// now, please change this string to your character's name. used for resetting the values after other characters.
//--- ---
var qe_b = "Dedede"
// ! you can now scroll down until you reach "the primary part you should change."
 
var tmp_cur = 0;
var tmp_i = [0, 0, 0, 0, 0];
var tmp_x = [0, 0, 0, 0, 0];
var tmp_y = [0, 0, 0, 0, 0];
with(asset_get("cs_playercursor_obj")){
    tmp_cur = (!tmp_i[0])?0:(!tmp_i[1])?1:(!tmp_i[2])?2:(!tmp_i[3])?3:4
    tmp_i[tmp_cur] = 1
    tmp_x[tmp_cur] = get_instance_x( self )
    tmp_y[tmp_cur] = get_instance_y( self )
}
var tmp_pt = abs(player-5)-1
var temp_x = x + 8;
var temp_y = y + 9;
var tmp_xl = 9
var tmp_bw = 32
var tmp_yl = 151
var tmp_bh = 20
var tmp_xl1 = x+tmp_xl
var tmp_xl2 = tmp_xl1+tmp_bw
var tmp_yl1 = y+tmp_yl
var tmp_yl2 = tmp_yl1+tmp_bh
draw_set_halign(fa_left);
 
var ye = false;
if (variable_instance_exists(id,"qe")){
    if (qe != qe_b){
    ye = true;
    }
}
 
if (!variable_instance_exists(id,"ae") || ye == true){
    qe = qe_b
    ae = "ae"
    oe = 0;
    ue = 0; //cur
    ne = 0; //tmp
    ee = 0;
    ee_m = 60;
    ie = 0;
    ye = false;
    dial_time = 0;
    dial_max = 8;
    
    //--- ---
    // the primary part you should change.
    //--- ---
    altsel = 0; // change the alt select sound here. if you don't want to change the sound, put 0 here.
    color_desc_activate = false; // optional "alt color description button". set to "true" to turn it on.
    
    col_max = 15; // number of alternate color palettes. 0 is the default color, count it accordingly.
    
    //first array index is for alternate color. second array index is for distinguishing the information in it.
    ce[0,0] = make_color_rgb(get_color_profile_slot_r(0, 1), get_color_profile_slot_g(0, 1), get_color_profile_slot_b(0, 1));
    ce[0,1] = "His Royal Nemesis" // the name of the alternate color.
    ce[0,2] = "" // description to display if "alt color description button" is on. keep it blank if none, and you can remove it if you didn't turn it on.
    ce[1,0] = make_color_rgb(get_color_profile_slot_r(1, 1), get_color_profile_slot_g(1, 1), get_color_profile_slot_b(1, 1));
    ce[1,1] = "Royale Yellow"
    ce[1,2] = ""
    ce[2,0] = make_color_rgb(get_color_profile_slot_r(2, 1), get_color_profile_slot_g(2, 1), get_color_profile_slot_b(2, 1));
    ce[2,1] = "Royale Blue"
    ce[2,2] = ""
    ce[3,0] = make_color_rgb(get_color_profile_slot_r(3, 1), get_color_profile_slot_g(3, 1), get_color_profile_slot_b(3, 1));
    ce[3,1] = "Royale Green"
    ce[3,2] = ""
    ce[4,0] = make_color_rgb(get_color_profile_slot_r(4, 1), get_color_profile_slot_g(4, 1), get_color_profile_slot_b(4, 1));
    ce[4,1] = "Playah 2 (64)"
    ce[4,2] = ""
    ce[5,0] = make_color_rgb(get_color_profile_slot_r(5, 1), get_color_profile_slot_g(5, 1), get_color_profile_slot_b(5, 1));
    ce[5,1] = "Playah 3 (64)"
    ce[5,2] = ""
    ce[6,0] = make_color_rgb(get_color_profile_slot_r(6, 1), get_color_profile_slot_g(6, 1), get_color_profile_slot_b(6, 1));
    ce[6,1] = "Playah 4 (64)"
    ce[6,2] = ""
    ce[7,0] = make_color_rgb(get_color_profile_slot_r(7, 1), get_color_profile_slot_g(7, 1), get_color_profile_slot_b(7, 1));
    ce[7,1] = "Shadow of a King"
    ce[7,2] = ""
    ce[8,0] = make_color_rgb(get_color_profile_slot_r(8, 1), get_color_profile_slot_g(8, 1), get_color_profile_slot_b(8, 1));
    ce[8,1] = "Dreamland Green"
    ce[8,2] = ""
    ce[9,0] = make_color_rgb(get_color_profile_slot_r(9, 1), get_color_profile_slot_g(9, 1), get_color_profile_slot_b(9, 1));
    ce[9,1] = "King of the Show"
    ce[9,2] = ""
    ce[10,0] = make_color_rgb(get_color_profile_slot_r(10, 1), get_color_profile_slot_g(10, 1), get_color_profile_slot_b(10, 1));
    ce[10,1] = "Miniature King"
    ce[10,2] = ""
    ce[11,0] = make_color_rgb(get_color_profile_slot_r(11, 1), get_color_profile_slot_g(11, 1), get_color_profile_slot_b(11, 1));
    ce[11,1] = "Royal Penguin"
    ce[11,2] = ""
    ce[12,0] = make_color_rgb(get_color_profile_slot_r(12, 1), get_color_profile_slot_g(12, 1), get_color_profile_slot_b(12, 1));
    ce[12,1] = "Royal Clone Jelly"
    ce[12,2] = ""
    ce[13,0] = make_color_rgb(get_color_profile_slot_r(13, 1), get_color_profile_slot_g(13, 1), get_color_profile_slot_b(13, 1));
    ce[13,1] = "Abyss"
    ce[13,2] = ""
    ce[14,0] = make_color_rgb(get_color_profile_slot_r(14, 1), get_color_profile_slot_g(14, 1), get_color_profile_slot_b(14, 1));
    ce[14,1] = "Dark King's Reflection"
    ce[14,2] = ""
    ce[15,0] = make_color_rgb(get_color_profile_slot_r(15, 1), get_color_profile_slot_g(15, 1), get_color_profile_slot_b(15, 1));
    ce[15,1] = "Original"
    ce[15,2] = ""
    ce[16,0] = make_color_rgb(get_color_profile_slot_r(16, 1), get_color_profile_slot_g(16, 1), get_color_profile_slot_b(16, 1));
    ce[16,1] = "Infamous"
    ce[16,2] = ""
    ce[17,0] = make_color_rgb(get_color_profile_slot_r(17, 1), get_color_profile_slot_g(17, 1), get_color_profile_slot_b(17, 1));
    ce[17,1] = "Pure Gold"
    ce[17,2] = ""
    ce[18,0] = make_color_rgb(get_color_profile_slot_r(18, 1), get_color_profile_slot_g(18, 1), get_color_profile_slot_b(18, 1));
    ce[18,1] = "Golden Rank"
    ce[18,2] = ""
    ce[19,0] = make_color_rgb(get_color_profile_slot_r(19, 1), get_color_profile_slot_g(19, 1), get_color_profile_slot_b(19, 1));
    ce[19,1] = "Possessed by a Bug"
    ce[19,2] = ""
    ce[20,0] = make_color_rgb(get_color_profile_slot_r(20, 1), get_color_profile_slot_g(20, 1), get_color_profile_slot_b(20, 1));
    ce[20,1] = "Revenge of The King"
    ce[20,2] = ""
    ce[21,0] = make_color_rgb(get_color_profile_slot_r(21, 1), get_color_profile_slot_g(21, 1), get_color_profile_slot_b(21, 1));
    ce[21,1] = "Vintage"
    ce[21,2] = ""
    ce[22,0] = make_color_rgb(get_color_profile_slot_r(22, 1), get_color_profile_slot_g(22, 1), get_color_profile_slot_b(22, 1));
    ce[22,1] = "Forgotten King"
    ce[22,2] = ""
    ce[23,0] = make_color_rgb(get_color_profile_slot_r(23, 1), get_color_profile_slot_g(23, 1), get_color_profile_slot_b(23, 1));
    ce[23,1] = "King of Chaos"
    ce[23,2] = ""
    ce[24,0] = make_color_rgb(get_color_profile_slot_r(24, 1), get_color_profile_slot_g(24, 1), get_color_profile_slot_b(24, 1));
    ce[24,1] = "Moonlit Hunter"
    ce[24,2] = ""
    ce[25,0] = make_color_rgb(get_color_profile_slot_r(25, 1), get_color_profile_slot_g(25, 1), get_color_profile_slot_b(25, 1));
    ce[25,1] = "Big Band"
    ce[25,2] = ""
    ce[26,0] = make_color_rgb(get_color_profile_slot_r(26, 1), get_color_profile_slot_g(26, 1), get_color_profile_slot_b(26, 1));
    ce[26,1] = "Buffy"
    ce[26,2] = ""
    ce[27,0] = make_color_rgb(get_color_profile_slot_r(27, 1), get_color_profile_slot_g(27, 1), get_color_profile_slot_b(27, 1));
    ce[27,1] = "Pastel"
    ce[27,2] = ""
    ce[28,0] = make_color_rgb(get_color_profile_slot_r(28, 1), get_color_profile_slot_g(28, 1), get_color_profile_slot_b(28, 1));
    ce[28,1] = "Brawl in the Family"
    ce[28,2] = ""
    ce[29,0] = make_color_rgb(get_color_profile_slot_r(29, 1), get_color_profile_slot_g(29, 1), get_color_profile_slot_b(29, 1));
    ce[29,1] = "Really Vintage"
    ce[29,2] = ""
    ce[30,0] = make_color_rgb(get_color_profile_slot_r(30, 1), get_color_profile_slot_g(30, 1), get_color_profile_slot_b(30, 1));
    ce[30,1] = "Dreamy Lands Two"
    ce[30,2] = ""
    ce[31,0] = make_color_rgb(get_color_profile_slot_r(31, 1), get_color_profile_slot_g(31, 1), get_color_profile_slot_b(31, 1));
    ce[31,1] = "Adventure Awaits"
    ce[31,2] = ""
    // you can add more, by copypasting and changing the first index of the array accordingly.
    // ! changing part end.
    // you can ignore the mess below...
}
 
if (ae == "ae"){
    ae = "oe";
}
if (ae == "oe"){
    ae = "ue";
}
if (ne != ue){
    ie = (ue == col_max && ne == 0) ? -1 : (ue == 0 && ne == col_max) ? 1 : (ne < ue) ? 1 : -1 
    ne = ue;
    ae = "ne";
    if (altsel!=0){
    sound_stop(altsel);
    sound_play(altsel);
    }
}
if (ae == "ne"){
    ee = ee_m;
    ae = "ue";
}
if (ee > 0){
    var tw = ease_quartOut(0, 1, ee, ee_m);
    var tw_b = (ease_quartOut(0, 1, ee, ee_m)/2) - (ease_quartIn(0, 1, ee, ee_m)/2);
    var tw_c = (ease_quartOut(0, 1, ee, ee_m)/4) - (ease_quartIn(0, 1, ee, ee_m)/4);
    var tw_d = (ease_quartOut(0, 1, ee, ee_m)/2) + (ease_quartIn(0, 1, ee, ee_m));
    var tw_e = (ease_quartOut(0, 1, ee, ee_m)/4) + (ease_quartIn(0, 1, ee, ee_m)/2);
    var tw_f = (ease_quartOut(0, 1, ee, ee_m)/6) + (ease_quartIn(0, 1, ee, ee_m)/4);
    var tw_g = (ease_quartOut(0, 1, ee, ee_m)) + (ease_quartIn(0, 1, ee, ee_m)/2);
    var dist = 14;
    var typ = round(ease_expoIn(0, dist, ee, ee_m-2));
    //using muno's function;
    if (ue-2>=0){
    rectDraw(temp_x + 2, temp_y + 77 +(0-(dist*2)-6+(typ*ie)), temp_x + 16, temp_y + 91 +(0-(dist*2)-6+(typ*ie)),
    ce[clamp(ue-2,0,col_max),0], c_gray, (ie==-1) ? tw_c : tw_e );
    }
    if (ue-1>=0){
    rectDraw(temp_x + 2, temp_y + 77 +(0-dist-3+(typ*ie)), temp_x + 16, temp_y + 91 +(0-dist-3+(typ*ie)),
    ce[clamp(ue-1,0,col_max),0], c_gray, (ie==-1) ? tw_b : tw_d );
    }
    
    rectDraw(temp_x + 2, temp_y + 77 +(typ*ie), temp_x + 16, temp_y + 91 +(typ*ie), ce[ue,0], c_white, tw);
    
    if (ue+1<=col_max){
    rectDraw(temp_x + 2, temp_y + 77 +(dist+3+(typ*ie)), temp_x + 16, temp_y + 91 +(dist+3+(typ*ie)),
    ce[clamp(ue+1,0,col_max),0], c_gray, (ie==1) ? tw_b : tw_d );
    }
    if (ue+2<=col_max){
    rectDraw(temp_x + 2, temp_y + 77 +((dist*2)+6+(typ*ie)), temp_x + 16, temp_y + 91 +((dist*2)+6+(typ*ie)),
    ce[clamp(ue+2,0,col_max),0], c_gray, (ie==1) ? tw_c : tw_e );
    }
    
    if (ue+(3*-ie)<=col_max && ue+(3*-ie)>=0){
    rectDraw(temp_x + 2, temp_y + 77 +((((dist*3)+9)*-ie)+(typ*ie)),
    temp_x + 16, temp_y + 91 +((((dist*3)+9)*-ie)+(typ*ie)),
    ce[clamp(ue+(3*-ie),0,col_max),0], c_gray, tw_f);
    }
    
textDraw(temp_x + 2 + ((player==0)?32:0), temp_y + 130, "fName", c_white, 0, 1000, 1, true, tw_g, ce[ue,1]);
    
    ee--;
}
    ue = get_player_color(player);
 
//this part does button stuff, drawing etc
 
if (color_desc_activate){
    if (tmp_x[tmp_pt]>tmp_xl1 && tmp_x[tmp_pt]<tmp_xl2 && tmp_y[tmp_pt]>tmp_yl1 && tmp_y[tmp_pt]<tmp_yl2){
        if (dial_time<dial_max){ dial_time++; }
    }else{
        if (dial_time>0){ dial_time--; }
    }
    draw_set_alpha(0.3);
    draw_rectangle_colour(tmp_xl2-1, tmp_yl1+3, tmp_xl2, tmp_yl2, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
    textDraw(round(tmp_xl1+(tmp_bw/2))-3, round(tmp_yl1+(tmp_bh/2))-4, "fName", c_dkgray, 0, 100, 1, false, 0.3, "?");
    var dial_ease = ease_linear( 0, 100, dial_time, dial_max )
    draw_set_alpha(dial_ease/130);
    draw_rectangle_colour(x+10, y+95-round(dial_ease/30), x+210, y+153, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(dial_ease/500);
    draw_rectangle_colour(tmp_xl1, tmp_yl1+3, tmp_xl2, tmp_yl2, c_white, c_white, c_white, c_white, false);
    draw_set_alpha(1);
    textDraw(x+14, (y+100)-round(dial_ease/30), "fName", c_white, 18, 200, 1, false, dial_ease/100, "- Color "+string(ue)+": "+ce[ue,1]);
    textDraw(x+14, (y+120)-round(dial_ease/30), "fName", c_white, 18, 200, 1, false, dial_ease/100, ce[ue,2]);
}
 
//ae code end
 
 
 
//--- ---
// altered version of muno's functions. if you have other css codes, this part needs to be at the bottom of the code.
//--- ---
 
#define textDraw(x, y, font, color, lineb, linew, scale, outline, alpha, string)
 
draw_set_font(asset_get(argument[2]));
 
if argument[7]{
    for (i = -1; i < 2; i++){
        for (j = -1; j < 2; j++){
            draw_text_ext_transformed_color(argument[0] + i * 2, argument[1] + j * 2, argument[9], argument[4], argument[5], argument[6], argument[6], 0, c_black, c_black, c_black, c_black, 1);
        }
    }
}
 
draw_text_ext_transformed_color(argument[0], argument[1], argument[9], argument[4], argument[5], argument[6], argument[6], 0, argument[3], argument[3], argument[3], argument[3], argument[8]);
 
return string_width_ext(argument[9], argument[4], argument[5]);
 
 
#define rectDraw(x1, y1, x2, y2, color, out_color, alpha)
 
draw_set_alpha(argument[6]);
draw_rectangle_color(argument[0], argument[1], argument[2], argument[3], argument[5], argument[5], argument[5], argument[5], false);
draw_set_alpha(argument[6]*1.5);
draw_rectangle_color(argument[0]+2, argument[1]+2, argument[2]-2, argument[3]-2, argument[4], argument[4], argument[4], argument[4], false);
draw_set_alpha(1);
 