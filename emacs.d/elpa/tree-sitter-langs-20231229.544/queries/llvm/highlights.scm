(type) @type
(type_keyword) @type.builtin

(type [
    (local_var)
    (global_var)
  ] @type)

(argument) @variable.parameter

(_ inst_name: _ @keyword)

[
  "catch"
  "filter"
] @keyword

[
  "to"
  "nuw"
  "nsw"
  "exact"
  "unwind"
  "from"
  "cleanup"
  "swifterror"
  "volatile"
  "inbounds"
  "inrange"
] @keyword
(icmp_cond) @keyword
(fcmp_cond) @keyword

(fast_math) @keyword

(_ callee: _ @function)
(function_header name: _ @function)

[
  "declare"
  "define"
] @keyword.function
(calling_conv) @keyword

[
  "target"
  "triple"
  "datalayout"
  "source_filename"
  "addrspace"
  "blockaddress"
  "align"
  "syncscope"
  "within"
  "uselistorder"
  "uselistorder_bb"
  "module"
  "asm"
  "sideeffect"
  "alignstack"
  "inteldialect"
  "unwind"
  "type"
  "global"
  "constant"
  "externally_initialized"
  "alias"
  "ifunc"
  "section"
  "comdat"
  "thread_local"
  "localdynamic"
  "initialexec"
  "localexec"
  "any"
  "exactmatch"
  "largest"
  "nodeduplicate"
  "samesize"
  "distinct"
  "attributes"
  "vscale"
  "no_cfi"
] @keyword

(linkage_aux) @keyword
(dso_local) @keyword
(visibility) @keyword
(dll_storage_class) @keyword
(unnamed_addr) @keyword
(attribute_name) @keyword

(function_header [
    (linkage)
    (calling_conv)
    (unnamed_addr)
  ] @keyword)

(number) @cnumber
(comment) @comment
(string) @string
(cstring) @string
(label) @label
(_ inst_name: "ret" @keyword)
(float) @number

[
  (local_var)
  (global_var)
] @variable

[
  (struct_value)
  (array_value)
  (vector_value)
] @constructor

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
  "<"
  ">"
  "<{"
  "}>"
] @punctuation.bracket

[
  ","
  ":"
] @punctuation.delimiter

[
  "="
  "|"
  "x"
  "..."
] @operator

[
  "true"
  "false"
] @constant.builtin

[
  "undef"
  "poison"
  "null"
  "none"
  "zeroinitializer"
] @constant.builtin

(ERROR) @error
