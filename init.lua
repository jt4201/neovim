-- Initialization =============================================================
pcall(function()
  vim.loader.enable()
end)

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.g.python3_host_prog = 'python3'

vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

require('options')
require('autocmd')
require('keymaps')

_G.Config = {
  path_package = vim.fn.stdpath('data') .. '/site/',
  path_source = vim.fn.stdpath('config') .. '/src/',
}

-- Ensure 'mini.nvim' is set up
local mini_path = Config.path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd([[echo "Installing 'mini.nvim'" | redraw]])
  local clone_cmd = {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/echasnovski/mini.nvim',
    mini_path,
  }
  vim.fn.system(clone_cmd)
end
require('mini.deps').setup({ path = { package = Config.path_package } })

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- add({ name = 'mini.nvim', checkout = 'HEAD' })

now(function()
  require('mini.icons').setup()
  MiniIcons.mock_nvim_web_devicons()
end)

-- nvim-lualine/lualine.nvim
now(function()
  add({ source = 'nvim-lualine/lualine.nvim' })
  require('lualine').setup({
    tabline = {
      lualine_a = { 'buffers' },
      lualine_b = { 'branch' },
      lualine_c = { 'filename' },
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'tabs' },
    },
  })
end)

-- mini.notify
now(function()
  local filterout_lua_diagnosing = function(notif_arr)
    local not_diagnosing = function(notif)
      return not vim.startswith(notif.msg, 'lua_ls: Diagnosing')
    end
    notif_arr = vim.tbl_filter(not_diagnosing, notif_arr)
    return MiniNotify.default_sort(notif_arr)
  end
  require('mini.notify').setup({
    content = { sort = filterout_lua_diagnosing },
    window = { max_width_share = 0.648, config = { border = 'double' } },
  })
  vim.notify = MiniNotify.make_notify()
end)

-- EdenEast/nightfox.nvim
now(function()
  add({ source = 'EdenEast/nightfox.nvim' })
  require('nightfox').setup({
    options = {
      styles = {
        keywords = 'bold',
        comments = 'italic',
      },
    },
  })
  -- vim.cmd([[colo nightfox]])
end)

-- bluz71/vim-nightfly-colors
later(function()
  add({ source = 'bluz71/vim-nightfly-colors', name = nightfly })
  vim.g.nightflyWinSeparator = 2
  vim.cmd([[colo nightfly]])
end)

-- bluz71/vim-moonfly-colors
later(function()
  add({ source = 'bluz71/vim-moonfly-colors', name = moonfly })
end)

-- rebelot/kanagawa
later(function()
  add({ source = 'rebelot/kanagawa.nvim' })
end)

-- miikanissi/modus-themes.nvim
later(function()
  add({ source = 'miikanissi/modus-themes.nvim' })
end)

-- mini.sessions
now(function()
  require('mini.sessions').setup()
end)

-- mini.starter
now(function()
  require('mini.starter').setup()
end)

-- Step two
-- mini.extra
later(function()
  require('mini.extra').setup()
end)

-- mini.ai
later(function()
  local ai = require('mini.ai')
  ai.setup({
    custom_textobjects = {
      I = MiniExtra.gen_ai_spec.indent(),
      B = MiniExtra.gen_ai_spec.buffer(),
      F = ai.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
    },
  })
end)

-- mini.align
later(function()
  require('mini.align').setup()
end)

-- mini.bufremove
later(function()
  require('mini.bufremove').setup()
end)

-- mini.files
later(function()
  require('mini.files').setup({ windows = { preview = true } })
  local minifiles_augroup = vim.api.nvim_create_augroup('ec-mini-files', {})
  vim.api.nvim_create_autocmd('User', {
    group = minifiles_augroup,
    pattern = 'MiniFilesWindowOpen',
    callback = function(args)
      vim.api.nvim_win_set_config(args.data.win_id, { border = 'double' })
    end,
  })
end)

-- mini.indentscope
later(function()
  require('mini.indentscope').setup({
    symbol = '│',
    options = { try_as_border = true },
  })
end)

-- mini.misc
later(function()
  require('mini.misc').setup({ make_global = { 'put', 'put_text', 'stat_summary', 'bench_time' } })
  MiniMisc.setup_auto_root()
end)

-- mini.move
later(function()
  require('mini.move').setup({ options = { reindent_linewise = false } })
end)

-- mini.operators
later(function()
  require('mini.operators').setup()
end)

-- mini.pick
later(function()
  require('mini.pick').setup({ window = { config = { border = 'double' } } })
  vim.ui.select = MiniPick.ui_select
  vim.keymap.set('n', ',', [[<Cmd>Pick buf_lines scope='current'<CR>]], { nowait = true })
end)

-- mini.splitjoin
later(function()
  require('mini.splitjoin').setup()
end)

-- mini.surround
later(function()
  require('mini.surround').setup({ search_method = 'cover_or_next' })
end)

-- mini.trailspace
later(function()
  require('mini.trailspace').setup()
end)

-- mini.visits
later(function()
  require('mini.visits').setup()
end)

-- nvim-treesitter/nvim-treesitter
now(function()
  local ts_spec = {
    source = 'nvim-treesitter/nvim-treesitter',
    checkout = 'master',
    hooks = {
      post_checkout = function()
        vim.cmd([[TSUpdate]])
      end,
    },
  }
  add({ source = 'nvim-treesitter/nvim-treesitter-textobjects', depends = { ts_spec } })
  add({ source = 'andymass/vim-matchup', depends = { ts_spec } })
  require('nvim-treesitter.configs').setup({
    ensure_installed = {
      'lua',
      'json',
      'regex',
      'query',
      'markdown',
      'markdown_inline',
      'yaml',
      'toml',
      'python',
      'vim',
      'vimdoc',
    },
    highlight = { enable = true },
    indent = { enable = false },
    incremental_selection = { enable = false },
    textobjects = { enable = false },
  })
end)

-- dstein64/vim-startuptime
later(function()
  add({ source = 'dstein64/vim-startuptime' })
  vim.g.startuptime_tries = 10
end)

-- stevearc/conform.nvim
later(function()
  add({ source = 'stevearc/conform.nvim' })
  require('conform').setup({
    formatters_by_ft = {
      lua = { 'stylua' },
    },
    format_on_save = {
      timeout_ms = 500,
    },
  })
end)

-- iamcco/markdown-preview.nvim
now(function()
  add({
    source = 'iamcco/markdown-preview.nvim',
    hooks = {
      post_checkout = function()
        vim.fn['mkdp#util#install']()
      end,
    },
  })
end)

-- kevinhwang91/nvim-ufo
now(function()
  add({
    source = 'kevinhwang91/nvim-ufo',
    depends = { 'kevinhwang91/promise-async' },
  })
  vim.o.foldcolumn = '1'
  vim.o.foldlevel = 99
  vim.o.foldlevelstart = 99
  vim.o.foldenable = true

  vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
  vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

  require('ufo').setup({
    provider_selector = function(bufnr, filetype, buftype)
      return { 'treesitter', 'indent' }
    end,
  })
end)

-- stevearc/oil.nvim
later(function()
  add({ source = 'stevearc/oil.nvim' })
  require('oil').setup({})
  vim.keymap.set('n', '-', [[<cmd>Oil<cr>]])
end)
