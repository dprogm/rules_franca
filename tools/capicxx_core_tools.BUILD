filegroup(
  name = "generator_pieces",
  srcs = glob([
    "configuration/**",
    "features/**",
    "plugins/**",
  ]) + [
    "artifacts.xml",
  ],
)

filegroup(
  name = "generator_bin",
  srcs = select({
    "@bazel_tools//src/conditions:linux_x86_64": [    
      "commonapi-core-generator-linux-x86_64",
      "commonapi-core-generator-linux-x86_64.ini",
    ],
    "@bazel_tools//src/conditions:windows_x64": [    
      "commonapi-core-generator-windows-x86_64.exe",
      "commonapi-core-generator-windows-x86_64.ini",
    ],
  }),
  # For some reason all the generator pieces
  # are not required for executing the binary
  # TODO Clarify why they are bundled.
  data = [":generator_pieces"],
  visibility = [ "//visibility:public" ],
)