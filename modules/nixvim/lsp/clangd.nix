{
  config,
  lib,
  pkgs,
  ...
}:
{
  # clangd documentation
  # See: https://clangd.llvm.org/
  lsp.servers.clangd = {
    enable = config.khanelivim.lsp.cpp == "clangd";

    config = {
      settings.init_options = {
        usePlaceholders = true;
        completeUnimported = true;
        clangdFileStatus = true;
      };
      cmd = [
        "${lib.getExe' pkgs.clang-tools "clangd"}"
        "--background-index"
        "--clang-tidy"
        "--header-insertion=iwyu"
        "--completion-style=detailed"
        "--function-arg-placeholders"
        "--fallback-style=llvm"
        # let clangd ask nix-store compilers (cross wrappers, e.g.
        # arm64-apple-darwin20.4-clang) for their builtin includes and target
        "--query-driver=/nix/store/*/bin/*"
      ];
    };
  };
}
