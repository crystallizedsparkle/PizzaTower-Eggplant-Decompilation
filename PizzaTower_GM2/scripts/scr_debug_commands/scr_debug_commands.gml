function string_split(_input_str, _split_str)
{
    var _current_str, _list, i, _char;
    
    _input_str += " ";
    var _current_str = "";
    var _list = [0];
    
    for (var i = 1; i < (string_length(_input_str) + 1); i++)
    {
        var _char = string_char_at(_input_str, i);
        
        if (_char != _split_str)
        {
            _current_str += _char;
        }
        else
        {
            array_push(_list, _current_str);
            _current_str = "";
        }
    }
    
    return _list;
}

function function_overload(_array, _func)
{
    var _size;
    
    _size = array_length(_array);
    
    switch (_size - 1)
    {
        case -1:
            _func();
            break;
        
        case 0:
            _func(_array[0]);
            break;
        
        case 1:
            _func(_array[0], _array[1]);
            break;
        
        case 2:
            _func(_array[0], _array[1], _array[2]);
            break;
        
        case 3:
            _func(_array[0], _array[1], _array[2], _array[3]);
            break;
        
        case 4:
            _func(_array[0], _array[1], _array[2], _array[3], _array[4]);
            break;
        
        case 5:
            _func(_array[0], _array[1], _array[2], _array[3], _array[4], _array[5]);
            break;
        
        case 6:
            _func(_array[0], _array[1], _array[2], _array[3], _array[4], _array[5], _array[6]);
            break;
    }
}

function DebugCommand(_command, _desc, _format, _func) constructor
{
    command_id = _command;
    description = _desc;
    format = _format;
    func = _func;
    
    Invoke = function(_command)
    {
        if (_command != undefined)
            function_overload(_command, func);
        else
            func();
    };
}
// not built to debug, no debug console :(
function TextList_Add(argument0, argument1)
{
    with (obj_debugcontroller)
    {
    }
}
