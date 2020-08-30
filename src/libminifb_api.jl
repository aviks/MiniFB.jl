# Julia wrapper for header: MiniFB_enums.h
# Automatically generated using Clang.jl

# Julia wrapper for header: MiniFB.h
# Automatically generated using Clang.jl


function mfb_open(title, width, height)
    ccall((:mfb_open, libminifb), Ptr{mfb_window}, (Cstring, UInt32, UInt32), title, width, height)
end

function mfb_open_ex(title, width, height, flags)
    ccall((:mfb_open_ex, libminifb), Ptr{mfb_window}, (Cstring, UInt32, UInt32, UInt32), title, width, height, flags)
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
    ccall((:mfb_set_viewport, libminifb), Bool, (Ptr{mfb_window}, UInt32, UInt32, UInt32, UInt32), window, offset_x, offset_y, width, height)
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
    ccall((:mfb_get_key_name, libminifb), Cstring, (mfb_key,), key)
end

function mfb_is_window_active(window)
    ccall((:mfb_is_window_active, libminifb), Bool, (Ptr{mfb_window},), window)
end

function mfb_get_window_width(window)
    ccall((:mfb_get_window_width, libminifb), UInt32, (Ptr{mfb_window},), window)
end

function mfb_get_window_height(window)
    ccall((:mfb_get_window_height, libminifb), UInt32, (Ptr{mfb_window},), window)
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
