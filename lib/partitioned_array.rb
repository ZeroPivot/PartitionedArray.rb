PURE = false

if !PURE
  require_relative "partitioned_array_lib"
else
  require_relative "partitioned_array_lib"
  require_relative "partitioned_array_pure_lib"
  require_relative "json_eval"
  require_relative "string_is_int_or_float"
end