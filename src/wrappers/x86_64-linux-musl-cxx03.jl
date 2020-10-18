# Autogenerated wrapper script for GMP_jll for x86_64-linux-musl-cxx03
export libgmp, libgmpxx

JLLWrappers.@generate_wrapper_header("GMP")
JLLWrappers.@declare_library_product(libgmp, "libgmp.so.10")
JLLWrappers.@declare_library_product(libgmpxx, "libgmpxx.so.4")
function __init__()
    JLLWrappers.@generate_init_header()
    JLLWrappers.@init_library_product(
        libgmp,
        "lib/libgmp.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_library_product(
        libgmpxx,
        "lib/libgmpxx.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
