# MiniFB.jl

[![Build Status](https://github.com/aviks/MiniFB.jl/workflows/CI/badge.svg)](https://github.com/aviks/MiniFB.jl/actions)


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
    state = mfb_update(buffer)
    if state != MiniFB.STATE_OK
        break
    end
end
```

The code in this package calls directly and transparently into the C library. All the library functions begin with `mfb_`, and are exported from this package. Constants are not exported, and must be prefixed with the module name. See the [underlying C library headers](https://github.com/emoon/minifb/blob/master/include/MiniFB.h) for the list of available functions. 

The `window` object, returned by the `mfb_open` and `mfb_open_ex` functions, is often passed in to other functions. This value happens to be an opaque pointer, so it should be be de-referenced in Julia code. Simply store it untyped, and pass it back in when required. 

## Example

See the `examples` directory for usage examples. 


