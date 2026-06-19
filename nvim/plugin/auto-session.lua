vim.pack.add {
  'https://github.com/rmagatti/auto-session',
}

require('auto-session').setup {
  auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
  session_lens = {
    buftypes_to_ignore = {},
    load_on_setup = true,
    previewer = false,
  },
}
