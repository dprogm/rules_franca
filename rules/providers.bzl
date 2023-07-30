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
