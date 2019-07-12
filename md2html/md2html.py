#!/usr/bin/env python
# -*- coding: utf-8 -*-
# 使用方法 python md2html.py filename
# pip install markdown

import sys
import markdown
import codecs


css = '''
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="markdown.css" rel="stylesheet">
</head>
<body>
<article class="markdown-body">
'''

def main(argv):
    name = argv[0]
    in_file = '%s.md' % (name)
    out_file = '%s.html' % (name)

    input_file = codecs.open(in_file, mode="r", encoding="utf-8")
    text = input_file.read()
    ext = ['markdown.extensions.toc',
           'markdown.extensions.codehilite',
           'markdown.extensions.sane_lists',
           'markdown.extensions.abbr',
           'markdown.extensions.attr_list',
           'markdown.extensions.def_list',
           'markdown.extensions.fenced_code',
           'markdown.extensions.footnotes',
           'markdown.extensions.meta',
           'markdown.extensions.nl2br',
           'markdown.extensions.tables']

    html = markdown.markdown(text, output_format='html5', extensions=ext)

    output_file = codecs.open(out_file, "w",encoding="utf-8",errors="xmlcharrefreplace")
    output_file.write(css+html+"</article></body>")

if __name__ == "__main__":
    main(sys.argv[1:])