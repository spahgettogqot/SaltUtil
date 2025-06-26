function __gm_snapshot_date() //kind of mid
{
	var _build_date = GM_build_date;
	var _time = { //struct because it was used for something else initially
		year : date_get_year(_build_date),
		week : date_get_week(_build_date)
	};
	
	// Format
	// YY w WW (rel OR deb) _ (vm OR yyc) _ (gms2 OR gmrt)
	// Example: 24w32r_vm
	
	var _snapshot = $"{string_copy($"{_time.year}", 3, 2)}w{_time.week}{DEBUG ? "deb" : "rel"}_{code_is_compiled() ? "yyc" : "vm"}_{GM_runtime_type}";
	
	return _snapshot;
}
function print(_string) // or trace
{
	if (!DEBUG)
		return;
		
	var _output_message = "";
	
	for (var i = 0; i < argument_count; i++)
		_output_message += string(argument[i]);
		
	show_debug_message(_output_message);
}
function instance_create(_x, _y, _obj)
{ return instance_create_depth(_x, _y, depth, _obj); }
function instance_create_only(_x, _y, _obj)
{
	if (instance_exists(_obj))
		return instance_find(_obj, 0);
		
	return instance_create(_x, _y, _obj);
}
function string_load(_fname)
{
	//i made a buffer version but then i wondered about this
	//is it even faster why am i talking like this will ever be public wtf im schizo or sumthn
    var _file = file_text_open_read(_fname);
    var _file_content = "";
    
    if (!file_exists(_fname))
		return;
    
    while (!file_text_eof(_file))
    {
        _file_content += file_text_read_string(_file);
        file_text_readln(_file);
    }
    
    file_text_close(_file);
    return _file_content;
}
function json_load(_fname)
{ return json_parse(string_load(_fname)); }
//TODO: saving
function array_exists(_array, _value)
{ return array_indexof(_array, _value) != -1; }
function array_indexof(_array, _value)
{
	for (var i = 0; i < array_length(_array); i++)
	{
		if (_array[i] == _value)
			return i;
	}
	
	return -1;
}
function array_deletevalue(_array, _value)
{ array_delete(_array, array_indexof(_array, _value), 1); }
function is_null(_value) //unsure if or how i could use instances because noone is literally just -4
{ return (is_nan(_value) || is_undefined(_value) || (is_ptr(_value) && (_value == pointer_invalid || _value == pointer_null))); }
function window_exists() //originally for printing because it annoys me that debug info can show before the game starts in the output and i had a queue to print shit and only started once the window existed
{
	var _hwnd = window_handle();
	return !is_null(_hwnd);
}
function window_contains_mouse()
{
	if (window_has_focus() || !window_exists())
		return false;
		
	//ugly as fuck
	return (point_in_rectangle(display_mouse_get_x(), display_mouse_get_y(), window_get_x(), window_get_y(), window_get_x() + window_get_width(), window_get_y() + window_get_height()));	
}
function string_numeric(_string)
{
	//tries to return a number instead of a string if it can
	//this was the first thing that came to mind and it works ig
	var _value = _string;
	try {_value = real(_value);} catch (_e) {};
	
	return _value;
}
//debated to fix string_pos because its one of the only functions with substr at the beginning and i Hate it

#macro GM_build_snapshot __gm_snapshot_date()
#macro YYC code_is_compiled()
#macro DEBUG (GM_build_type == "run")
#macro STRING_UNDEFINED (string(undefined))

#macro trace print
