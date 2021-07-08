FROM sphinxdoc/sphinx:4.0.2

#
# Debian packages
#

# Components required for building PDF documents
RUN apt-get update && \
    apt-get install -y latexmk && \
    apt-get install -y texlive-lang-cjk && \
    apt-get install -y texlive-formats-extra

#
# Python packages
#

# code formatter
RUN pip install autopep8

#
# Sphinx extensions
#

# Read the Docs theme (https://sphinx-rtd-theme.readthedocs.io/en/stable/)
RUN pip install sphinx-rtd-theme

# i18n support
RUN pip install sphinx-intl

# fontawesome
RUN pip install sphinx_fontawesome

# autobuild
RUN pip install sphinx-autobuild

# trim redandunt space in Japanese text.
RUN pip install sphinxcontrib-trimblank

# blockdiag extensions
RUN pip install sphinxcontrib-blockdiag \
    sphinxcontrib-seqdiag \
    sphinxcontrib-actdiag \
    sphinxcontrib-nwdiag \
    reportlab

# rstcheck (linter)
RUN pip install rstcheck

# panels and source copy button
RUN pip install sphinx-panels sphinx-copybutton

# tseg search for better Japanese search
#   and a patch for tseg search for python 4 (https://github.com/whosaysni/sphinx-tsegsearch/pull/3)
RUN pip install sphinx-tsegsearch==1.0 \
    && cd /usr/local/lib/python3.9/site-packages/sphinx_tsegsearch/ \
    && mv __init__.py __init__.py.org \
    && cat __init__.py.org | sed -e 's/add_javascript/add_js_file/' > __init__.py \
    && rm __init__.py.org
