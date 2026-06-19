-- jinja.vim provides jinja syntax/ftdetect.
--
-- It cannot be installed via vim.pack: vim.pack always runs
-- `git submodule update --init --recursive`, and jinja.vim's .gitmodules
-- declares a `test/bin` submodule with no resolvable URL, which aborts the
-- install. So we bootstrap-clone it ourselves WITHOUT submodules (plain
-- `git clone` does not recurse) and add it to the runtimepath, the same
-- approach used for the local Ghostty runtime.
local dir = vim.fn.stdpath 'data' .. '/site/pack/manual/start/jinja.vim'
if not vim.uv.fs_stat(dir) then
  vim.notify('Cloning jinja.vim (no submodules)...', vim.log.levels.INFO)
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/HiPhish/jinja.vim', dir }
end
vim.opt.rtp:append(dir)
