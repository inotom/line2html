"
" File: autoload/line2html.vim
" file created in 2014/08/24 06:39:21.
" LastUpdated:2014/08/29 13:21:06.
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

let s:save_cpo = &cpo
set cpo&vim


" l1 から l2 までの行を削除する
function! line2html#deleteLines(l1, l2)
  call setline(a:l1, '')
  silent execute (a:l1 + 1) . "," . a:l2 . "delete"
endfunction

function! line2html#makeHtml(l1, l2, type, hasGroup) range
  let htmlStr = ''

  if a:type ==# 'table'
    let htmlStr = line2html#table#getHtml(a:l1, a:l2, a:hasGroup)
  elseif a:type ==# 'ul' || a:type ==# 'ol'
    let htmlStr = line2html#li#getHtml(a:l1, a:l2, a:type, a:hasGroup)
  elseif a:type ==# 'dl'
    let htmlStr = line2html#dl#getHtml(a:l1, a:l2, a:hasGroup)
  endif

  " データ行を削除する
  call line2html#deleteLines(a:l1, a:l2)

  " 改行コード \n を正常に出力するために split を使用してリストを渡す
  let newLines = split(htmlStr, "\n")
  call append(a:l1, newLines)

  " 挿入したタグの範囲をインデントする
  silent! execute(":normal " . a:l1 . "gg=" . (a:l1 + len(newLines)) . "gg")
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo

" vim:fdl=0 fdm=marker:ts=2 sw=2 sts=0:
