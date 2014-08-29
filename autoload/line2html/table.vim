"
" File: autoload/line2html/table.vim
" file created in 2014/08/24 06:52:07.
" LastUpdated:2014/08/29 10:02:59.
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


function! s:getNewLine(l1, l2, currentLine)
  let newLine = ''

  let parent_start_tag = g:line2html_enable_parent_tag ? "<table>\n<tbody>\n" : ""
  let parent_ent_tag = g:line2html_enable_parent_tag ? "</tbody>\n</table>\n" : ""

  if (a:l1 == a:currentLine)
    let newLine .= parent_start_tag . "<tr>\n"
  endif

  let line = getline(a:currentLine)
  if (line ==# '')
    let newLine .= "</tr>\n<tr>\n"
  else
    let newLine .= "<td>" . substitute(line, '\v\s+$', '', '') . "</td>\n"
  endif

  if (a:l2 == a:currentLine)
    let newLine .= "</tr>\n" . parent_ent_tag
  endif

  return newLine
endfunction

function! line2html#table#getHtml(l1, l2)
  let line = ''
  let i = a:l1
  while i <= a:l2
    let line .= s:getNewLine(a:l1, a:l2, i)
    let i += 1
  endwhile
  return line
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo

" vim:fdl=0 fdm=marker:ts=2 sw=2 sts=0:
