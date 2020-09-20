function mfb_rgb(r::UInt8, g::UInt8, b::UInt8)::UInt32 
    reinterpret(UInt32, [b, g, r, zero(UInt8)])[1]
end

"""
    mfb_rgb(r, g, b)::UInt32

convert 8 bit color channels to a single 32 bit buffer. 
Input should be of some integer type in the range 0-255. 
`InexactError` will be thrown if the inputs are fractional, or larger than 255.
"""
mfb_rgb(r, g, b) = mfb_rgb(UInt8(r), UInt8(g), UInt8(b))

"""
    mfb_rgb(c::Colorant)::UInt32

convert a color object from Colors.jl into a 32 bit buffer.
"""
function mfb_rgb(c::Colorant)::UInt32
    cRGB24 = convert(RGB24, c)
    return reinterpret(UInt32, cRGB24)
end

foreach(names(@__MODULE__, all=true)) do s
   if startswith(string(s), "mfb_")
       @eval export $s
   end
end

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
