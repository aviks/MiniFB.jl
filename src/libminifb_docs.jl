## Documentation for wrapped functions
## Kept separate, since the sources are generated

"""
    mfb_open(title, width, height)

Create a window that is used to display the buffer sent into the mfb_update function, returns 0 if fails""" mfb_open

"""
    mfb_open_ex(title, width, height, flags)

Create a window, with flags""" mfb_open_ex
"""
    mfb_update(window, buffer)

Update the display. 
Input buffer is assumed to be a 32-bit buffer of the size given in the open call. 
Will return a negative status if something went wrong or the user want to exit. 
Also updates the window event""" mfb_update

"""
    mfb_update(window)

Only updates the window events. Either `mfb_update` or `mfb_update_events` must be called in a loop to clear the event queue.""" mfb_update_events
"""
    mfb_close(window)
    
Close the window""" mfb_close

"""
    mfb_set_user_data(window , user_data::Ptr{Cvoid})

Set a per-window user data. Data is supplied as a pointer. The data at the end of that pointer should be prevented from garbage collection. 

# Example
```julia
x=Ref(2)
mfb_set_user_data(w, x)
```
See also: [`mfb_get_user_data`](@ref)
""" mfb_set_user_data

"""
    mfb_get_user_data(window)::Ptr{Cvoid}

Retrive the user data associated with this window. The return value is a void pointer that should be derferenced

# Example
```julia
g=mfb_get_user_data(w)
unsafe_load(convert(Ptr{Int}, g)) # 2
```
See also: [`mfb_set_user_data`](@ref)
""" mfb_get_user_data

"""
    mfb_set_viewport(window, offset_x, offset_y, width, height)
Set viewport (useful when resize)""" mfb_set_viewport

"""
    mfb_set_active_callback(window, mfb_active_func callback)

""" mfb_set_active_callback

"""
    mfb_set_resize_callback(window, mfb_resize_func callback)

""" mfb_set_resize_callback

"""
    mfb_set_keyboard_callback(window, mfb_keyboard_func callback)

""" mfb_set_keyboard_callback

"""
    mfb_set_char_input_callback(window, mfb_char_input_func callback)

""" mfb_set_char_input_callback

"""
    mfb_set_mouse_button_callback(window, mfb_mouse_button_func callback)

""" mfb_set_mouse_button_callback

"""
    mfb_set_mouse_move_callback(window, mfb_mouse_move_func callback)

""" mfb_set_mouse_move_callback

"""
    mfb_set_mouse_scroll_callback(window, mfb_mouse_scroll_func callback)

""" mfb_set_mouse_scroll_callback

"""
    mfb_get_key_name(mfb_key key)

""" mfb_get_key_name

"""
    mfb_is_window_active(window)

""" mfb_is_window_active

"""
    mfb_get_window_width(window)

""" mfb_get_window_width

"""
    mfb_get_window_height(window)

""" mfb_get_window_height

"""
    mfb_get_mouse_x(window)              

Last mouse pos X
""" mfb_get_mouse_x

"""
    mfb_get_mouse_y(window)              
    
Last mouse pos Y
""" mfb_get_mouse_y

"""
    mfb_get_mouse_scroll_x(window)       
    
Mouse wheel X as a sum. When you call this function it resets.
""" mfb_get_mouse_scroll_x

"""
    mfb_get_mouse_scroll_y(window)       
    
Mouse wheel Y as a sum. When you call this function it resets.
""" mfb_get_mouse_scroll_y

"""
    mfb_get_mouse_button_buffer(window)  
    
One byte for every button. Press (1), Release 0. (up to 8 buttons)
""" mfb_get_mouse_button_buffer

"""
    mfb_get_key_buffer(window)           
    
One byte for every key. Press (1), Release 0.
""" mfb_get_key_buffer

"""
    mfb_set_target_fps(fps)

""" mfb_set_target_fps

"""
    mfb_wait_sync(window)

""" mfb_wait_sync

"""
    mfb_timer_create()

Create a timer. Returns an opaque pointer that should be stored, and passed to subsequent timer related calls. 
""" mfb_timer_create

"""
    mfb_timer_destroy(tmr)

""" mfb_timer_destroy

"""
    mfb_timer_reset(tmr)

""" mfb_timer_reset
"""
    mfb_timer_now(tmr)

""" mfb_timer_now
"""
    mfb_timer_delta(tmr)

""" mfb_timer_delta
"""
    mfb_timer_get_frequency()

""" mfb_timer_get_frequency
"""
    mfb_timer_get_resolution()

""" mfb_timer_get_resolution