vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Create a map with noremap set to true
local function mkNoremap(mode, key, map, opts)
  opts = opts or {}

  -- Merge the passed opts with the base ones. Using non-recursive tbl_extend.
  base_opts = { noremap = true, silent = true }
  opts = vim.tbl_extend("force", base_opts, opts)

  vim.keymap.set(mode, key, map, opts)
end

function nnoremap(key, map, opts)
  mkNoremap("n", key, map, opts)
end

function vnoremap(key, map, opts)
  mkNoremap("x", key, map, opts)
end

function inoremap(key, map, opts)
  mkNoremap("i", key, map, opts)
end

function onoremap(key, map, opts)
  mkNoremap("o", key, map, opts)
end

function tnoremap(key, map, opts)
  mkNoremap("t", key, map, opts)
end

function anoremap(key, map, opts)
  mkNoremap({ "n", "x", "o" }, key, map, opts)
end

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
nnoremap("<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- <C-\><C-n> is the default to exit terminal mode
-- Allow EscEsc instead
tnoremap("<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Window navigation and resizing
nnoremap("<M-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
nnoremap("<M-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
nnoremap("<M-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
nnoremap("<M-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
nnoremap("<M-S-l>", "<C-w>5>", { desc = "Grow current window horizontally" })
nnoremap("<M-S-h>", "<C-w>5<", { desc = "Shrink current window horizontally" })
nnoremap("<M-S-j>", "<C-w>5+", { desc = "Grow current window vertically" })
nnoremap("<M-S-k>", "<C-w>5-", { desc = "Shrink current window vertically" })
nnoremap("<M-=>", "<C-w>=", { desc = "Equalize windows" })
nnoremap("<M-n>", "gt", { desc = "Go to the next tab page" })
nnoremap("<M-p>", "gT", { desc = "Go to the previous tab page" })

-- Yank contents of given register
-- Some highligts:
-- y"% for current filename
-- y": for last command
-- y"/ for last search
-- y". for last inserted test
-- y"=sin(3.14) for your mathematical needs
nnoremap('y"', function()
  local prompt = vim.fn.getcharstr()
  local contents
  -- Run expression and evaluate it
  if prompt == "=" then
    local expr = vim.fn.input({ prompt = "=" })
    local unsplit_output = vim.fn.eval(expr)
    if type(unsplit_output) ~= "string" then
      contents = unsplit_output
    else
      local split_output = vim.fn.split(unsplit_output, "\n")
      contents = #split_output == 1 and split_output[1] or unsplit_output
    end
  else
    contents = vim.fn.keytrans(vim.fn.getreg(prompt))
  end
  vim.fn.setreg(vim.v.register, contents)
end)
