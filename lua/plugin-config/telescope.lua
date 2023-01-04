local status, actions = pcall(require, "telescope.actions")
if (not status) then
  vim.notify('[err]: plug telescope not install')
  return
end

--local actions = require('telescope.actions')
-- Global remapping
------------------------------
require("telescope").setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close,
        ["l"] = actions.file_edit
      }
    },
    file_ignore_patterns = {"./node_modules"}
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case" -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("fzf")

--按键设置
vim.api.nvim_set_keymap("n", "ff", [[<cmd>lua require('telescope.builtin').find_files()<cr>]], {})
vim.api.nvim_set_keymap("n", "fg", [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], {})
vim.api.nvim_set_keymap("n", "fb", [[<cmd>lua require('telescope.builtin').buffers()<cr>]], {})
vim.api.nvim_set_keymap("n", "fh", [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], {})
-- vim.api.nvim_set_keymap("n", "<leader>/", [[<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>]], {})
vim.api.nvim_set_keymap("n", "fc", [[<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>]], {})
