# MiniFB

A Julia wrapper around [MiniFB](https://github.com/emoon/minifb), a small cross platform library that makes it easy to render 32 bit pixels in a window. 


## Quick Start

```julia
WIDTH=800
HEIGHT=600
window = mfb_open_ex("My Window", WIDTH, HEIGHT, MinFB.WF_RESIZABLE)

buffer = zeros(UInt32, WIDTH*HEIGHT)
while true
    # TODO add some rendering into the buffer
    ...
    state = mfb_update(window, buffer)
    if state != MiniFB.STATE_OK
        break
    end
end
```

The code in this package calls directly and transparently into the C library. All the library functions begin with `mfb_`, and are exported from this module. Constants are not exported, and must be prefixed with the module name. 

## Opening a window

The [`mfb_open`](@ref) and [`mfb_open_ex`](@ref)  functions can be used to open the windows. Both functions take the window name, height and width and arguments, and the latter function takes a set of flags (ORd together) to modfiy the window behaviour. A `window` pointer object is returned by these functions, and is often passed as a parameter to other functions. This value happens to be an opaque pointer, so it should *not* be de-referenced in Julia code. Simply store it, untyped, and pass it back in when required. 

## Drawing pixels

The MiniFB library expects to be passed the pixels to be rendered to screen in the form of an `UInt32` buffer. This buffer is passed to the [`mfb_update`](@ref) function, which renders it to the windows. The [`mfb_rgb`](@ref) can help to convert raw red/green/blue values between 0-255, or one of the  `Colors.Colorant` types, into the single `UInt32` number we require. Also, note that the `ARGB32` type from Colors.jl is stored as a `UInt32`, and hence you could pass an array of `ARGB32` values directly into this function.  

The [`mfb_update`](@ref) function also reads events off the window, and returns the state of the window. So you need to call this function in a loop, otherwise the OS will consider the window frozen. If you do not want to render new data to screen, call [`mfb_update_events`](@ref) function to read events without refreshing the screen. 

## Events

Input (keyboard and mouse) events can be handled by passing user defined callback functions to the library. 

```
window = mfb_open_ex("My Window", WIDTH, HEIGHT, MinFB.WF_RESIZABLE)
active_fn(win::Ptr{Cvoid}, isActive::Bool) = println("Window is now ",  isActive ? "" : "in", "active")
mfb_set_active_callback(window, active_fn)
```

See [Callback Functions](@ref) for the required signatures of the callback functions. 

## Built on the MiniFB C library

It may be useuful to read the source and documentation of the [C library](https://github.com/emoon/minifb), including the C [header file](https://github.com/emoon/minifb/blob/master/include/MiniFB.h). 



