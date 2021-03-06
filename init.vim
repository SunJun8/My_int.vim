" ================
" 插件
" ================
call plug#begin('~/.vim/plugged')
"Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'kyazdani42/nvim-tree.lua'
Plug 'romgrk/barbar.nvim'
Plug 'nmaiti/fzf_cscope.vim'

Plug 'farmergreg/vim-lastplace'

"cursorline
Plug 'yamatsum/nvim-cursorline'

"Fuzzy
Plug 'junegunn/fzf', { 'dir': '~/.nvim-fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'

"主题
Plug 'sainnhe/sonokai'
" Plug 'sainnhe/gruvbox-material'

"C高亮
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'p00f/nvim-ts-rainbow'

"VIM 中文help
Plug 'yianwillis/vimcdoc'

"括号自动补全
Plug 'jiangmiao/auto-pairs'

"清除行尾无效空格
Plug 'ntpeters/vim-better-whitespace'

" Plug 'preservim/tagbar'
Plug 'liuchengxu/vista.vim'

"注释
Plug 'numToStr/Comment.nvim'

"nvim-vmp
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'ojroques/nvim-lspfuzzy'
Plug 'tami5/lspsaga.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
" Plug 'hrsh7th/cmp-vsnip'
" Plug 'hrsh7th/vim-vsnip'

" For luasnip users.
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" For ultisnips users.
" Plug 'SirVer/ultisnips'
" Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" For snippy users.
" Plug 'dcampos/nvim-snippy'
" Plug 'dcampos/cmp-snippy'

"搜索
Plug 'kevinhwang91/nvim-hlslens'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

"Replace
Plug 'windwp/nvim-spectre'

call plug#end()

" =================
" 主题
" =================
"Color options
set background=dark
" Important!!
if has('termguicolors')
  set termguicolors
endif

" The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'espresso'
let g:sonokai_enable_italic = 0
let g:sonokai_disable_italic_comment = 1
let g:sonokai_transparent_background = 0

" let g:gruvbox_material_statusline_style = 'mix'
" let g:gruvbox_material_background = 'hard'
" let g:gruvbox_material_enable_italic = 0
" let g:gruvbox_material_disable_italic_comment = 1

colorscheme sonokai

let g:airline_theme = 'sonokai'
" " let g:airline_theme = 'gruvbox_material'
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#vista#enabled = 0
let g:airline_powerline_fonts = 1        " 启用powerline样式字体



" =================
" 通用配置
" =================
set clipboard+=unnamedplus      " 启用共享粘贴板
set number                      " 显示行号
set relativenumber              " 显示相对行号（这个非常重要，慢慢体会）
set autoindent                  " 自动缩进
set smartindent                 " 智能缩进
set tabstop=2                   " 设置 tab 制表符所占宽度为 4
set softtabstop=2               " 设置按 tab 时缩进的宽度为 4
set shiftwidth=2                " 设置自动缩进宽度为 4
set expandtab                   " 缩进时将 tab 制表符转换为空格
set nowrap                      " 不自动换行
set cursorcolumn                " 高亮当前列
set cursorline                  " 高亮当前行
set ruler                       " 显示当前行号及列号
set cindent                     " C 缩进
set showmatch                   " 高亮显示匹配的括号
set nofoldenable                " 取消自动折叠
set hlsearch                    " 高亮搜索
set incsearch                   " 键入搜索
set mouse=nvi                   " 鼠标
set noshowmode                  " 不显示status


" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
" if has("autocmd")
"     autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" endif


" ==================
" Mapping 快捷键
" =================
let mapleader = ","
let g:mapleader = ","

"Save
noremap <C-S> :w<CR>

" easier moving between tabs
map <Leader>tp <esc>:tabprevious<CR>
map <Leader>tn <esc>:tabnext<CR>

" Quick quit command
noremap <Leader>q :q<CR>        " 关闭当前窗口
noremap <Leader>Q :qa!<CR>      " 关闭所有窗口

" 窗口切换
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" terminal
tnoremap <esc> <C-\><C-N>

" =================
" 专有配置
" =================

" Clang format
map <leader>mm :py3f /home/jokeo/tool/clang/tools/clang-format/clang-format.py<cr>
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

"Replace
nnoremap <leader>S :lua require('spectre').open()<CR>
nnoremap <leader>sw :lua require('spectre').open_visual({select_word=true})<CR>
vnoremap <leader>s :lua require('spectre').open_visual()<CR>
nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>

"FZF
nmap <silent> <F8> :Files<CR>
nnoremap <leader>fl :BLines<cr>
nnoremap <leader>fb :Buffers<cr>

"vista.vim
nmap <silent> <F2> :Vista finder nvim_lsp<CR>
let g:vista_default_executive = 'nvim_lsp'
let g:vista_executive_for = {
  \ 'c': 'nvim_lsp',
  \ 'cpp': 'nvim_lsp',
  \ 'php': 'nvim_lsp',
  \ 'python': 'nvim_lsp',
  \ }
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1

"Cscope
nmap <silent> <F5> :!cscope -Rbcq<CR>:cs reset<CR><CR>

if has("cscope")
    set csprg=/usr/bin/cscope
    set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
		set csto=0
		set cst
		" add any database in current directory
		if filereadable("cscope.out")
		    silent cs add cscope.out
		" else add database pointed to by environment
		elseif $CSCOPE_DB != ""
		    silent cs add $CSCOPE_DB
		endif

  " map <C-_> :cstag <C-R>=expand("<cword>")<CR><CR>
  map g<C-]> :cs find c <C-R>=expand("<cword>")<CR><CR>
	map g<C-\> :cs find s <C-R>=expand("<cword>")<CR><CR>
  "Find this C symbol
  nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
  "Find this definition
	nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
  "Find functions calling this function
	nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
  "Find this text string
	nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
  "Find this egrep pattern
	nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
  "Find this file
	nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
  "Find files #including this file
	nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  "Find functions called by this function
	nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>a :cs find a <C-R>=expand("<cword>")<CR><CR>
endif

"nvim-cmp
set completeopt=menu,menuone,noselect

"nvim_lsp
nnoremap <silent> <leader>ls <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> <leader>ll <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>lg <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>la <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>lm; <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <leader>ln, <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

"lspsaga
nnoremap <silent> <leader>ld <cmd>lua require'lspsaga.provider'.preview_definition()<CR>

"Nvim-tree
let g:nvim_tree_highlight_opened_files = 1
" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }

nnoremap <silent> <F4> :NvimTreeToggle<CR>
nnoremap <leader>tr :NvimTreeRefresh<CR>
nnoremap <leader>tt :NvimTreeFindFileToggle<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them

" Bufferline
" Move to previous/next
nnoremap <silent>    <leader>, :BufferPrevious<CR>
nnoremap <silent>    <leader>. :BufferNext<CR>
" Re-order to previous/next
" nnoremap <silent>    <leader><<> :BufferMovePrevious<CR>
" nnoremap <silent>    <leader><>> :BufferMoveNext<CR>
" Pin/unpin buffer
nnoremap <silent>    <leader>bp :BufferPin<CR>
" Close buffer
nnoremap <silent>    <leader>bq :BufferClose<CR>
" Wipeout buffer
nnoremap <silent>    <leader>bc :BufferCloseAllButCurrent<CR>
nnoremap <silent>    <leader>bl :BufferCloseBuffersLeft<CR>
nnoremap <silent>    <leader>br :BufferCloseBuffersRight<CR>

