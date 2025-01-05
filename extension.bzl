## extensions.bzl
load("//:toolchains.bzl", "toolchains_cloudabi_dependencies")
def _non_module_dependencies_impl(_ctx):
    toolchains_cloudabi_dependencies()

non_module_dependencies = module_extension(
    implementation = _non_module_dependencies_impl,
)