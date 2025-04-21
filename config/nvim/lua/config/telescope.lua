local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup {
  defaults = {
    prompt_prefix = "🔍 ",
    selection_caret = " ",
    path_display = { "smart" },

    mappings = {
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<C-q>"] = "send_to_qflist",
        ["<ESC>"] = "close",
      },
      n = {
        ["q"] = "close",
      },
    },
  },

  pickers = {
    find_files = {
      hidden = true,
    },
    live_grep = {
      -- additional config if needed
    },
  },

  extensions = {
    -- if you're using extensions like fzf, add config here
  },
}

-- Load Telescope extensions here
-- pcall(telescope.load_extension, "fzf")
-- pcall(telescope.load_extension, "projects")

-- Keybindings (Optional)
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)

