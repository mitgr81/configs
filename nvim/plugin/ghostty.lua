-- Ghostty ships a Vim runtime locally; it's not a git plugin, so just add its
-- directory to the runtimepath instead of using vim.pack.
local ghostty_rtp = '/Applications/Ghostty.app/Contents/Resources/vim/vimfiles/'
if vim.uv.fs_stat(ghostty_rtp) then
  vim.opt.rtp:append(ghostty_rtp)
end
