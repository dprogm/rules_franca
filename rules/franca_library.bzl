load(":providers.bzl", "FrancaLibInfo")

def _franca_library_impl(ctx):
  return [
    FrancaLibInfo(
      srcs = ctx.attr.srcs,
      includes = ctx.attr.includes,
      deps = depset(
        direct = [struct(
          srcs = dep[FrancaLibInfo].srcs,
          includes = dep[FrancaLibInfo].includes,
        ) for dep in ctx.attr.deps],
        transitive = [dep[FrancaLibInfo].deps for dep in ctx.attr.deps],
      ),
    ),
  ]

franca_library = rule(
  implementation = _franca_library_impl,
  attrs = {
    "srcs": attr.label_list(
      allow_files = [
        ".fidl",
        ".fdepl",
        ],
      doc = "Franca source files.",
    ),
    "deps": attr.label_list(
      providers = [FrancaLibInfo],
      doc = "Direct franca dependencies of this library",
    ),
    "includes" : attr.string_list(
      doc = "Include paths used for model or namespace imports.",
    )
  },
)