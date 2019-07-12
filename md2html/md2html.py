#!/usr/bin/env python
# -*- coding: utf-8 -*-
# 使用方法 python md2html.py filename

import sys
import markdown
import codecs


css = '''
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="https://guides.github.com/components/gridism/gridism.css">
<link href="markdown.css" rel="stylesheet">
<link rel="stylesheet" href="https://guides.github.com/components/primer/octicons.css">
<link href="https://guides.github.com/stylesheets/main.css" rel="stylesheet">
<link href="https://guides.github.com/stylesheets/pygments.css" rel="stylesheet">
'''

def main(argv):
    name = argv[0]
    in_file = '%s.md' % (name)
    out_file = '%s.html' % (name)

    input_file = codecs.open(in_file, mode="r", encoding="utf-8")
    text = input_file.read()
    ext = [ 'markdown.extensions.toc',\
            'markdown.extensions.sane_lists',\
            'markdown.extensions.codehilite',\
            'markdown.extensions.abbr',\
            'markdown.extensions.attr_list',\
            'markdown.extensions.def_list',\
            'markdown.extensions.fenced_code',\
            'markdown.extensions.footnotes',\
            'markdown.extensions.smart_strong',\
            'markdown.extensions.meta',\
            'markdown.extensions.nl2br',\
            'markdown.extensions.tables']

    html = markdown.markdown(text, output_format='html5', extensions=ext)

    output_file = codecs.open(out_file, "w",encoding="utf-8",errors="xmlcharrefreplace")
    output_file.write(css+html)

if __name__ == "__main__":
   main(sys.argv[1:])