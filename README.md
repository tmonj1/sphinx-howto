# sphinx-devcontainer

sphinx-devcontainer is a setup of Sphinx document creation environment using VSCode and Remote-Container extension.
Using this repo, you can quickly start writing technical document without downloading ,installing and configuring
lots of tools and libraries.

## 1. Requirements

1. Docker
1. VSCode
1. VSCode extension: Remote - Containers
1. VSCode extension: reStructuredText

## 2. How to Use

### (1) git clone

```bash
# git clone
$ git clone https://github.com/tmonj1/sphinx-devcontainer.git
$ cd sphinx-devcontainer
```

### (2) Open with VSCode

```bash
# open with VSCode
code .
```

#### (3) Click the Dev Container icon at the left bottom corner

<img src="./source/images/rc-icon.png" height=165 width=390 />


#### (4) Choose "Reopen with VSCode" on the Command Pallete

<img src="./source/images/cmdpallete.png" height=165 width=390 />

#### (5) Start writing your own contents

Now you can start writing your own contents. The first thing you should do is edit conf.py for project settings.

```bash
# edit conf.py
$ vi source/conf.py
:
project = 'your project name'
copyright = 'your copyright'
author = 'you'
version = '0.1'  # initial version
release = '0.1-alpha'  # full version
:
```
Then, try the first build:

```bash
$ make html
```

It is also possible to use autobuild:

```bash
$ make livehtml
```

## 3. Folder Structure

```
$ tree .
.
├── Dockerfile
├── docker-compose.yml
├── make.bat
├── Makefile
├── README.md
├── build                  # build output
└── source                 # source code
    ├── _static
    ├── _templates
    ├── definition.txt
    ├── conf.py
    └── index.rst
```

## 4. Preinstall sphinx extensions

Sphinx extensions are listed in Dockerfile.

* sphinx-rtd-theme
* sphinx-intl
* sphinx_fontawesome
* sphinx-autobuild
* sphinxcontrib-trimblank
* sphinxcontrib-blockdiag
* hinxcontrib-seqdiag
* sphinxcontrib-actdiag
* sphinxcontrib-nwdiag
