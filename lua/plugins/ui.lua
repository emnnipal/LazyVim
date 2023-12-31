return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local lualine = opts.sections
      lualine.lualine_x[#lualine.lualine_x + 1] = {
        function()
          local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
          if #buf_clients == 0 then
            return "LSP Inactive"
          end

          local buf_client_names = {}

          for _, client in pairs(buf_clients) do
            if client.name ~= "null-ls" and client.name ~= "copilot" then
              table.insert(buf_client_names, client.name)
            end
          end

          local unique_client_names = table.concat(buf_client_names, ", ")
          local language_servers = string.format("[%s]", unique_client_names)

          return language_servers
        end,
      }

      lualine.lualine_y = nil
      lualine.lualine_z = nil
    end,
  },
  {
    "echasnovski/mini.indentscope",
    enabled = false,
  },
}
