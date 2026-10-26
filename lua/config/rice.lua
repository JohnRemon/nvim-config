-- Rice-aware colorscheme loader.
--
-- `rice apply` symlinks ~/.local/share/rice/nvim-theme.lua to the active rice.
-- The slot lives outside this repo so the nvim config stays self-contained and
-- a fresh clone still works: when the slot is missing or invalid we use the
-- Gruvbox defaults below.
--
-- Running instances pick up a rice switch on FocusGained (mtime check) or on
-- demand with :RiceTheme.
local M = {}

local slot = vim.fn.expand("~/.local/share/rice/nvim-theme.lua")

local fallback = {
  colorscheme = "gruvbox",
  contrast = "hard",
  background = "dark",
}

-- Theme currently applied, used to skip redundant reloads.
local applied = nil

local function read_slot()
  local ok, theme = pcall(dofile, slot)
  if not ok or type(theme) ~= "table" or type(theme.colorscheme) ~= "string" then
    return nil
  end
  return theme
end

local function load(theme)
  if theme.background then
    vim.o.background = theme.background
  end

  if theme.colorscheme == "gruvbox" then
    require("gruvbox").setup({ contrast = theme.contrast or "hard" })
    vim.cmd.colorscheme("gruvbox")
  elseif theme.colorscheme:find("catppuccin", 1, true) then
    -- load() keeps the integrations configured by the LazyVim spec.
    require("catppuccin").load(theme.flavour or "mocha")
  else
    vim.cmd.colorscheme(theme.colorscheme)
  end
end

-- Apply the active rice's colorscheme. Pass { force = true } to reload even if
-- the name has not changed.
function M.apply(opts)
  opts = opts or {}
  local theme = read_slot() or fallback

  if not opts.force and applied and applied.colorscheme == theme.colorscheme then
    return theme
  end

  local ok, err = pcall(load, theme)
  if not ok then
    vim.notify(("Rice theme %q failed: %s"):format(theme.colorscheme, err), vim.log.levels.WARN)
    if theme.colorscheme ~= fallback.colorscheme then
      pcall(load, fallback)
      theme = fallback
    end
  end

  applied = theme
  return theme
end

-- Change stamp for the slot: target path plus mtime and size. The realpath is
-- nil while the slot does not exist yet, so a later `rice apply` also triggers.
function M.stamp()
  local real = vim.uv.fs_realpath(slot)
  local stat = vim.uv.fs_stat(slot)
  return table.concat({
    real or "",
    tostring(stat and stat.mtime and stat.mtime.sec or 0),
    tostring(stat and stat.mtime and stat.mtime.nsec or 0),
    tostring(stat and stat.size or 0),
  }, ":")
end

-- Re-apply when the slot changed since the last apply (called on FocusGained).
function M.refresh()
  local stamp = M.stamp()
  if stamp ~= M.applied_stamp then
    M.applied_stamp = stamp
    M.apply({ force = true })
  end
end

M.applied_stamp = M.stamp()

vim.api.nvim_create_user_command("RiceTheme", function()
  local theme = M.apply({ force = true })
  M.applied_stamp = M.stamp()
  vim.notify(("Rice theme: %s"):format(theme.colorscheme), vim.log.levels.INFO)
end, { desc = "Apply the colorscheme of the active rice" })

vim.api.nvim_create_autocmd("FocusGained", {
  group = vim.api.nvim_create_augroup("RiceTheme", { clear = true }),
  callback = M.refresh,
})

return M
