function mfb_set_active_callback(window, active::Function)
    active_c = @cfunction($active, Cvoid, (Ptr{Cvoid}, Bool))
    mfb_set_active_callback(window, active_c)
end

function mfb_set_resize_callback(window, resize::Function)
    resize_c = @cfunction($resize, Cvoid, (Ptr{Cvoid}, Cint, Cint))
    mfb_set_resize_callback(window, resize_c)
end

function mfb_set_keyboard_callback(window, keyboard::Function)
    keyboard_c = @cfunction($keyboard, Cvoid, (Ptr{Cvoid}, mfb_key, mfb_key_mod, Bool))
    mfb_set_keyboard_callback(window, keyboard_c)
end

function mfb_set_char_input_callback(window, char_input::Function)
    char_input_c = @cfunction($char_input, Cvoid, (Ptr{Cvoid}, Cuint, Cuint))
    mfb_set_char_input_callback(window, char_input_c)
end

function mfb_set_mouse_button_callback(window, mouse_btn::Function)
    mouse_btn_c = @cfunction($mouse_btn, Cvoid, (Ptr{Cvoid}, mfb_mouse_button, mfb_key_mod, Bool))
    mfb_set_mouse_button_callback(window, mouse_btn_c)
end

function mfb_set_mouse_move_callback(window, mouse_move::Function)
    mouse_move_c = @cfunction($mouse_move, Cvoid, (Ptr{Cvoid}, Cint, Cint))
    mfb_set_mouse_move_callback(window, mouse_move_c)
end

function mfb_set_mouse_scroll_callback(window, mouse_scroll::Function)
    mouse_scroll_c = @cfunction($mouse_scroll, Cvoid, (Ptr{Cvoid}, mfb_key_mod, Cfloat, Cfloat))
    mfb_set_mouse_scroll_callback(window, mouse_scroll_c)
end
