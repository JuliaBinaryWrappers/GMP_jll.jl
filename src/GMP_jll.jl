module GMP_jll
using Pkg, Pkg.BinaryPlatforms, Pkg.Artifacts, Libdl

# Load Artifacts.toml file
artifacts_toml = joinpath(@__DIR__, "Artifacts.toml")

# Extract all platforms
artifacts = Pkg.Artifacts.load_artifacts_toml(artifacts_toml, UUID("781609d7-10c4-51f6-84f2-b8444358ff6d"))
platforms = [Pkg.Artifacts.unpack_platform(e, "GMP", artifacts_toml) for e in artifacts["GMP"]]

# Filter platforms based on what wrappers we've generated on-disk
platforms = filter(p -> isfile(joinpath(@__DIR__, "wrappers", triplet(p))), platforms)

# From the available options, choose the best platform
best_platform = select_platform(Dict(p => triplet(p) for p in platforms))

# Load the appropriate wrapper
include(joinpath(@__DIR__, "wrappers", "$(best_platform).jl"))

end  # module GMP_jll
