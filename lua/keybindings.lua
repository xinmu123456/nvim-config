vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}

map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- 分屏控制
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
map("n", "sc", "<C-w>c", opt)
map("n", "so", "<C-w>o", opt) -- close others

-- 比例控制（不常用，因为支持鼠标拖拽）
map("n", "s,", ":vertical resize +10<CR>", opt)
map("n", "s.", ":vertical resize -10<CR>", opt)
map("n", "s=", "<C-w>=", opt)
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)

-- alt + hjkl 在窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

-- 插件热键
-- nvim-tree 配置ctrl + e 切换
map("n", "<C-e>", ":NvimTreeToggle<CR>", opt)
-- bufferline 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)

-- lsp hot keys
local pluginKeys = {}

-- lsp 回调函数快捷键设置
pluginKeys.maplsp = function(mapbuf)
  -- rename
  mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  -- code action
  mapbuf("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  -- go xx (原生版本)
  -- mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  -- mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  -- mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)

  -- 使用Lspsaga替代 go xxx
  mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<CR>", opt)
  -- mapbuf("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opt)
  mapbuf("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions({ initial_mode = 'normal', })<CR>", opt)
  mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
  -- diagnostic
  mapbuf("n", "go", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  mapbuf("n", "gn", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- leader + =
  mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
  -- mapbuf('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
  return {
    -- 上一个
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    -- 下一个
    ["<C-j>"] = cmp.mapping.select_next_item(),
    -- 出现补全
    ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
    -- 取消
    ["<A-,>"] = cmp.mapping(
      {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close()
      }
    ),
    -- 配置上下左右箭头
    ["<Left>"] = cmp.mapping(
      {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close()
      }
    ),
    ["<Right>"] = cmp.mapping(
      {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close()
      }
    ),
    ["<Up>"] = cmp.mapping.select_prev_item(),
    ["<Down>"] = cmp.mapping.select_next_item(),
    -- 确认
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<Tab>"] = cmp.mapping.confirm(
      {
        select = true,
        behavior = cmp.ConfirmBehavior.Replace
      }
    ),
    -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"})
  }
end

-- 代码注释插件
-- see ./lua/plugin-config/comment.lua
pluginKeys.comment = {
  -- Normal 模式快捷键
  toggler = {
    line = "gcc", -- 行注释
    block = "gbc" -- 块注释
  },
  -- Visual 模式
  opleader = {
    line = "gc",
    bock = "gb"
  }
}
-- ctrl + /
map("n", "<C-_>", "gcc", {noremap = false})
map("v", "<C-_>", "gcc", {noremap = false})

-- 自定义 toggleterm 3个不同类型的命令行窗口
-- <leader>ta 浮动
-- <leader>tb 右侧
-- <leader>tc 下方
-- 特殊lazygit 窗口，需要安装lazygit
-- <leader>tg lazygit
pluginKeys.mapToggleTerm = function(toggleterm)
  vim.keymap.set({"n", "t"}, "<leader>ta", toggleterm.toggleA)
  vim.keymap.set({"n", "t"}, "<leader>tb", toggleterm.toggleB)
  vim.keymap.set({"n", "t"}, "<leader>tc", toggleterm.toggleC)
  vim.keymap.set({"n", "t"}, "<leader>tg", toggleterm.toggleG)
  vim.keymap.set({"n", "t"}, "<C-t>", toggleterm.toggleC)
end

return pluginKeys
