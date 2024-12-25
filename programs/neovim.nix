{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      material-nvim
      lualine-nvim
    ];
    extraLuaConfig = ''
      require('lualine').setup {
        options = {
          theme = 'auto'
        }
      }

      require('material').setup({
        lualine_style = 'stealth'
      })

      vim.g.material_style = "palenight"
      vim.cmd 'colorscheme material'
    '';
  };
}
