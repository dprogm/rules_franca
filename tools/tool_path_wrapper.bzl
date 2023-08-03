# This implementation is based on https://stackoverflow.com/questions/76813149/how-to-properly-handle-args-in-sh-binary-target
# which was asked to specifically solve the problem of proper path handling in generator wrapper scripts hosted in this repository.
# This version is slightly modified. Credit goes to the user 'ahumesky'.
# Licence: https://creativecommons.org/licenses/by-sa/4.0/

def _get_executable_runfile_path(ctx, target):
  return "$0.runfiles/%s/%s" % (ctx.workspace_name, target.files_to_run.executable.short_path)

def _get_file_paths(ctx, target):
  return ["$0.runfiles/%s/%s" % (ctx.workspace_name, f.short_path) for f in target.files.to_list()]

def _tool_path_wrapper_impl(ctx):
  wrapper = ctx.actions.declare_file(ctx.label.name + ".sh")

  runfiles_paths = [_get_executable_runfile_path(ctx, ctx.attr.binary)]
  for tool in ctx.attr.tools:
    runfiles_paths = runfiles_paths + _get_file_paths(ctx, tool)

  # write a script that passes the paths of the subtools to the main tool, then the rest of the args
  ctx.actions.write(
    output = wrapper,
    content = " ".join(runfiles_paths) + " $@\n",
    is_executable = True,
  )
  return DefaultInfo(
    executable = wrapper,
    runfiles = ctx.runfiles().merge_all(
      [ctx.attr.binary.default_runfiles] +
      [t.default_runfiles for t in ctx.attr.tools])
  )

tool_path_wrapper = rule(
  implementation = _tool_path_wrapper_impl,
  doc = """Creates an executable that runs the binary and passes the paths to
    the given tools as the first arguments to the binary. All user provided
    arguments to this target are forwarded to the binary as the remaining
    arguments, effectively generates an invocation like the following:
    ./binary tool_path1 tool_path2 user_arg1 user_arg2
    """,
  attrs = {
    "binary": attr.label(
      mandatory = True,
      doc = "The binary which should be wrapped",
    ),
    "tools": attr.label_list(
      doc = "All tools the binary depends on",
    ),
  },
  executable = True,
)