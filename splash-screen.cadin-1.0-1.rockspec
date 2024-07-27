package = 'splash-screen.cadin'
version = '1.0-1'
source = {
  url = 'git+https://github.com/cadin-org/splash-screen.git',
}
description = {
  homepage = '',
  license = 'UNLICENSE',
}
dependencies = {
  'lua >= 5.1',
}
build = {
  type = 'builtin',
  modules = {
    init = 'init.lua',
  },
}
