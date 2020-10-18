# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule GMP_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("GMP")
JLLWrappers.@generate_main_file("GMP", UUID("781609d7-10c4-51f6-84f2-b8444358ff6d"))
end  # module GMP_jll
