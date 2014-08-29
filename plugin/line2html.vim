"
" File: plugin/line2html.vim
" file created in 2014/08/23 09:27:58.
" LastUpdated:2014/08/29 11:43:42.
" Author: iNo <wdf7322@yahoo.co.jp>
" Version: 1.1
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
command! -range Line2table :<line1>,<line2>call line2html#makeHtml(<line1>, <line2>, 'table', 1)
command! -range Line2tr :<line1>,<line2>call line2html#makeHtml(<line1>, <line2>, 'table', 0)

" convert line to <ul>
command! -range Line2ul :<line1>,<line2>call line2html#makeHtml(<line1>, <line2>, 'ul', 1)

" convert line to <ol>
command! -range Line2ol :<line1>,<line2>call line2html#makeHtml(<line1>, <line2>, 'ol', 1)

" convert line to <li>
command! -range Line2li :<line1>,<line2>call line2html#makeHtml(<line1>, <line2>, 'ul', 0)

" convert line to <dl>
command! -range Line2dl :<line1>,<line2>call line2html#makeHtml(<line1>, <line2>, 'dl', 1)
command! -range Line2dt :<line1>,<line2>call line2html#makeHtml(<line1>, <line2>, 'dl', 0)
command! -range Line2dd :<line1>,<line2>call line2html#makeHtml(<line1>, <line2>, 'dl', 0)


let &cpo = s:save_cpo
unlet s:save_cpo

" vim:fdl=0 fdm=marker:ts=2 sw=2 sts=0:
