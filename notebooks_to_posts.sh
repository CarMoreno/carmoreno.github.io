# Taken from https://github.com/jeertmans/jeertmans.github.io/blob/main/notebooks_to_posts.sh
#!/bin/bash

#export PLOTLY_RENDERER=notebook

echo "Executing notebooks..." && \
    [ -d _notebooks ] && \
    [ "$(find _notebooks -type f -iname '*.ipynb')" ] && \
    python -m jupyter nbconvert _notebooks/*.ipynb \
        --ExecutePreprocessor.kernel_name=python \
        --execute \
        --to markdown \
        --output-dir assets/notebooks || \
    echo "No notebook found"

echo "Changing link to svg files" && \
    find assets/notebooks -type f -iname '*.md' | \
    xargs -n 1 sed -i -E "s/(!\[svg\])\((.*)\)/\1(\/assets\/notebooks\/\2)/"

echo "Changing link to html image files" && \
    find assets/notebooks -type f -iname '*.md' | \
    xargs -n 1 sed -i -E 's/src="\.\.\//src="\//'

echo "Changing relative path for posts generated from notebooks" && \
    find assets/notebooks -type f -iname '*.md' | \
    xargs -n 1 python -c "import sys,os;file=sys.argv[1];lines=open(file).readlines();index=lines.index('---\n');basename=os.path.basename(file);path=os.path.join('_notebooks', basename[:-2] + 'ipynb\n');lines.insert(index + 1, f'source: {path}');open(file, 'w').writelines(lines);"

echo "Moving new posts to _posts directory" && \
    mv assets/notebooks/*.md _posts/