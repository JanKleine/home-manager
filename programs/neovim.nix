{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      rose-pine
      lualine-nvim
      nvim-treesitter.withAllGrammars
      telescope-nvim
      telescope-undo-nvim
      nvim-lspconfig
      cmp-nvim-lsp
      nvim-cmp
      mason-nvim
      mason-lspconfig-nvim
      copilot-lua
      copilot-lualine
      copilot-cmp
      lspkind-nvim
    ];
    extraPackages = with pkgs; [
      ripgrep  # needed for telescope live search
      nodejs-slim_22
    ];
  };

  home.file.".config/nvim" = {
    source = ./neovim;
    recursive = true;
  };
}
