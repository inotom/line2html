"
" File: autoload/line2html/dl.vim
" file created in 2014/08/24 07:16:38.
" LastUpdated:2014/08/29 10:03:04.
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

let s:save_cpo = &cpo
set cpo&vim


" dt または dd タグの識別用変数
let s:tagType = 0

function! s:getNewLine(l1, l2, currentLine)
  let newLine = ''

  if (a:l1 == a:currentLine && g:line2html_enable_parent_tag)
    let newLine .= "<dl>\n"
  endif

  let line = getline(a:currentLine)

  let dlTag = a:currentLine % 2 == s:tagType ? 'dt' : 'dd'

  if (line ==# '')
    " 空行の場合 s:tagType を入れ替える
    let s:tagType = s:tagType == 0 ? 1 : 0
  else
    let newLine .= "<" . dlTag . ">" . substitute(line, '\v\s+$', '', '') . "</" . dlTag . ">\n"
  endif

  if (a:l2 == a:currentLine && g:line2html_enable_parent_tag)
    let newLine .= "</dl>\n"
  endif

  return newLine
endfunction

function! line2html#dl#getHtml(l1, l2)
  let line = ''
  let i = a:l1
  let s:tagType = i % 2
  while i <= a:l2
    let line .= s:getNewLine(a:l1, a:l2, i)
    let i += 1
  endwhile
  return line
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo

" vim:fdl=0 fdm=marker:ts=2 sw=2 sts=0:
