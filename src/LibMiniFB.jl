module LibMiniFB

using MiniFB_jll
export MiniFB_jll

@enum mfb_update_state::Int32 begin
    STATE_OK = 0
    STATE_EXIT = -1
    STATE_INVALID_WINDOW = -2
    STATE_INVALID_BUFFER = -3
    STATE_INTERNAL_ERROR = -4
end

@enum mfb_mouse_button::UInt32 begin
    MOUSE_BTN_0 = 0
    MOUSE_BTN_1 = 1
    MOUSE_BTN_2 = 2
    MOUSE_BTN_3 = 3
    MOUSE_BTN_4 = 4
    MOUSE_BTN_5 = 5
    MOUSE_BTN_6 = 6
    MOUSE_BTN_7 = 7
end

@enum mfb_key::Int32 begin
    KB_KEY_UNKNOWN = -1
    KB_KEY_SPACE = 32
    KB_KEY_APOSTROPHE = 39
    KB_KEY_COMMA = 44
    KB_KEY_MINUS = 45
    KB_KEY_PERIOD = 46
    KB_KEY_SLASH = 47
    KB_KEY_0 = 48
    KB_KEY_1 = 49
    KB_KEY_2 = 50
    KB_KEY_3 = 51
    KB_KEY_4 = 52
    KB_KEY_5 = 53
    KB_KEY_6 = 54
    KB_KEY_7 = 55
    KB_KEY_8 = 56
    KB_KEY_9 = 57
    KB_KEY_SEMICOLON = 59
    KB_KEY_EQUAL = 61
    KB_KEY_A = 65
    KB_KEY_B = 66
    KB_KEY_C = 67
    KB_KEY_D = 68
    KB_KEY_E = 69
    KB_KEY_F = 70
    KB_KEY_G = 71
    KB_KEY_H = 72
    KB_KEY_I = 73
    KB_KEY_J = 74
    KB_KEY_K = 75
    KB_KEY_L = 76
    KB_KEY_M = 77
    KB_KEY_N = 78
    KB_KEY_O = 79
    KB_KEY_P = 80
    KB_KEY_Q = 81
    KB_KEY_R = 82
    KB_KEY_S = 83
    KB_KEY_T = 84
    KB_KEY_U = 85
    KB_KEY_V = 86
    KB_KEY_W = 87
    KB_KEY_X = 88
    KB_KEY_Y = 89
    KB_KEY_Z = 90
    KB_KEY_LEFT_BRACKET = 91
    KB_KEY_BACKSLASH = 92
    KB_KEY_RIGHT_BRACKET = 93
    KB_KEY_GRAVE_ACCENT = 96
    KB_KEY_WORLD_1 = 161
    KB_KEY_WORLD_2 = 162
    KB_KEY_ESCAPE = 256
    KB_KEY_ENTER = 257
    KB_KEY_TAB = 258
    KB_KEY_BACKSPACE = 259
    KB_KEY_INSERT = 260
    KB_KEY_DELETE = 261
    KB_KEY_RIGHT = 262
    KB_KEY_LEFT = 263
    KB_KEY_DOWN = 264
    KB_KEY_UP = 265
    KB_KEY_PAGE_UP = 266
    KB_KEY_PAGE_DOWN = 267
    KB_KEY_HOME = 268
    KB_KEY_END = 269
    KB_KEY_CAPS_LOCK = 280
    KB_KEY_SCROLL_LOCK = 281
    KB_KEY_NUM_LOCK = 282
    KB_KEY_PRINT_SCREEN = 283
    KB_KEY_PAUSE = 284
    KB_KEY_F1 = 290
    KB_KEY_F2 = 291
    KB_KEY_F3 = 292
    KB_KEY_F4 = 293
    KB_KEY_F5 = 294
    KB_KEY_F6 = 295
    KB_KEY_F7 = 296
    KB_KEY_F8 = 297
    KB_KEY_F9 = 298
    KB_KEY_F10 = 299
    KB_KEY_F11 = 300
    KB_KEY_F12 = 301
    KB_KEY_F13 = 302
    KB_KEY_F14 = 303
    KB_KEY_F15 = 304
    KB_KEY_F16 = 305
    KB_KEY_F17 = 306
    KB_KEY_F18 = 307
    KB_KEY_F19 = 308
    KB_KEY_F20 = 309
    KB_KEY_F21 = 310
    KB_KEY_F22 = 311
    KB_KEY_F23 = 312
    KB_KEY_F24 = 313
    KB_KEY_F25 = 314
    KB_KEY_KP_0 = 320
    KB_KEY_KP_1 = 321
    KB_KEY_KP_2 = 322
    KB_KEY_KP_3 = 323
    KB_KEY_KP_4 = 324
    KB_KEY_KP_5 = 325
    KB_KEY_KP_6 = 326
    KB_KEY_KP_7 = 327
    KB_KEY_KP_8 = 328
    KB_KEY_KP_9 = 329
    KB_KEY_KP_DECIMAL = 330
    KB_KEY_KP_DIVIDE = 331
    KB_KEY_KP_MULTIPLY = 332
    KB_KEY_KP_SUBTRACT = 333
    KB_KEY_KP_ADD = 334
    KB_KEY_KP_ENTER = 335
    KB_KEY_KP_EQUAL = 336
    KB_KEY_LEFT_SHIFT = 340
    KB_KEY_LEFT_CONTROL = 341
    KB_KEY_LEFT_ALT = 342
    KB_KEY_LEFT_SUPER = 343
    KB_KEY_RIGHT_SHIFT = 344
    KB_KEY_RIGHT_CONTROL = 345
    KB_KEY_RIGHT_ALT = 346
    KB_KEY_RIGHT_SUPER = 347
    KB_KEY_MENU = 348
end

@enum mfb_key_mod::UInt32 begin
    KB_MOD_SHIFT = 1
    KB_MOD_CONTROL = 2
    KB_MOD_ALT = 4
    KB_MOD_SUPER = 8
    KB_MOD_CAPS_LOCK = 16
    KB_MOD_NUM_LOCK = 32
end

@enum mfb_window_flags::UInt32 begin
    WF_RESIZABLE = 1
    WF_FULLSCREEN = 2
    WF_FULLSCREEN_DESKTOP = 4
    WF_BORDERLESS = 8
    WF_ALWAYS_ON_TOP = 16
end

mutable struct mfb_window end

mutable struct mfb_timer end

# typedef void ( * mfb_active_func ) ( struct mfb_window * window , bool isActive )
const mfb_active_func = Ptr{Cvoid}

# typedef void ( * mfb_resize_func ) ( struct mfb_window * window , int width , int height )
const mfb_resize_func = Ptr{Cvoid}

# typedef void ( * mfb_keyboard_func ) ( struct mfb_window * window , mfb_key key , mfb_key_mod mod , bool isPressed )
const mfb_keyboard_func = Ptr{Cvoid}

# typedef void ( * mfb_char_input_func ) ( struct mfb_window * window , unsigned int code )
const mfb_char_input_func = Ptr{Cvoid}

# typedef void ( * mfb_mouse_button_func ) ( struct mfb_window * window , mfb_mouse_button button , mfb_key_mod mod , bool isPressed )
const mfb_mouse_button_func = Ptr{Cvoid}

# typedef void ( * mfb_mouse_move_func ) ( struct mfb_window * window , int x , int y )
const mfb_mouse_move_func = Ptr{Cvoid}

# typedef void ( * mfb_mouse_scroll_func ) ( struct mfb_window * window , mfb_key_mod mod , float deltaX , float deltaY )
const mfb_mouse_scroll_func = Ptr{Cvoid}

function mfb_open(title, width, height)
    ccall((:mfb_open, libminifb), Ptr{mfb_window}, (Ptr{Cchar}, Cuint, Cuint), title, width, height)
end

function mfb_open_ex(title, width, height, flags)
    ccall((:mfb_open_ex, libminifb), Ptr{mfb_window}, (Ptr{Cchar}, Cuint, Cuint, Cuint), title, width, height, flags)
end

function mfb_update(window, buffer)
    ccall((:mfb_update, libminifb), mfb_update_state, (Ptr{mfb_window}, Ptr{Cvoid}), window, buffer)
end

function mfb_update_events(window)
    ccall((:mfb_update_events, libminifb), mfb_update_state, (Ptr{mfb_window},), window)
end

function mfb_close(window)
    ccall((:mfb_close, libminifb), Cvoid, (Ptr{mfb_window},), window)
end

function mfb_set_user_data(window, user_data)
    ccall((:mfb_set_user_data, libminifb), Cvoid, (Ptr{mfb_window}, Ptr{Cvoid}), window, user_data)
end

function mfb_get_user_data(window)
    ccall((:mfb_get_user_data, libminifb), Ptr{Cvoid}, (Ptr{mfb_window},), window)
end

function mfb_set_viewport(window, offset_x, offset_y, width, height)
    ccall((:mfb_set_viewport, libminifb), Bool, (Ptr{mfb_window}, Cuint, Cuint, Cuint, Cuint), window, offset_x, offset_y, width, height)
end

function mfb_set_active_callback(window, callback)
    ccall((:mfb_set_active_callback, libminifb), Cvoid, (Ptr{mfb_window}, mfb_active_func), window, callback)
end

function mfb_set_resize_callback(window, callback)
    ccall((:mfb_set_resize_callback, libminifb), Cvoid, (Ptr{mfb_window}, mfb_resize_func), window, callback)
end

function mfb_set_keyboard_callback(window, callback)
    ccall((:mfb_set_keyboard_callback, libminifb), Cvoid, (Ptr{mfb_window}, mfb_keyboard_func), window, callback)
end

function mfb_set_char_input_callback(window, callback)
    ccall((:mfb_set_char_input_callback, libminifb), Cvoid, (Ptr{mfb_window}, mfb_char_input_func), window, callback)
end

function mfb_set_mouse_button_callback(window, callback)
    ccall((:mfb_set_mouse_button_callback, libminifb), Cvoid, (Ptr{mfb_window}, mfb_mouse_button_func), window, callback)
end

function mfb_set_mouse_move_callback(window, callback)
    ccall((:mfb_set_mouse_move_callback, libminifb), Cvoid, (Ptr{mfb_window}, mfb_mouse_move_func), window, callback)
end

function mfb_set_mouse_scroll_callback(window, callback)
    ccall((:mfb_set_mouse_scroll_callback, libminifb), Cvoid, (Ptr{mfb_window}, mfb_mouse_scroll_func), window, callback)
end

function mfb_get_key_name(key)
    ccall((:mfb_get_key_name, libminifb), Ptr{Cchar}, (mfb_key,), key)
end

function mfb_is_window_active(window)
    ccall((:mfb_is_window_active, libminifb), Bool, (Ptr{mfb_window},), window)
end

function mfb_get_window_width(window)
    ccall((:mfb_get_window_width, libminifb), Cuint, (Ptr{mfb_window},), window)
end

function mfb_get_window_height(window)
    ccall((:mfb_get_window_height, libminifb), Cuint, (Ptr{mfb_window},), window)
end

function mfb_get_mouse_x(window)
    ccall((:mfb_get_mouse_x, libminifb), Cint, (Ptr{mfb_window},), window)
end

function mfb_get_mouse_y(window)
    ccall((:mfb_get_mouse_y, libminifb), Cint, (Ptr{mfb_window},), window)
end

function mfb_get_mouse_scroll_x(window)
    ccall((:mfb_get_mouse_scroll_x, libminifb), Cfloat, (Ptr{mfb_window},), window)
end

function mfb_get_mouse_scroll_y(window)
    ccall((:mfb_get_mouse_scroll_y, libminifb), Cfloat, (Ptr{mfb_window},), window)
end

function mfb_get_mouse_button_buffer(window)
    ccall((:mfb_get_mouse_button_buffer, libminifb), Ptr{UInt8}, (Ptr{mfb_window},), window)
end

function mfb_get_key_buffer(window)
    ccall((:mfb_get_key_buffer, libminifb), Ptr{UInt8}, (Ptr{mfb_window},), window)
end

function mfb_set_target_fps(fps)
    ccall((:mfb_set_target_fps, libminifb), Cvoid, (UInt32,), fps)
end

function mfb_wait_sync(window)
    ccall((:mfb_wait_sync, libminifb), Bool, (Ptr{mfb_window},), window)
end

function mfb_timer_create()
    ccall((:mfb_timer_create, libminifb), Ptr{mfb_timer}, ())
end

function mfb_timer_destroy(tmr)
    ccall((:mfb_timer_destroy, libminifb), Cvoid, (Ptr{mfb_timer},), tmr)
end

function mfb_timer_reset(tmr)
    ccall((:mfb_timer_reset, libminifb), Cvoid, (Ptr{mfb_timer},), tmr)
end

function mfb_timer_now(tmr)
    ccall((:mfb_timer_now, libminifb), Cdouble, (Ptr{mfb_timer},), tmr)
end

function mfb_timer_delta(tmr)
    ccall((:mfb_timer_delta, libminifb), Cdouble, (Ptr{mfb_timer},), tmr)
end

function mfb_timer_get_frequency()
    ccall((:mfb_timer_get_frequency, libminifb), Cdouble, ())
end

function mfb_timer_get_resolution()
    ccall((:mfb_timer_get_resolution, libminifb), Cdouble, ())
end

function user_implemented_init(window)
    ccall((:user_implemented_init, libminifb), Cvoid, (Ptr{mfb_window},), window)
end

function user_implemented_update(window)
    ccall((:user_implemented_update, libminifb), Cvoid, (Ptr{mfb_window},), window)
end

const MOUSE_LEFT = MOUSE_BTN_1

const MOUSE_RIGHT = MOUSE_BTN_2

const MOUSE_MIDDLE = MOUSE_BTN_3

const KB_KEY_LAST = KB_KEY_MENU

# exports
const PREFIXES = ["mfb_", "WF_", "STATE_", "MOUSE_", "KB_"]
for name in names(@__MODULE__; all=true), prefix in PREFIXES
    if startswith(string(name), prefix)
        @eval export $name
    end
end

end # module
