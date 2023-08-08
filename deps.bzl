load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def deps():
  http_archive(
    name = "com_github_covesa_capicxx_core_tools",
    build_file = "@com_github_dprogm_rules_franca//tools:capicxx_core_tools.BUILD",
    url = "https://github.com/COVESA/capicxx-core-tools/releases/download/3.2.0.1/commonapi_core_generator.zip",
    sha256 = "d206b8281f95eaca0d6f1f794d22fbf69d515a879a452b4e9cf6b499fd0af0b2",
  )

  http_archive(
    name = "com_github_covesa_capicxx_someip_tools",
    build_file = "@com_github_dprogm_rules_franca//tools/someip:capicxx_someip_tools.BUILD",
    url = "https://github.com/COVESA/capicxx-someip-tools/releases/download/3.2.0.1/commonapi_someip_generator.zip",
    sha256 = "6e83a48db2e81fcdf774d7aa7472877bbcc18c52964cd125b08e5690d634fe4f"
  )