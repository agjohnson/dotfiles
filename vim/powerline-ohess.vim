call Pl#Hi#Allocate({
	\ 'black': 0,
	\ 'white': 15,
	\ 'green': 1,
	\ 'cyan': 2,
	\ 'blue': 3,
	\ 'red': 4,
	\ 'purple': 5,
	\ 'orange': 6,
	\ 'gray1': 0,
	\ 'gray2': 0,
	\ })

let g:Powerline#Colorschemes#ohess#colorscheme = Pl#Colorscheme#Init([
	\ Pl#Hi#Segments(['SPLIT'], {
		\ 'n': ['white', 'gray1'],
		\ 'N': ['white', 'gray1'],
		\ 'i': ['white', 'gray1'],
		\ }),
	\
	\ Pl#Hi#Segments(['mode_indicator'], {
		\ 'n': ['black', 'green'],
		\ 'i': ['orange', 'red', ['bold']],
		\ 'v': ['black', 'orange'],
		\ 'r': ['white', 'red'],
		\ 's': ['white', 'purple'],
		\ }),
	\
	\ Pl#Hi#Segments(['branch', 'scrollpercent', 'raw', 'filesize'], {
		\ 'n': ['red', 'cyan'],
		\ 'N': ['red', 'cyan'],
		\ 'i': ['red', 'cyan'],
		\ }),
	\
	\ Pl#Hi#Segments(['fileinfo', 'filename'], {
		\ 'n': ['white', 'gray1', ['bold']],
		\ 'N': ['white', 'gray1', ['bold']],
		\ 'i': ['red', 'cyan', ['bold']],
		\ }),
	\
	\ Pl#Hi#Segments(['fileinfo.filepath'], {
		\ 'n': ['black'],
		\ 'N': ['black'],
		\ 'i': ['orange', ['bold']],
		\ }),
	\
	\ Pl#Hi#Segments(['static_str'], {
		\ 'n': ['white', 'gray1'],
		\ 'N': ['gray1', 'gray1'],
		\ 'i': ['orange', 'cyan'],
		\ }),
	\
	\ Pl#Hi#Segments(['fileinfo.flags'], {
		\ 'n': ['red', ['bold']],
		\ 'N': ['red'],
		\ 'i': ['red', ['bold']],
		\ }),
	\
	\ Pl#Hi#Segments(['currenttag', 'fullcurrenttag', 'fileformat', 'fileencoding', 'pwd', 'filetype', 'rvm:string', 'rvm:statusline', 'virtualenv:statusline', 'charcode', 'currhigroup'], {
		\ 'n': ['gray2', 'gray1', ['bold']],
		\ 'i': ['orange', 'cyan', ['bold']],
		\ }),
	\
	\ Pl#Hi#Segments(['lineinfo'], {
		\ 'n': ['white', 'gray1', ['bold']],
		\ 'N': ['white', 'gray1', ['bold']],
		\ 'i': ['red', 'cyan', ['bold']],
		\ }),
	\
	\ Pl#Hi#Segments(['errors'], {
		\ 'n': ['orange', 'gray1', ['bold']],
		\ 'i': ['orange', 'blue', ['bold']],
		\ }),
	\
	\ Pl#Hi#Segments(['lineinfo.line.tot'], {
		\ 'n': ['white'],
		\ 'N': ['white'],
		\ 'i': ['orange'],
		\ }),
	\
	\ Pl#Hi#Segments(['paste_indicator', 'ws_marker'], {
		\ 'n': ['white', 'red', ['bold']],
		\ }),
	\
	\ Pl#Hi#Segments(['gundo:static_str.name', 'command_t:static_str.name'], {
		\ 'n': ['white', 'red', ['bold']],
		\ 'N': ['red', 'red', ['bold']],
		\ }),
	\
	\ Pl#Hi#Segments(['gundo:static_str.buffer', 'command_t:raw.line'], {
		\ 'n': ['white', 'red'],
		\ 'N': ['red', 'red'],
		\ }),
	\
	\ Pl#Hi#Segments(['gundo:SPLIT', 'command_t:SPLIT'], {
		\ 'n': ['white', 'red'],
		\ 'N': ['white', 'red'],
		\ }),
	\
	\ Pl#Hi#Segments(['lustyexplorer:static_str.name', 'minibufexplorer:static_str.name', 'nerdtree:raw.name', 'tagbar:static_str.name'], {
		\ 'n': ['white', 'green', ['bold']],
		\ 'N': ['green', 'green', ['bold']],
		\ }),
	\
	\ Pl#Hi#Segments(['lustyexplorer:static_str.buffer', 'tagbar:static_str.buffer'], {
		\ 'n': ['green', 'green'],
		\ 'N': ['green', 'green'],
		\ }),
	\
	\ Pl#Hi#Segments(['lustyexplorer:SPLIT', 'minibufexplorer:SPLIT', 'nerdtree:SPLIT', 'tagbar:SPLIT'], {
		\ 'n': ['white', 'green'],
		\ 'N': ['white', 'green'],
		\ }),
	\
	\ Pl#Hi#Segments(['ctrlp:focus', 'ctrlp:byfname'], {
		\ 'n': ['purple', 'purple'],
		\ }),
	\
	\ Pl#Hi#Segments(['ctrlp:prev', 'ctrlp:next', 'ctrlp:pwd'], {
		\ 'n': ['white', 'purple'],
		\ }),
	\
	\ Pl#Hi#Segments(['ctrlp:item'], {
		\ 'n': ['purple', 'white', ['bold']],
		\ }),
	\
	\ Pl#Hi#Segments(['ctrlp:marked'], {
		\ 'n': ['red', 'purple', ['bold']],
		\ }),
	\
	\ Pl#Hi#Segments(['ctrlp:count'], {
		\ 'n': ['purple', 'white'],
		\ }),
	\
	\ Pl#Hi#Segments(['ctrlp:SPLIT'], {
		\ 'n': ['white', 'purple'],
		\ }),
	\ ])
