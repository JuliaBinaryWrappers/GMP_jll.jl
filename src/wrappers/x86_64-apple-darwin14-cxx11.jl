# Autogenerated wrapper script for GMP_jll for x86_64-apple-darwin14-cxx11
export libgmp, libgmpxx

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "DYLD_FALLBACK_LIBRARY_PATH"
LIBPATH_default = "~/lib:/usr/local/lib:/lib:/usr/lib"

# Relative path to `libgmp`
const libgmp_splitpath = ["lib", "libgmp.10.dylib"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libgmp_path = ""

# libgmp-specific global declaration
# This will be filled out by __init__()
libgmp_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libgmp = "@rpath/libgmp.10.dylib"


# Relative path to `libgmpxx`
const libgmpxx_splitpath = ["lib", "libgmpxx.4.dylib"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libgmpxx_path = ""

# libgmpxx-specific global declaration
# This will be filled out by __init__()
libgmpxx_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libgmpxx = "@rpath/libgmpxx.4.dylib"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"GMP")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    global libgmp_path = normpath(joinpath(artifact_dir, libgmp_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libgmp_handle = dlopen(libgmp_path)
    push!(LIBPATH_list, dirname(libgmp_path))

    global libgmpxx_path = normpath(joinpath(artifact_dir, libgmpxx_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libgmpxx_handle = dlopen(libgmpxx_path)
    push!(LIBPATH_list, dirname(libgmpxx_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(vcat(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ':')

    
end  # __init__()

