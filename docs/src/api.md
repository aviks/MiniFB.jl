
## Available functions

```@index
```

```@docs
mfb_open
mfb_open_ex
mfb_update
mfb_update_events
mfb_close
mfb_set_user_data
mfb_get_user_data
mfb_set_viewport
mfb_set_active_callback
mfb_set_resize_callback
mfb_set_keyboard_callback
mfb_set_char_input_callback
mfb_set_mouse_button_callback
mfb_set_mouse_move_callback
mfb_set_mouse_scroll_callback
mfb_get_key_name
mfb_is_window_active
mfb_get_window_width
mfb_get_window_height
mfb_get_mouse_x
mfb_get_mouse_y
mfb_get_mouse_scroll_x
mfb_get_mouse_scroll_y
mfb_get_mouse_button_buffer
mfb_get_key_buffer
mfb_set_target_fps
mfb_wait_sync
mfb_timer_create
mfb_timer_destroy
mfb_timer_reset
mfb_timer_now
mfb_timer_delta
mfb_timer_get_frequency
mfb_timer_get_resolution
mfb_rgb
```

## Callback signatures

These are the callback signatures used by the C library when signalling events. The Julia function should be written accordingly, and wrapped with a `@cfunction` before passing on to the library. See the [Image Viewer example](../example/Image) for more detail. 

### active

    active(window::Ptr{Cvoid}, isActive::Uint8)


### resize

    resize(window::Ptr{Cvoid}, width::Cint, height::Cint)


### keyboard

    keyboard(window::Ptr{Cvoid}, key::mfb_key, mod::mfb_key_mod, isPressed::Uint8) 

### char_input

    char_input(window::Ptr{Cvoid}, charCode:Cuint)

### mouse_btn

    mouse_btn(window::Ptr{Cvoid}, button::mfb_mouse_button, mod::mfb_key_mod, isPressed::Uint8)

### mouse_move

    mouse_move(window::Ptr{Cvoid}, x::Cint, y::Cint)

### mouse_scroll

    mouse_scroll(window::Ptr{Cvoid}, mod::mfb_key_mod, deltaX::Cfloat, deltaY::Cfloat)