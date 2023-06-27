Provides bazel rules that enable an easy workflow for tasks related to Franca IDL.

* Group related `*.fidl` files into a `franca_library` target
* Use the rule `franca_transform` for performing a code transformation. That is either generating code for some target programming language or performing an IDL to IDL mapping. Sources for this rule are `franca_library` targets.
* Provides convenient rules for generating CommonAPI code. They rely on [rules_capicxx](https://github.com/dprogm/rules_capicxx).