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

## Examples

See the `example` directory for usage examples. 


