using Clang.Generators
# using Clang.JLLEnvs
using MiniFB_jll
using Downloads

cd(@__DIR__)

# download header files
git_sha = "dda1275bd741752d1b7cdc1ee4d9941887a1891a"
header_files = [
    "MiniFB.h",
    "MiniFB_enums.h",
    "MiniFB_cpp.h",
    "MiniFB_ios.h",
]
for f in header_files
    Downloads.download("https://raw.githubusercontent.com/emoon/minifb/$git_sha/include/$f", "$f")
end

options = load_options(joinpath(@__DIR__, "generator.toml"))

args = get_default_args()
push!(args, "-I$(@__DIR__)")

headers = detect_headers(@__DIR__, args)

ctx = create_context(headers, args, options)

build!(ctx)
