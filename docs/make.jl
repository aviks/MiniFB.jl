using Documenter, MiniFB
using Literate

out_path = joinpath(@__DIR__,"src/example")
rm("gzexamples"; force=true, recursive=true)
rm(out_path; force=true, recursive=true )

config = Dict{Any, Any}("documenter"=>false, "execute"=>false, "credit"=>false)
Literate.markdown(joinpath(@__DIR__, "../example/Noise.jl"), out_path; config=config)
Literate.markdown(joinpath(@__DIR__,"../example/Plasma.jl"), out_path; config=config)
Literate.markdown(joinpath(@__DIR__,"../example/Image.jl"), out_path; config=config)

makedocs(;
    modules=[MiniFB],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
        "Examples" => Any[
            "Noise" => "example/Noise.md",
            "Plasma" => "example/Plasma.md",
            "Image" => "example/Image.md",
        ],
        "API" => "api.md",
        "Generated Code" => "gen.md"
    ],
    sitename="MiniFB",
    authors="Avik Sengupta"
)
