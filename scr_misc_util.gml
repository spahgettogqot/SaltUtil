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
{ return instance_create_depth(_x, _y, 0, _obj); }
function instance_create_once(_x, _y, _obj) //renamed idk why
{
	if (instance_exists(_obj))
		return instance_find(_obj, 0);
		
	return instance_create(_x, _y, _obj);
}

function string_safe(_string)
{
	//dunno if i need this ngl
	var _stringUnraw = string_replace_all(_string, "\\n", "\n");
	_stringUnraw = string_replace_all(_stringUnraw, "\\r", "\r");
	_stringUnraw = string_replace_all(_stringUnraw, "\\t", "\t");
	
	//fixes backslash in paths
	var _stringNoBackSlash = string_replace_all(_stringUnraw, "\\", "/");
	
	return _stringNoBackSlash;
}
function string_save(_string, _fname)
{
	//finally wrote this 
	var _stringByteLength = string_byte_length(_string);
	var _stringBuffer = buffer_create(_stringByteLength, buffer_fixed, 1);
	buffer_write(_stringBuffer, buffer_text, _string);
	buffer_save(_stringBuffer, _fname);
	buffer_delete(_stringBuffer);
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
function string_numeric(_string) //idk why this was below
{
	//tries to return a number instead of a string if it can
	//this was the first thing that came to mind and it works ig
	var _value = _string;
	try {_value = real(_value);} catch (_e) {};
	
	return _value;
}
//debated to fix string_pos because its one of the only functions with substr at the beginning and i Hate it

function json_load(_fname)
{ return json_parse(string_load(_fname)); }
function json_save(_json, _fname)
{ string_save(json_stringify(_json), _fname); }	

//idk how i should go about naming this
function sprite_isfinished(_spriteIndex = sprite_index, _imageNumber = undefined)
{
	var _calcImageNumber = sprite_get_number(_spriteIndex);
	if (_imageNumber != undefined)
		_calcImageNumber = _imageNumber;
		
	return (floor(image_index) >= _calcImageNumber - 1);
}

//TODO: saving
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

//added delta time because its in nanoseconds????
//the documentation's page on it even uses the divison
//why not just set it to ms in the first place like current_time??????????
#macro GM_build_snapshot __gm_snapshot_date()
#macro YYC code_is_compiled()
#macro DEBUG (GM_build_type == "run")
#macro STRING_UNDEFINED (string(undefined))
#macro DELTA_TIME (delta_time / 1000000)

#macro trace print
