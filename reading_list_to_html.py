from bs4 import BeautifulSoup
from pathlib import Path
from os import path
import re

soup = BeautifulSoup(features='html.parser')
body = soup.new_tag('body')
soup.insert(0, body)
home = Path.home()

def header_line(line):
    pipe_pos = line.find('|')
    tline = line[:pipe_pos].strip()
    stline = tline.split(' ')

    header_tag = soup.new_tag(f'h{len(stline[0])}')
    header_tag.string = ' '.join(x.title() for x in stline[1:])

    return header_tag

def clean_taskwiki(line):
    return ' - ' + line[6:-10].strip()

if __name__ == '__main__':
    with open(path.join(home, 'vimwiki', 'reading-list.wiki')) as infile:
        for i, line in enumerate(infile):
            url_re = re.search("(?P<url>https?://[^\s]+)", line)

            if line.startswith('#'):
                body.insert(2*i, header_line(line))
                # body.insert(2*i + 1, soup.new_tag('br'))
            elif url_re:
                url_text = url_re.group("url")
                intro_text = ' - ' + line[6:url_re.start()]

                row_tag = soup.new_tag('span')

                intro_tag = soup.new_tag('span')
                intro_tag.string = intro_text

                link = soup.new_tag('a', href=url_text)
                link.string = url_text

                row_tag.insert(0, intro_tag)
                row_tag.insert(1, link)

                body.insert(2*i, row_tag)
                body.insert(2*i + 1, soup.new_tag('br'))
            else:
                p = soup.new_tag('span')
                p.string = clean_taskwiki(line)
                body.insert(2*i, p)
                body.insert(2*i + 1, soup.new_tag('br'))

    with open(path.join(home, 'vimwiki', 'reading_list.html'), 'w') as outfile:
        outfile.write(soup.prettify())
