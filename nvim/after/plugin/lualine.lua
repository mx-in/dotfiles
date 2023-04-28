local status, lualine = pcall(require, 'lualine')
if (not status) then return end

local navic = require('nvim-navic')

local function get_directory()
  local current_file_path = vim.fn.expand('%:p:h')
  local current_folder_name = vim.fn.fnamemodify(current_file_path, ':t')
  return current_folder_name
end

local function get_filename()
  return vim.fn.expand('%:t')
end

local function hl_text(icon_group, icon, text_group, text)
  return '%#'
      .. icon_group
      .. '#'
      .. icon
      .. ' '
      .. '%*%#'
      .. text_group
      .. '#'
      .. text
      .. ' '
      .. '%*'
end

vim.api.nvim_set_hl(0, 'NavicIconsFolder', { default = true, bg = '', fg = '#88CCF6' })

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    disabled_filetypes = {}
  },
  winbar = {
    lualine_c = {
      {
        function()
          local icon, color = require 'nvim-web-devicons'.get_icon_color(get_filename())
          vim.api.nvim_set_hl(0, 'NavicIconsFileType', { default = true, bg = '', fg = color })
          local location = navic.get_location()
          location = location == '' and location or '> ' .. location
          return hl_text('NavicIconsFolder', '', 'NavicText', get_directory())
              .. '> '
              .. hl_text('NavicIconsFileType', icon, 'NavicText', get_filename())
              .. location
        end,
        cond = function()
          return navic.is_available()
        end,
      }
    },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = { {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1            -- 0 = just filename, 1 = relative path, 2 = absolute path
    } },
    lualine_x = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = {
          error = ' ',
          warn = ' ',
          info = ' ',
          hint = ' '
        }
      },
      'encoding',
      'filetype'
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1            -- 0 = just filename, 1 = relative path, 2 = absolute path
    } },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { 'fugitive' },
}
