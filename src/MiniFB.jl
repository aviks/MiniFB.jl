module MiniFB
using Colors
using MiniFB_jll

using CEnum

include("ctypes.jl")
export Ctm, Ctime_t, Cclock_t

include("libminifb_common.jl")
include( "libminifb_api.jl")

"""
    mfb_rgb(r, g, b)::UInt32

convert 8 bit color channels to a single 32 bit buffer. Input should be integers 0-255
"""
function mfb_rgb(r, g, b)::UInt32 
    r=convert(UInt32, r)
    g=convert(UInt16, g)
    r << 16 | g << 8 | b
end

"""
    mfb_rgb(c::Colorant)::UInt32

convert a color object from Colors.jl into a 32 bit buffer.
"""
function mfb_rgb(c::Colorant)::UInt32
    cRGB24 = convert(RGB24, c)
    cr, cg, cb = [reinterpret(UInt8, c) for c in (red(cRGB24), green(cRGB24), blue(cRGB24))]
    return mfb_rgb(cr, cg, cb)
end

foreach(names(@__MODULE__, all=true)) do s
   if startswith(string(s), "mfb_")
       @eval export $s
   end
end

include( "libminifb_docs.jl")

end
