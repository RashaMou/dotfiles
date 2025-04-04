return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        go = { 'goimports', 'gofmt' },
        python = { 'isort', 'black' },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        typescript = { 'prettierd', 'prettier', stop_after_first = true },
        typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        json = { 'prettierd', 'prettier', stop_after_first = true },
        graphql = { 'prettierd', 'prettier', stop_after_first = true },
        markdown = { 'prettierd', 'prettier', stop_after_first = true },
        css = { 'prettierd', 'prettier', stop_after_first = true },
        scss = { 'prettierd', 'prettier', stop_after_first = true },
        html = { 'prettierd', 'prettier', stop_after_first = true },
        yaml = { 'yamlfix' },
        toml = { 'taplo' },
      },

      -- Default formatter configs
      formatters = {
        prettier = {
          args = {
            '--print-width',
            '100',
            '--tab-width',
            '2',
            '--double-quote',
            '--trailing-comma',
            'es5',
            '--semi',
            '--jsx-double-quote',
            '--bracket-same-line',
            'false',
          },
        },
        prettierd = {
          env = {
            PRETTIER_DEFAULT_CONFIG = vim.json.encode {
              printwidth = 100,
              tabWidth = 2,
              singleQuote = false,
              trailingComma = 'es5',
              bracketSameLine = false,
              semi = true,
              jsxSimgleQuote = false,
            },
          },
        },
      },

      keys = {
        {
          '<leader>f',
          function()
            require('conform').format { async = true, lsp_format = 'fallback' }
          end,
          mode = '',
          desc = '[F]ormat buffer',
        },
      },

      notify_on_error = true,
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },
}
