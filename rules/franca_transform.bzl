load(":providers.bzl", "FrancaLibInfo")

def _franca_transform_impl(ctx):
  return

franca_transform = rule(
  implementation = _franca_transform_impl,
  attrs = {
    "srcs": attr.label_list(
      mandatory = True,
      providers = [FrancaLibInfo],
      doc = "Franca libraries that should be transformed into a target language.",
    ),
    "gen": attr.label(
      executable = True,
      allow_files = True,
      cfg = "exec",
    ),
    "args": attr.string_list(
      doc = "Arguments that should be passed to the generator.",
    ),
    "outputs": attr.output_list(
      doc = "All expected files that should be produced by the generator.",
    ),
  },
)