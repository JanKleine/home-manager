{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      lualine-nvim
      nvim-treesitter.withAllGrammars
      rose-pine
      telescope-nvim
      telescope-undo-nvim
    ];
    extraPackages = [
      pkgs.ripgrep  # needed for telescope live search
    ];
  };

  home.file.".config/nvim" = {
    source = ./neovim;
    recursive = true;
  };
}
