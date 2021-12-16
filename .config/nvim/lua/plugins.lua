
return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup {} end
}
  use {
          'nvim-treesitter/nvim-treesitter',
          run = ':TSUpdate'
      }

  use 'airblade/vim-gitgutter'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'neovim/nvim-lspconfig'

  -- Theme
  use 'sainnhe/gruvbox-material'  -- Gruvbox, but better
  use 'vimwiki/vimwiki'
  -- Status Line
  use {
    'hoob3rt/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    },
  }
  -- Documentation Framework
  use 'kkoomen/vim-doge'
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.opts)
    end
  }
 end)
