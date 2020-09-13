# MiniFB.jl

| **Documentation**           | **Status**            |
|:---------------------------:|:---------------------:|
| [![][docs-stable-img]][docs-stable-url]  |  [![Build Status][ci-img]][ci-url] [![version][version-img]][version-url] |




A Julia wrapper around [MiniFB](https://github.com/emoon/minifb), a small cross platform library that makes it easy to render 32 bit pixels in a window. 


## Quick Start

```julia
using MiniFB

WIDTH=800
HEIGHT=600
window = mfb_open_ex("My Window", WIDTH, HEIGHT, MiniFB.WF_RESIZABLE)

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

See the [`example`](./example) directory for usage examples. 

[docs-stable-img]: https://img.shields.io/badge/docs-stable-blue.svg
[docs-stable-url]: https://juliahub.com/docs/MiniFB/
[ci-img]: https://github.com/aviks/MiniFB.jl/workflows/CI/badge.svg
[ci-url]: https://travis-ci.org/JuliaDocs/Documenter.jl
[version-img]: https://juliahub.com/docs/MiniFB/version.svg
[version-url]: https://juliahub.com/ui/Packages/MiniFB/NwZ6j

