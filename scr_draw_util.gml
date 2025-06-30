function draw_set_align(_halign = fa_left, _valign = fa_right) //this is very useful, should be official
{
	draw_set_halign(_halign);
	draw_set_valign(_valign);
}
function draw_rectangle_outline(x1, y1, x2, y2, width)
{
	//this sucks and could be made way better
	//has seams on the corners or whatever because it uses Lines.
	
	//i think i fixed it?
	//seems to rely on the window and display and shit idk
	//looks fine when i used it but dunno tbh
	
	//use same shit as draw_text_outline??
	var cap_fix = round(width / 2);
	draw_line_width(x1 - cap_fix, y1, x2 + cap_fix, y1, width);
	draw_line_width(x1, y1 - cap_fix, x1, y2 + cap_fix, width);
	
	draw_line_width(x1 - cap_fix, y2, x2 + cap_fix, y2, width);
	draw_line_width(x2, y1 - cap_fix, x2, y2 + cap_fix, width);
}
function draw_reset()
{
	gpu_set_blendmode(bm_normal);
	
	draw_set_alpha(1);
	draw_set_color(c_white);	
	draw_set_font(noone);
	draw_set_align();
}
function draw_text_outline(x1, y1, str, outline_size = 1, outline_color = c_black)
{
	var original_color = draw_get_color();	
	
	draw_set_color(outline_color);
	for (var i = -outline_size; i <= outline_size; i++)
	{
		for (var j = -outline_size; j <= outline_size; j++)
			draw_text(x1 + i, y1 + j, str); //i hate my life i forgot to add the positions before
	}	
	
	draw_set_color(original_color);
	draw_text(x1, y1, str);
}

function make_color_gray(_gray)
{ return make_color_rgb(_gray, _gray, _gray); }
#macro make_color_grey make_color_gray
