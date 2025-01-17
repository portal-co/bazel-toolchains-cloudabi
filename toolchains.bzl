load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def toolchains_cloudabi_dependencies():
    http_archive(
        name = "org_llvm_llvm_x86_64_apple_darwin",
        build_file = "@cloudtools//:BUILD.llvm",
        # sha256 = "b3ad93c3d69dfd528df9c5bb1a434367babb8f3baea47fbb99bf49f1b03c94ca",
        strip_prefix = "clang+llvm-19.0.0-x86_64-apple-darwin",
        urls = ["https://releases.llvm.org/19.0.0/clang+llvm-19.0.0-x86_64-apple-darwin.tar.xz"],
    )

    http_archive(
        name = "org_llvm_llvm_x86_64_unknown_freebsd",
        build_file = "@cloudtools//:BUILD.llvm",
        # sha256 = "95ceb933ccf76e3ddaa536f41ab82c442bbac07cdea6f9fbf6e3b13cc1711255",
        strip_prefix = "clang+llvm-19.0.0-amd64-unknown-freebsd11",
        urls = ["https://releases.llvm.org/19.0.0/clang+llvm-19.0.0-amd64-unknown-freebsd11.tar.xz"],
    )

    http_archive(
        name = "org_llvm_llvm_x86_64_unknown_linux_gnu",
        build_file = "@cloudtools//:BUILD.llvm",
        # sha256 = "5c90e61b06d37270bc26edb305d7e498e2c7be22d99e0afd9f2274ef5458575a",
        strip_prefix = "clang+llvm-19.0.0-x86_64-linux-gnu-ubuntu-14.04",
        urls = ["https://releases.llvm.org/19.0.0/clang+llvm-19.0.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz"],
    )

    git_repository(
        name = "pc_portal_cloudabi_argdata",
        # commit = "191ab391fbe0be3edbee59bedd73165de9b3abf5",
        remote = "https://github.com/portal-co/argdata.git",
        branch = "master"
    )

    # git_repository(
    #     name = "pc_portal_cloudabi_cloudabi",
    #     # commit = "af51ede669dbca0875d20893dae7f760b052b238",
    #     remote = "https://github.com/portal-co/cloudabi.git",
    #             branch = "master"
    # )

    # if "pc_portal_cloudabi_cloudabi_utils" not in native.existing_rules():
    #     git_repository(
    #         name = "pc_portal_cloudabi_cloudabi_utils",
    #         # commit = "be1ce21e1dded9c0c0a6ebe144cbea01cf44a874",
    #         remote = "https://github.com/portal-co/cloudabi-utils.git",
    #                 branch = "master"
    #     )

    # if "pc_portal_cloudabi_cloudlibc" not in native.existing_rules():
    #     git_repository(
    #         name = "pc_portal_cloudabi_cloudlibc",
    #         # commit = "04a34ca2ead2408dde759395cc370b373ce8ed64",
    #         remote = "https://github.com/portal-co/cloudlibc.git",
    #                 branch = "master"
    #     )

    http_archive(
        name = "org_llvm_cfe",
        build_file = "@cloudtools//:BUILD.cfe",
        # sha256 = "a45b62dde5d7d5fdcdfa876b0af92f164d434b06e9e89b5d0b1cbc65dfe3f418",
        strip_prefix = "cfe-19.0.1.src",
        urls = ["https://releases.llvm.org/19.0.1/cfe-19.0.1.src.tar.xz"],
    )

    http_archive(
        name = "org_llvm_compiler_rt",
        build_file = "@cloudtools//:BUILD.compiler-rt",
        sha256 = "782edfc119ee172f169c91dd79f2c964fb6b248bd9b73523149030ed505bbe18",
        strip_prefix = "compiler-rt-19.0.1.src",
        urls = ["https://releases.llvm.org/19.0.1/compiler-rt-19.0.1.src.tar.xz"],
    )

    http_archive(
        name = "org_llvm_libcxx",
        build_file = "@cloudtools//:BUILD.libcxx",
        patches = [
            "@cloudtools//:patches/libcxx-no-std-funcs.diff",
            "@cloudtools//:patches/libcxx-unsafe-string-includes.diff",
        ],
        # sha256 = "020002618b319dc2a8ba1f2cba88b8cc6a209005ed8ad29f9de0c562c6ebb9f1",
        strip_prefix = "libcxx-19.0.1.src",
        urls = ["https://releases.llvm.org/19.0.1/libcxx-19.0.1.src.tar.xz"],
    )

    http_archive(
        name = "org_llvm_libcxxabi",
        build_file = "@cloudtools//:BUILD.libcxxabi",
        # sha256 = "8168903a157ca7ab8423d3b974eaa497230b1564ceb57260be2bd14412e8ded8",
        strip_prefix = "libcxxabi-19.0.1.src",
        urls = ["https://releases.llvm.org/19.0.1/libcxxabi-19.0.1.src.tar.xz"],
    )

    http_archive(
        name = "org_llvm_libunwind",
        build_file = "@cloudtools//:BUILD.libunwind",
        # sha256 = "89c852991dfd9279dbca9d5ac10b53c67ad7d0f54bbab7156e9f057a978b5912",
        strip_prefix = "libunwind-19.0.1.src",
        urls = ["https://releases.llvm.org/19.0.1/libunwind-19.0.1.src.tar.xz"],
    )

    http_archive(
        name = "org_musl_libc_musl",
        patches = [
            "@cloudtools//:patches/musl-bazel.diff",
            "@cloudtools//:patches/musl-cloudabi.diff",
            "@cloudtools//:patches/musl-warnings.diff",
        ],
        sha256 = "44be8771d0e6c6b5f82dd15662eb2957c9a3173a19a8b49966ac0542bbd40d61",
        strip_prefix = "musl-1.1.20",
        urls = ["https://www.musl-libc.org/releases/musl-1.1.20.tar.gz"],
    )

    http_archive(
        name = "net_jemalloc_jemalloc",
        build_file = "@cloudtools//:BUILD.jemalloc",
        patches = [
            "@cloudtools//:patches/jemalloc-cloudabi.diff",
            "@cloudtools//:patches/jemalloc-generated.diff",
        ],
        sha256 = "5396e61cc6103ac393136c309fae09e44d74743c86f90e266948c50f3dbb7268",
        strip_prefix = "jemalloc-5.1.0",
        urls = ["https://github.com/jemalloc/jemalloc/releases/download/5.1.0/jemalloc-5.1.0.tar.bz2"],
    )

    http_archive(
        name = "com_google_double_conversion",
        patches = ["@cloudtools//:patches/double-conversion-pull-54.diff"],
        sha256 = "aef5f528dab826b269b54766a4c2d179e361866c75717af529f91c56b4034665",
        strip_prefix = "double-conversion-3.1.0",
        urls = ["https://github.com/google/double-conversion/archive/3.1.0.tar.gz"],
    )
