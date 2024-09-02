let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 init.lua
argglobal
%argdel
$argadd init.lua
edit init.lua
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
2,4fold
19,22fold
28,34fold
26,36fold
43,46fold
52,59fold
51,59fold
50,59fold
49,61fold
48,61fold
66,68fold
65,71fold
64,71fold
72,75fold
64,75fold
63,75fold
62,75fold
84,87fold
83,88fold
82,89fold
81,89fold
80,89fold
79,89fold
77,89fold
90,92fold
94,96fold
101,103fold
99,103fold
106,110fold
111,113fold
105,113fold
99,113fold
116,118fold
116,120fold
114,120fold
121,123fold
127,129fold
127,130fold
125,131fold
135,138fold
134,139fold
132,141fold
121,141fold
144,146fold
144,148fold
121,148fold
149,151fold
149,152fold
160,162fold
157,163fold
154,163fold
164,166fold
168,170fold
167,172fold
167,174fold
175,178fold
181,183fold
180,184fold
175,185fold
186,188fold
191,195fold
198,200fold
189,201fold
203,205fold
186,206fold
175,207fold
208,210fold
208,212fold
213,215fold
223,225fold
222,226fold
220,226fold
219,227fold
238,241fold
231,243fold
230,243fold
229,243fold
219,243fold
219,243fold
218,249fold
217,249fold
216,249fold
213,249fold
252,255fold
251,255fold
250,255fold
213,255fold
261,263fold
264,266fold
260,267fold
258,268fold
275,277fold
274,278fold
272,279fold
271,280fold
284,287fold
297,299fold
296,300fold
283,301fold
304,308fold
let &fdl = &fdl
2
normal! zo
19
normal! zo
26
normal! zo
28
normal! zo
43
normal! zo
48
normal! zo
49
normal! zo
50
normal! zo
51
normal! zo
52
normal! zo
62
normal! zo
63
normal! zo
64
normal! zo
64
normal! zo
65
normal! zo
66
normal! zo
72
normal! zo
77
normal! zo
79
normal! zo
80
normal! zo
81
normal! zo
82
normal! zo
83
normal! zo
84
normal! zo
90
normal! zo
94
normal! zo
99
normal! zo
99
normal! zo
101
normal! zo
105
normal! zo
106
normal! zo
111
normal! zo
114
normal! zo
116
normal! zo
116
normal! zo
121
normal! zo
121
normal! zo
121
normal! zo
125
normal! zo
127
normal! zo
127
normal! zo
132
normal! zo
134
normal! zo
135
normal! zo
144
normal! zo
144
normal! zo
149
normal! zo
149
normal! zo
154
normal! zo
157
normal! zo
160
normal! zo
164
normal! zo
167
normal! zo
167
normal! zo
168
normal! zo
175
normal! zo
175
normal! zo
175
normal! zo
180
normal! zo
181
normal! zo
186
normal! zo
186
normal! zo
189
normal! zo
191
normal! zo
198
normal! zo
203
normal! zo
208
normal! zo
208
normal! zo
213
normal! zo
213
normal! zo
213
normal! zo
216
normal! zo
217
normal! zo
218
normal! zo
219
normal! zo
219
normal! zo
219
normal! zo
220
normal! zo
222
normal! zo
223
normal! zo
229
normal! zo
230
normal! zo
231
normal! zo
238
normal! zo
250
normal! zo
251
normal! zo
252
normal! zo
258
normal! zo
260
normal! zo
261
normal! zo
264
normal! zo
271
normal! zo
272
normal! zo
274
normal! zo
275
normal! zo
283
normal! zo
284
normal! zo
296
normal! zo
297
normal! zo
304
normal! zo
let s:l = 4 - ((3 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4
normal! 04|
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
