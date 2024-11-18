function scr_keyname(argument0)
{
    switch (argument0)
    {
        case 38:
            return "UP";
            break;
        
        case 39:
            return "RIGHT";
            break;
        
        case 37:
            return "LEFT";
            break;
        
        case 40:
            return "DOWN";
            break;
        
        case 13:
            return "ENTER";
            break;
        
        case 27:
            return "ESCAPE";
            break;
        
        case 32:
            return "SPACE";
            break;
        
        case 161:
            return "SHIFT";
            break;
        
        case 160:
            return "SHIFT";
            break;
        
        case 16:
            return "SHIFT";
            break;
        
        case 17:
            return "CONTROL";
            break;
        
        case 162:
            return "CONTROL";
            break;
        
        case 163:
            return "CONTROL";
            break;
        
        case 18:
            return "ALT";
            break;
        
        case 164:
            return "ALT";
            break;
        
        case 8:
            return "BACKSPACE";
            break;
        
        case 9:
            return "TAB";
            break;
        
        case 36:
            return "HOME";
            break;
        
        case 35:
            return "END";
            break;
        
        case 46:
            return "DELETE";
            break;
        
        case 45:
            return "INSERT";
            break;
        
        case 33:
            return "PAGE UP";
            break;
        
        case 34:
            return "PAGE DOWN";
            break;
        
        case 19:
            return "PAUSE";
            break;
        
        case 44:
            return "PRINTSCREEN";
            break;
        
        case 112:
            return "F1";
            break;
        
        case 113:
            return "F2";
            break;
        
        case 114:
            return "F3";
            break;
        
        case 115:
            return "F4";
            break;
        
        case 116:
            return "F5";
            break;
        
        case 117:
            return "F6";
            break;
        
        case 118:
            return "F7";
            break;
        
        case 119:
            return "F8";
            break;
        
        case 120:
            return "F9";
            break;
        
        case 121:
            return "F10";
            break;
        
        case 122:
            return "F11";
            break;
        
        case 123:
            return "F12";
            break;
        
        case 96:
            return "NUMPAD 0";
            break;
        
        case 97:
            return "NUMPAD 1";
            break;
        
        case 98:
            return "NUMPAD 2";
            break;
        
        case 99:
            return "NUMPAD 3";
            break;
        
        case 100:
            return "NUMPAD 4";
            break;
        
        case 101:
            return "NUMPAD 5";
            break;
        
        case 102:
            return "NUMPAD 6";
            break;
        
        case 103:
            return "NUMPAD 7";
            break;
        
        case 104:
            return "NUMPAD 8";
            break;
        
        case 105:
            return "NUMPAD 9";
            break;
        
        case 106:
            return "MULTIPLY";
            break;
        
        case 111:
            return "DIVIDE";
            break;
        
        case 107:
            return "ADD";
            break;
        
        case 109:
            return "SUBTRACT";
            break;
        
        case 110:
            return "DECIMAL";
            break;
        
        case -1:
            return "PRESS KEY";
            break;
    }
    
    return chr(argument0);
}
