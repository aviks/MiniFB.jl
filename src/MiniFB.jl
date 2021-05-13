module MiniFB
using Colors
using MiniFB_jll

include("LibMiniFB.jl")
using .LibMiniFB

include("libminifb_docs.jl")
include("helpers.jl")

export mfb_rgb

end
