" First save and then runs the current script
nmap ,p :w<CR>:!python3 %<CR>

" Run the program inside of the virtualenv
nmap ,v :w<CR>:!venv/bin/python %<CR>

" Flake8 check
autocmd FileType python map <buffer> ,f :call Flake8()<CR>


nmap cp :ConqueTermVSplit python3<CR>

