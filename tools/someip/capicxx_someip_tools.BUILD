java_binary(
  name = "generator_bin",
  main_class = "org.eclipse.equinox.launcher.Main",
  runtime_deps = [
    ":generator_jars"
  ],
  visibility = [ "//visibility:public" ],
)

java_import(
  name = "generator_jars",
  jars = glob([
    "plugins/*.jar"
  ])
)