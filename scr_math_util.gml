function wrap(_value, _minimum, _maximum) //from the evil game
{
	_value = floor(_value);
	
	var _min = floor(min(_minimum, _maximum));
	var _max = floor(max(_minimum, _maximum));
	
	var _range = _max - _min + 1;
	
	return (((_value - _min) % _range) + _range) % _range + _min;
}
function wave(_from, _to, _duration, _offset = 0) //again, from that one game i hate
{
	var _a4 = (_to - _from) * 0.5;
	return _from + _a4 + sin((((current_time * 0.001) + _duration * _offset) / _duration) * (pi * 2)) * _a4;	
}
function approach(_initial_value, _end_value, _increment) //also unfortunately from that one game i hate
{
	if (_initial_value < _end_value)
	    return min(_initial_value + _increment, _end_value); 

	return max(_initial_value - _increment, _end_value);
}
function point_rotate(_px, _py, _angle, _cx, _cy) //okay im pretty sure the last 3 are the only original ones sadly
{
	var _sin = sin(_angle);
	var _cos = cos(_angle);
	
	var _ox = _px - _cx;
	var _oy = _py - _cy;
	
	var _nx = _ox * _cos - _oy * _sin;
	var _ny = _ox * _sin + _oy * _cos;
	
	return [_nx + _cx, _ny + _cy];
}
function cycle(_value, _min, _max)
{
	var delta = (_max - _min);
	var result = (_value - _min) % delta; //realized that % is literally mod and i hate my life even more
	
	if (result < 0) 
		result += delta;
	return result + _min;
}
function round_point(_value, _round)
{ return round(_value / _round) * _round; }
function magnitude(_a, _b)
{ return sqrt(abs(_a) + abs(_b)); }
function average(_values_or_array)
{
	//i hate this
	//honestly dont remember if i made it but i had to fix shit so im guessing i did
	var _values = 0;
	
	if (is_array(_values_or_array))
	{
		for (var _i = 0; _i < array_length(_values_or_array); _i++)
			_values += real(_values_or_array[_i]);
			
		_values /= array_length(_values_or_array);
	}
	else
	{
		for (var _i = 0; _i < argument_count; _i++)
			_values += real(argument[_i]);
			
		_values /= argument_count;
	}
	
	return _values;
}
function len(_x, _y)
{ return sqrt(_x * _x + _y * _y); }
function sqrlen(_x, _y)
{ return _x * _x + _y * _y; }
