line2html
==============

Vim script to convert html table and list tag from line.

Usage
==============

```
:line2table
```
To create a &lt;table&gt; tag enclosed in &lt;tr&gt; tag from selected line.

It can be divided in the &lt;tr&gt; tag by interject a blank line.

```
:line2ul
```
To create a &lt;ul&gt; tag enclosed in &lt;li&gt; tag from selected line.

```
:line2ol
```
To create a &lt;ol&gt; tag enclosed in &lt;li&gt; tag from selected line.

```
:line2dl
```
To create a &lt;dl&gt; tag enclosed in &lt;dt&gt; and &lt;dd&gt; tag from selected line.

Install
==============

Put this file into $HOME/.vim/plugin directory. Add these settings into .vimrc file.

Options
==============
```
g:line2html_enable_parent_tag
```
Insert tag with &lt;table&gt;, &lt;ul&gt;, &lt;ol&gt;, &lt;dl&gt; tag. 0: not insert, 1: insert (default)
