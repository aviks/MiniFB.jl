module MiniFB
using Colors
using MiniFB_jll

using CEnum

include("ctypes.jl")
export Ctm, Ctime_t, Cclock_t

include("libminifb_common.jl")
include("libminifb_api.jl")
include("libminifb_docs.jl")
include("helpers.jl")

end
