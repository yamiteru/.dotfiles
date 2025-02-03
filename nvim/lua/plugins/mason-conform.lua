-- TODO: Use require_cwd instead of custom logic
-- https://github.com/stevearc/conform.nvim/blob/339b3e4519ec49312d34fcfa275aa15bfaa67025/README.md?plain=1#L557
return {
  "zapling/mason-conform.nvim",
  event = "BufReadPre",
  config = true,
  dependencies = {
    "williamboman/mason.nvim",
    {
      "stevearc/conform.nvim",
      cmd = { "Format" },
      keys = {
        {
          "<leader>x",
          function()
            vim.cmd("Format")
          end,
          mode = "n",
        },
      },
      config = function()
        local patterns = {
          biome = "biome",
          prettier = "prettier",
          eslint_d = "eslint",
          stylua = "stylua",
          stylelint = "stylelint",
          zig = "build.zig",
        }

        local language_config = {
          css = {
            formatters = { "biome", "prettier", "stylelint" },
            file_types = { "css" }
          },
          html = {
            formatters = { "biome", "prettier" },
            file_types = { "html" }
          },
          javascript = {
            formatters = { "biome", "eslint_d", "prettier" },
            file_types = { "js", "mjs", "cjs" }
          },
          javascriptreact = {
            formatters = { "biome", "eslint_d", "prettier" },
            file_types = { "jsx" }
          },
          svelte = {
            formatters = { "biome", "eslint_d", "prettier" },
            file_types = { "svelte" }
          },
          json = {
            formatters = { "biome", "prettier" },
            file_types = { "json" }
          },
          jsonc = {
            formatters = { "biome", "prettier" },
            file_types = { "jsonc" }
          },
          lua = {
            formatters = { "stylua" },
            file_types = { "lua" }
          },
          typescript = {
            formatters = { "biome", "eslint_d", "prettier" },
            file_types = { "ts", "mts", "d.ts", "cts" }
          },
          typescriptreact = {
            formatters = { "biome", "eslint_d", "prettier" },
            file_types = { "tsx" }
          },
          yaml = {
            formatters = { "biome", "prettier" },
            file_types = { "yaml", "yml" }
          },
          zig = {
            formatters = { "zls" },
            file_types = { "zig" }
          }
        }

        local formatter_cache = {}

        local function get_nearest_formatter()
          local current_buffer = vim.api.nvim_buf_get_name(0)
          local current_dir = vim.fs.dirname(current_buffer)

          for config_dir, cache_entry in pairs(formatter_cache) do
            if current_dir:find(config_dir, 1, true) == 1 then
              return { cache_entry.formatter }
            end
          end

          local available = require("conform").list_formatters(0)
          local nearest = { distance = math.huge, formatter = nil, config_dir = nil }

          for _, fmt in ipairs(available) do
            local search_term = patterns[fmt.name]
            if search_term then
              local config_files = vim.fs.find(function(name)
                return string.match(string.lower(name), string.lower(search_term))
              end, {
                path = current_buffer,
                upward = true,
                type = "file"
              })

              local config = config_files[1]
              if config then
                local config_dir = vim.fs.dirname(config)
                local relative_path = vim.fn.fnamemodify(config_dir, ':p'):sub(#vim.fn.fnamemodify(current_dir, ':p') + 1)
                local distance = select(2, relative_path:gsub("/", ""))

                if distance < nearest.distance then
                  nearest = { 
                    distance = distance, 
                    formatter = fmt.name,
                    config_dir = config_dir
                  }
                end
              end
            end
          end

          if nearest.formatter and nearest.config_dir then
            formatter_cache[nearest.config_dir] = {
              formatter = nearest.formatter
            }
          end

          return nearest.formatter and { nearest.formatter } or nil
        end

        local formatters_by_ft = {}
        for lang, config in pairs(language_config) do
          formatters_by_ft[lang] = config.formatters
        end

        require("conform").setup({
          formatters_by_ft = formatters_by_ft,
					notify_on_error = false,
					notify_no_formatters = false,
        })

        vim.api.nvim_create_user_command("Format", function()
          local formatters = get_nearest_formatter()

          if formatters then
            require("conform").format({
              async = true,
              formatters = formatters,
            })
          end
        end, {})

        local file_patterns = {}
        for _, config in pairs(language_config) do
          for _, ft in ipairs(config.file_types) do
            table.insert(file_patterns, "*." .. ft)
          end
        end

        vim.api.nvim_create_autocmd("BufWritePost", {
          pattern = file_patterns,
          callback = function()
            vim.cmd("Format")
          end,
        })

        vim.api.nvim_create_autocmd("BufLeave", {
          pattern = file_patterns,
          callback = function()
            vim.cmd("Format")
          end,
        })
      end,
    },
  },
}
