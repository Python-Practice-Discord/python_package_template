# Getting started

You can work on this project using any OS, but macOS and Linux are easiest. To use Windows you will
need to be using WSL/WSL2 as many commands are not supported by the regular Windows CLI.

## Setting up Your Dev Env
This project uses Poetry to lock, install, and serve our python dependencies.

Run the following steps to get your local python env set up and enable pre-commit.

* `curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -`
* `poetry install`
* `poetry shell`
* `pre-commit install`

### Editors

This project provides a .editorconfig file that tells your editor how to treat some files. This
includes 4 spaces per tab in python files, no whitespace at the end of lines, and using lf as the
new line character.

Pycharm and VSCode are the officially supported editors, but almost any editor will work. Including
vim.

### Linters and formatters.

This project uses the [isort import sorter](https://pycqa.github.io/isort/)
, [Black code formatter](https://black.readthedocs.io/en/stable/),
and [Flake8 linter](https://flake8.pycqa.org/en/latest/) to ensure everyone's code follows the same
standards and best practices. The code standards are enforced on commit time via pre-commit, and
during pull requests via GitHub actions.

These tools can be run outside of commit by running `make check` in your terminal. NOTE: Running
this can change your files.

Black will automatically reformat your files, and isort will reorder your imports. This will never
break your code, just change how it looks.

Flake8 will check some python best practices and throw error messages if you have any.

### Static analysis

[Mypy](http://mypy-lang.org/) runs a some static analysis on python types to help avoid some common
errors. Mypy can be run using `make check` or on its own `mypy tests/ src/`.
