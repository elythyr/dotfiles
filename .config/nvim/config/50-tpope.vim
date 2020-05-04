if exists('*packager#init')
  call packager#add('tpope/vim-surround')
  call packager#add('tpope/vim-commentary')
  call packager#add('tpope/vim-scriptease')
  call packager#add('tpope/vim-unimpaired')
  " call packager#add('tpope/vim-endwise')
  " call packager#add('tpope/vim-speeddating')
  call packager#add('tpope/vim-abolish')
  call packager#add('tpope/vim-fugitive')
  call packager#add('tpope/vim-repeat')
  call packager#add('tpope/vim-dispatch')
  call packager#add('radenling/vim-dispatch-neovim')
  call packager#add('tpope/vim-projectionist')
  call packager#add('tpope/vim-eunuch')
  call packager#add('tpope/vim-sleuth')
endif

" Hide fugitive://**// in buffer name and add [git] at then end instead
let g:airline#extensions#fugitiveline#enabled = 1

let g:projectionist_heuristics = {
    \ 'composer.json&src/&tests/': {
        \ 'src/*.php': {
            \ 'type': 'src',
            \ 'skeleton': 'class',
            \ 'alternate': [
              \ 'tests/Unit/{}Test.php',
              \ 'tests/Integration/{}Test.php',
              \ 'tests/Functional/{}Test.php',
              \ 'tests/{}Test.php',
            \ ]
        \ },
        \ 'tests/Unit/*Test.php': {
            \ 'type': 'unittest',
            \ 'skeleton': 'pucase',
            \ 'alternate': 'src/{}.php',
        \ },
        \ 'tests/*Test.php': {
            \ 'type': 'test',
            \ 'skeleton': 'pucase',
            \ 'alternate': 'src/{}.php',
        \ },
        \ 'lib/**/src/*.php': {
            \ 'type': 'src',
            \ 'skeleton': 'class',
            \ 'alternate': 'lib/{dirname|basename}/tests/{basename}Test.php',
        \ },
        \ 'lib/**/tests/*Test.php': {
            \ 'type': 'test',
            \ 'skeleton': 'pucase',
            \ 'alternate': 'lib/{dirname|basename}/src/{basename}.php',
        \ },
        \ 'src/**/Command/*Command.php': {
            \ 'type': 'command',
            \ 'skeleton': 'sfcommand',
            \ 'alternate': [
                \ 'src/{dirname}/Handler/{basename}Handler.php',
                \ 'src/{dirname}/Command/{basename}CommandHandler.php',
            \ ],
        \ },
        \ 'src/**/Handler/*Handler.php': {
            \ 'type': 'handler',
            \ 'skeleton': 'class',
            \ 'alternate': 'src/{dirname|basename}/Command/{basename}Command.php',
        \ },
    \ },
    \ 'src/Kernel.php&public/index.php': {
        \ 'config/*': {
            \ 'type': 'config',
        \ },
        \ 'src/Command/*Command.php': {
            \ 'type': 'command',
            \ 'skeleton': 'sfcommand',
        \ },
        \ 'src/Controller/*Controller.php': {
            \ 'type': 'controller',
            \ 'skeleton': 'sfcontroller',
        \ },
        \ 'src/DataFixtures/*Fixtures.php': {
            \ 'type': 'fixture',
            \ 'skeleton': 'sffixture',
            \ 'alternate': 'src/Entity/{}.php',
        \ },
        \ 'src/Entity/*.php': {
            \ 'type': 'entity',
            \ 'skeleton': 'sfentity',
            \ 'alternate': [
                \ 'src/Repository/{}Repository.php',
                \ 'src/Controller/{}Controller.php',
                \ 'src/Form/{}Type.php',
            \ ],
        \ },
        \ 'src/Repository/*Repository.php': {
            \ 'type': 'repository',
            \ 'alternate': 'src/Entity/{}.php',
            \ 'skeleton': 'sfrepository',
        \ },
        \ 'src/Event/*Event.php': {
            \ 'type': 'event',
            \ 'skeleton': 'sfevent',
        \ },
        \ 'src/EventSubscriber/*Subscriber.php': {
            \ 'type': 'subscriber',
            \ 'skeleton': 'sfsubscriber',
        \ },
        \ 'src/Exception/*Exception.php': {
            \ 'type': 'exception',
        \ },
        \ 'src/Form/*Type.php': {
            \ 'type': 'form',
            \ 'alternate': 'src/Entity/{}.php',
            \ 'skeleton': 'sfform',
        \ },
        \ 'src/Form/Type/*Type.php': {
            \ 'type': 'form',
            \ 'alternate': 'src/Entity/{}.php',
            \ 'skeleton': 'sfform',
        \ },
        \ 'templates/*.html.twig': {
            \ 'type': 'template',
            \ 'skeleton': 'sftemplate',
        \ },
        \ 'config/services.yaml|config/services.yml': {
            \ 'type': 'services',
        \ },
        \ 'templates/*.css|templates/*.scss': {
            \ 'type': 'css',
        \ },
        \ 'templates/*.js': {
            \ 'type': 'js',
        \ },
        \ 'var/log/*.log': {
            \ 'type': 'log',
        \ },
    \ },
    \ 'app/config/config.yml&src/': {
        \ 'app/config/*|src/**/Ressources/config/*': {
            \ 'type': 'config',
        \ },
        \ 'src/**/Command/*Command.php': {
            \ 'type': 'command',
            \ 'skeleton': 'sfcommand',
        \ },
        \ 'src/**/Controller/*Controller.php': {
            \ 'type': 'controller',
            \ 'skeleton': 'sfcontroller',
        \ },
        \ 'src/**/DataFixtures/*Fixtures.php': {
            \ 'type': 'fixture',
            \ 'skeleton': 'sffixture',
            \ 'alternate': 'src/{dirname|basename}/Entity/{basename}.php',
        \ },
        \ 'src/**/Entity/*.php': {
            \ 'type': 'entity',
            \ 'skeleton': 'sfentity',
            \ 'alternate': [
                \ 'src/{dirname|basename}/Repository/{basename}Repository.php',
                \ 'src/{dirname|basename}/Controller/{basename}Controller.php',
                \ 'src/{dirname|basename}/Form/{basename}Type.php',
            \ ],
        \ },
        \ 'src/**/Repository/*Repository.php': {
            \ 'type': 'repository',
            \ 'alternate': 'src/{dirname|basename}/Entity/{basename}.php',
            \ 'skeleton': 'sfrepository',
        \ },
        \ 'src/**/Event/*Event.php': {
            \ 'type': 'event',
            \ 'skeleton': 'sfevent',
        \ },
        \ 'src/**/EventSubscriber/*Subscriber.php': {
            \ 'type': 'subscriber',
            \ 'skeleton': 'sfsubscriber',
        \ },
        \ 'src/**/Exception/*Exception.php': {
            \ 'type': 'exception',
        \ },
        \ 'src/**/Form/*Type.php': {
            \ 'type': 'form',
            \ 'alternate': 'src/{dirname|basename}/Entity/{basename}.php',
            \ 'skeleton': 'sfform',
        \ },
        \ 'src/*.html.twig': {
            \ 'type': 'template',
            \ 'skeleton': 'sftemplate',
        \ },
        \ 'config/services.yml': {
            \ 'type': 'services',
        \ },
        \ 'src/*.css|src/*.scss': {
            \ 'type': 'css',
        \ },
        \ 'src/*.js': {
            \ 'type': 'js',
        \ },
        \ 'var/log/*.log': {
            \ 'type': 'log',
        \ },
    \ },
\ }

nnoremap <silent> <Leader>a :A<CR>
nnoremap <silent> <Leader>va :AV<CR>

" vim: ts=2 sw=2 et fdm=marker
