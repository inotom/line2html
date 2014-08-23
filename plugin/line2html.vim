"
" File: plugin/line2html.vim
" file created in 2014/08/23 09:27:58.
" LastUpdated:2014/08/24 07:10:45.
" Author: iNo <wdf7322@yahoo.co.jp>
" Version: 1.0
" License: MIT License {{{
"   Permission is hereby granted, free of charge, to any person obtaining
"   a copy of this software and associated documentation files (the
"   "Software"), to deal in the Software without restriction, including
"   without limitation the rights to use, copy, modify, merge, publish,
"   distribute, sublicense, and/or sell copies of the Software, and to
"   permit persons to whom the Software is furnished to do so, subject to
"   the following conditions:
"
"   The above copyright notice and this permission notice shall be included
"   in all copies or substantial portions of the Software.
"
"   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"   OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"   IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"   CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"   TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"   SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}
"

if exists('g:loaded_line2html')
  finish
endif
let g:loaded_line2html = 1

let s:save_cpo = &cpo
set cpo&vim


" convert line to <table>
command! -range Line2table :<line1>,<line2>call line2html#makeHtml(<line1>, <line2>, 'table')

" convert line to <ul>
command! -range Line2ul :<line1>,<line2>call line2html#makeHtml(<line1>, <line2>, 'ul')

" convert line to <ol>
command! -range Line2ol :<line1>,<line2>call line2html#makeHtml(<line1>, <line2>, 'ol')

" convert line to <dl>
command! -range Line2dl :<line1>,<line2>call line2html#makeHtml(<line1>, <line2>, 'dl')


let &cpo = s:save_cpo
unlet s:save_cpo

" vim:fdl=0 fdm=marker:ts=2 sw=2 sts=0: