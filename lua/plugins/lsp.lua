return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable a keymap
      keys[#keys + 1] = { "K", false }
    end,
    opts = {
      -- autoformat = false, -- disable autoformat for lsp
      setup = {
        -- disable auto fix for eslint
        eslint = function() end,
      },
      servers = {
        eslint = {
          settings = {
            -- This change in https://github.com/LazyVim/LazyVim/pull/2071 broke ESLint when
            -- working with mono repositories. To address this issue, I am fixing the change by adding this configuration.
            workingDirectory = { mode = "auto" },
          },
        },
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        hover = {
          silent = true, -- set to true to not show a message if hover is not available
        },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      -- Add your desired languages here to ensure they are installed
      vim.list_extend(opts.ensure_installed or {}, {
        "svelte-language-server",
        "prisma-language-server",
        "emmet-language-server",
        "css-lsp",
        "json-lsp",
      })
    end,
  },
}
