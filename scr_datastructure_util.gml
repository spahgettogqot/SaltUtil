//seperate script cuz alot of new data structure util

function ds_list_convert(the_list) //some ds_* funcs are overset by structs and arrays but are still needed for some functions sadly
{
	var a_resultArray = [];
	for (var a_idsl	= 0; a_idsl < ds_list_size(the_list); a_idsl++)
	{
		var	a_dslistItem = the_list[| a_idsl];
		array_push(a_resultArray, a_dslistItem);
	}
	
	ds_list_destroy(the_list);
	return a_resultArray;
}
function ds_map_convert(the_map)
{
	var a_resultStruct = {};
	for (var a_dsmapItemName = ds_map_find_first(the_map); !is_undefined(a_dsmapItemName); a_dsmapItemName = ds_map_find_next(the_map, a_dsmapItemName)) 
	{
		var a_dsmapItemValue = the_map[? a_dsmapItemName];
		a_resultStruct[$ a_dsmapItemName] = a_dsmapItemValue;
	}
	
	ds_map_destroy(the_map);
	return a_resultStruct;
}

function array_isempty(_array) //array_empty sounds like it would just be array_clear ngl so i edited it
{ return (array_length(_array) - 1) <= 0; }
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
function array_fromstring(_array, _string)
{
	var _result = [];
	for (var i = 1; i <= string_length(_string); i++)
		array_push(_result, string_char_at(_string, i));
		
	return _result;
}
function array_fromnumber(_array, _number)
{
	var _string = string(_number);	
	
	var _result = [];
	for (var i = 1; i <= string_length(_string); i++)
		array_push(_result, real(string_char_at(_string, i)));
		
	return _result;
}
function array_fill(_array, _value, _first = 0, _last = -1) //does this already exist in gamermaker? it should ngl
{
	if (_last == -1)
		_last = array_length(_array);
		
	for (var i = _first; i < _last; i++)
		_array[i] = _value;
}
function array_clear(_array, _value) //literally above but named differently what was i thinking
{ array_fill(_array, _value); }


function is_null(_value) //unsure if or how i could use instances because noone is literally just -4
{ return (is_nan(_value) || is_undefined(_value) || (is_ptr(_value) && (_value == pointer_invalid || _value == pointer_null))); }
