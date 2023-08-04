load(":providers.bzl", "FrancaLibInfo")

def _franca_transform_impl(ctx):
  inputs = []
  for franca_lib in ctx.attr.srcs:
    for franca_src in franca_lib[FrancaLibInfo].srcs:
      for file in franca_src.files.to_list():
        inputs.append(file)
  args = ctx.actions.args()
  # Arg #1 refers to the destination directory of the outputs
  args.add("%s/%s" % (ctx.genfiles_dir.path, ctx.label.package))
  # Pass all user provided args next, these are the generator
  # specific arguments.
  args.add_all(ctx.attr.args)
  # The input files are usually positional args for the generator
  args.add_all(inputs)
  ctx.actions.run(
    inputs = inputs,
    outputs = ctx.outputs.outputs,
    arguments = [args],
    progress_message = "Generating target language code for %s" % inputs,
    executable = ctx.executable.gen,
  )
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
  output_to_genfiles = True,
)