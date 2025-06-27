function draw_set_align(_halign = fa_left, _valign = fa_right) //this is very useful, should be official
{
	draw_set_halign(_halign);
	draw_set_valign(_valign);
}
function draw_rectangle_outline(x1, y1, x2, y2, width)
{
	draw_line_width(x1, y1, x2, y1, width);
	draw_line_width(x1, y1, x1, y2, width);
	
	draw_line_width(x2, y1, x2, y2, width);
	draw_line_width(x1, y2, x2, y2, width);
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
	
	draw_set_color(outline_color)
	for (var i = -outline_size; i <= outline_size; i++)
	{
		for (var j = -outline_size; j <= outline_size; j++)
			draw_text(x1, y1, str);
	}	
	
	draw_set_color(original_color);
	draw_text(x1, y1, str);
}

function make_color_gray(_gray)
{
	return make_color_rgb(_gray, _gray, _gray);	
}
#macro make_color_grey make_color_gray
