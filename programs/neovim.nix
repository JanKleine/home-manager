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
      gitsigns-nvim
      nvim-tree-lua
      nvim-web-devicons
      markdown-preview-nvim
      which-key-nvim
      nvim-dap
      nvim-dap-ui
      nvim-nio
      nvim-dap-virtual-text
    ];
    withNodeJs = true; # needed for many lsp servers
    extraPackages = with pkgs; [
      ripgrep  # needed for telescope live search
      go # for delve debugging
    ];
  };

  home.file.".config/nvim" = {
    source = ./neovim;
    recursive = true;
  };
}
