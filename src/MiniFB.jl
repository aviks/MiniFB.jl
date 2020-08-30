module MiniFB
using MiniFB_jll

using CEnum

include("ctypes.jl")
export Ctm, Ctime_t, Cclock_t

include("libminifb_common.jl")
include( "libminifb_api.jl")

function mfb_rgb(r, g, b)::Cuint 
    r << 16 | g << 8 | b
end

foreach(names(@__MODULE__, all=true)) do s
   if startswith(string(s), "mfb_")
       @eval export $s
   end
end



end
