## Code generation using Clang

The code for this package has been generated using [Clang.jl](https://github.com/JuliaInterop/Clang.jl). 

* Add Clang.jl to the current environment
* Change current working directory to `MiniFB/src`
* Clone the source of the MiniFB library from `https://github.com/emoon/minifb` to `/tmp`
 
Then run the following code will regenerate the files: 

```
const MINCLUDE = "/tmp/minifb/include/"
const MHEADERS=["/tmp/minifb/include/MiniFB_enums.h", "/tmp/minifb/include/MiniFB.h"]

wc = init(; headers=MHEADERS, output_file="libminifb_api.jl",
                   common_file="libminifb_common.jl",
                   clang_includes=vcat(MINCLUDE, CLANG_INCLUDE),
                   clang_args=["-I", MINCLUDE],
                    header_wrapped = (root, current)->root == current,
                   header_library = x->"libminifb",
                   clang_diagnostics = true
                   )

run(wc)
```

This will generate `ctypes.jl`, `libminifb_api.jl` and `libminifb_common.jl`. 
