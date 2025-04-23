local M = {}

M.vault = "~/Documents/Obsidian Vault"

M.opts = {
  ui = { enable = false },

  workspaces = {
    {
      name = "main",
      path = M.vault,
    },
    {
      name = "no-vault",
      path = function()
        -- alternatively use the CWD:
        -- return assert(vim.fn.getcwd())
        return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
      end,
      overrides = {
        notes_subdir = vim.NIL, -- have to use 'vim.NIL' instead of 'nil'
        new_notes_location = "current_dir",
        templates = {
          folder = vim.NIL,
        },
        daily_notes = {
          folder = vim.NIL,
        },
        disable_frontmatter = true,
      },
    },
  },

  notes_subdir = "00_Zettelkasten",

  daily_notes = {
    -- Optional, if you keep daily notes in a separate directory.
    folder = "07_Daily",
    -- Optional, if you want to change the date format for the ID of daily notes.
    date_format = "%d-%m-%Y",
    -- Optional, if you want to change the date format of the default alias of daily notes.
    alias_format = "%B %-d, %Y",
    -- Optional, default tags to add to each new daily note created.
    default_tags = { "daily" },
    -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
    template = "Daily_note.md",
  },

  templates = {
    folder = "05_Templates",
    date_format = "%d-%m-%Y",
    time_format = "%H:%M",
    -- A map for custom variables, the key should be the variable and the value a function
    substitutions = {},
  },
  attachments = {
    -- The default folder to place images in via `:ObsidianPasteImg`.
    -- If this is a relative path it will be interpreted as relative to the vault root.
    -- You can always override this per image by passing a full path to the command instead of just a filename.
    img_folder = "06_Files", -- This is the default
  },
}

return M
