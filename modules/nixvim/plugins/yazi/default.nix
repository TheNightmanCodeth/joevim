{ config, lib, ... }:
{
  plugins.yazi = {
    enable = true;

    lazyLoad = {
      settings = {
        cmd = [
          "Yazi"
        ];
      };
    };
  };

  keymaps = lib.optionals config.plugins.yazi.enable [
    {
      mode = "n";
      key = "<leader>y";
      action = "<CMD>Yazi<CR>";
      options = {
        desc = "Yazi (current file)";
      };
    }
    {
      mode = "n";
      key = "<leader>Y";
      action = "<CMD>Yazi toggle<CR>";
      options = {
        desc = "Yazi (resume)";
      };
    }
  ];
}