lua <<EOF
  -- Comment
  require('Comment').setup()

  -- hlslens
  require('hlslens').setup({
    calm_down = true,
    nearest_only = true,
    nearest_float_when = 'always'
  })

  local kopts = {noremap = true, silent = true}

  vim.api.nvim_set_keymap('n', 'n',
      [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
      kopts)
  vim.api.nvim_set_keymap('n', 'N',
      [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
      kopts)
  vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
  vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
  vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
  vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

  vim.api.nvim_set_keymap('x', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
  vim.api.nvim_set_keymap('x', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
  vim.api.nvim_set_keymap('x', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
  vim.api.nvim_set_keymap('x', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

  vim.api.nvim_set_keymap('n', '<Leader>n', ':noh<CR>', kopts)

  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace,
        }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  local lsp_installer = require("nvim-lsp-installer")

  -- Register a handler that will be called for all installed servers.
  -- Alternatively, you may also register handlers on specific server instances instead (see example below).
  lsp_installer.on_server_ready(function(server)
    local opts = {}

      -- (optional) Customize the options passed to the server
      if server.name == "clangd" then
        opts.cmd = {"/home/jokeo/.local/share/nvim/lsp_servers/clangd/clangd", "--background-index"}
        opts.capabilities =  capabilities
      end

      -- This setup() function is exactly the same as lspconfig's setup function.
      -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
      server:setup(opts)
  end)

  require('lspfuzzy').setup {}

  --nvim-treesitter
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    git = {
      ignore = 0
    },
    highlight = {
      enable = true,              -- false will disable the whole extension
      additional_vim_regex_highlighting = false,
    },
    rainbow = {
      enable = true,
      extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = nil, -- Do not enable for files with more than n lines, int
    }
  }

  local saga = require 'lspsaga'
  saga.setup{}

  -- Replace
  require('spectre').setup({
    mapping={
      ['toggle_line'] = {
          map = "dd",
          cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
          desc = "toggle current item"
      },
      ['enter_file'] = {
          map = "<cr>",
          cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
          desc = "goto current file"
      },
      ['send_to_qf'] = {
          map = "<leader>sq",
          cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
          desc = "send all item to quickfix"
      },
      ['replace_cmd'] = {
          map = "<leader>sc",
          cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
          desc = "input replace vim command"
      },
      ['show_option_menu'] = {
          map = "<leader>so",
        cmd = "<cmd>lua require('spectre').show_options()<CR>",
          desc = "show option"
      },
      ['run_replace'] = {
          map = "<leader>sr",
          cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
          desc = "replace all"
      },
      ['change_view_mode'] = {
          map = "<leader>sv",
          cmd = "<cmd>lua require('spectre').change_view()<CR>",
          desc = "change result view mode"
      },
      ['toggle_live_update']={
        map = "tu",
        cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>",
        desc = "update change when vim write file."
      },
      ['toggle_ignore_case'] = {
        map = "ti",
        cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
        desc = "toggle ignore case"
      },
      ['toggle_ignore_hidden'] = {
        map = "th",
        cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>",
        desc = "toggle search hidden"
      },
      -- you can put your mapping here it only use normal mode
    },
  })

  -- following options are the default
  -- each of these are documented in `:help nvim-tree.OPTION_NAME`
  require'nvim-tree'.setup {
    disable_netrw       = true,
    hijack_netrw        = true,
    open_on_setup       = false,
    ignore_ft_on_setup  = {},
    auto_close          = true,
    open_on_tab         = false,
    hijack_cursor       = false,
    update_cwd          = false,
    update_to_buf_dir   = {
      enable = true,
      auto_open = true,
    },
    diagnostics = {
      enable = false,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      }
    },
    update_focused_file = {
      enable      = false,
      update_cwd  = false,
      ignore_list = {}
    },
    system_open = {
      cmd  = nil,
      args = {}
    },
    filters = {
      dotfiles = false,
      custom = {}
    },
    git = {
      enable = true,
      ignore = true,
      timeout = 500,
    },
    view = {
      width = 40,
      height = 30,
      hide_root_folder = false,
      side = 'left',
      auto_resize = false,
      mappings = {
        custom_only = false,
        list = {}
      },
      number = false,
      relativenumber = false,
      signcolumn = "yes"
    },
    trash = {
      cmd = "trash",
      require_confirm = true
    },
    actions = {
      change_dir = {
        global = false,
      },
      open_file = {
        quit_on_open = false,
      }
    }
  }

EOF
