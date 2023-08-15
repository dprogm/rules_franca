workspace(name = "com_github_dprogm_rules_franca")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

load("//:deps.bzl", "deps")
deps()

http_archive(
  name = "com_github_dprogm_rules_capicxx",
  url = "https://github.com/dprogm/rules_capicxx/archive/refs/heads/main.zip",
  # Update the hash value accordingly
  # sha256 = "e8a1dcdd6dd7bb0982756dbe4d2896639f5844ab436c9296b86748c05e018139",
  strip_prefix = "rules_capicxx-main",
)

load("@com_github_dprogm_rules_capicxx//:deps.bzl", "deps")
deps()

load("@com_github_nelhage_rules_boost//:boost/boost.bzl", "boost_deps")
boost_deps()