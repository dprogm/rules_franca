FrancaLibInfo = provider(fields = {
  "srcs" : """
    Franca/Deployment files that make up a self contained library.
    This means it must be possible for a dependent code generator
    to produce valid output just with the provided sources and all
    of its dependencies.
    """,
  "includes" : """
    Paths which are used for resolving model or namespace imports.
    A code generator should use these paths to locate the requested
    franca file from an import statement by searching the corresponding
    directories. This isn't supported officially yet by the Franca
    specification but a useful extension.
    """,
  "deps" : "Dependencies of this franca library.",
})

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