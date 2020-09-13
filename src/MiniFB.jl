module MiniFB
using Colors
using MiniFB_jll

using CEnum

include("ctypes.jl")
export Ctm, Ctime_t, Cclock_t

include("libminifb_common.jl")
include( "libminifb_api.jl")

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

include( "libminifb_docs.jl")

end
