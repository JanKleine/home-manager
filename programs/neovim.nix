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
      lspkind-nvim
      gitsigns-nvim
      nvim-tree-lua
      nvim-web-devicons
      markdown-preview-nvim
      which-key-nvim
      claudecode-nvim # Claude Code IDE integration (select + @-mention, in-editor diffs)
      nvim-dap
      nvim-dap-ui
      nvim-nio
      nvim-dap-virtual-text
    ];
    withNodeJs = true; # needed for many lsp servers
    withRuby = false; # no ruby remote plugins in use (new default in 26.05)
    withPython3 = false; # no python3 remote plugins in use (new default in 26.05)
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
