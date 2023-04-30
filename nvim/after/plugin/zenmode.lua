local status, zen = pcall(require, "zen-mode");
if (not status) then return end

zen.setup {
  window = {
    backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
    width = 0.85,    -- width of the Zen window
    height = 1,      -- height of the Zen window
  },
  plugins = {
    options = {
      enabled = true,
      ruler = false,               -- disables the ruler text in the cmd line area
      showcmd = false,             -- disables the command in the last line of the screen
    },
    twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
    gitsigns = { enabled = true }, -- disables git signs
    tmux = { enabled = true },     -- disables the tmux statusline
    alacritty = {
      enabled = false,
      font = "+2", -- font size
    },
  },
}


vim.keymap.set("n", "<leader>zen", vim.cmd.ZenMode)
