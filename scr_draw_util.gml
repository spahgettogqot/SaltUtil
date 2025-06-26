function draw_set_align(_halign = fa_left, _valign = fa_right) //this is very useful, should be official
{
	draw_set_align(_halign);
	draw_set_align(_valign);
}
function draw_rectangle_outline(_x1, _y1, _x2, _y2, _width)
{
	//this sucks and could be made way better
	//has seams on the corners or whatever because it uses Lines.
	draw_line_width(x1, y1, x2, y1, width);
	draw_line_width(x1, y1, x1, y2, width);
	
	draw_line_width(x2, y1, x2, y2, width);
	draw_line_width(x1, y2, x2, y2, width);
}
function make_color_gray(_gray)
{ return make_color_rgb(_gray, _gray, _gray); }

#macro make_color_grey make_color_gray
