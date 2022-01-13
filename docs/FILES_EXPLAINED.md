# What are all these files?
After making our project templates, the biggest complaint we got is that there were a lot of files,
and it was overwhelming, especially to newer developers who aren't familiar with the structure of
large projects. This file is a lot of text, but it's laid out in a more human-readable form
than typical documentation, so you should be able to read through it relatively easily and understand
more of how the repo is laid out. You can also jump between headers if you're looking for more information
about specific files.

As always, if you have ANY questions, ask away in the discord server, and someone will answer them.
The architects of the templates are in there, so even if something isn't well documented, someone will
know the answer.

This explanation is laid out in the order that files appear in my instance of VSCode, so if the order is
weird, that's what.

## `.github/` Directory
The `.github` directory holds system files that tell GitHub how to do specific things, mainly automated
"actions" workflows which check that code meets our quality standards, and issue templates. For the most
part, you can ignore this directory, as only the Team Lead or the template team should ever need to touch it.

## `docs/` Directory
This holds documentation about the project, it's usage, and devloping it. The [Documents Index](INDEX.md)
has links and brief explanations of each document, so it's the easiest way to navigate this directory.

## `src/` Directory
This is what you're probably most familiar with in a python project, and it's where your attention should be
most of the time when developing. Inside of /src/, there is a subdirectory with the same name as the project,
and that is where all of the python source code lives. You can safely ignore just about everything outside of
this directory, as it's all there to manage things for you.

## `tests/` Directory
`/tests/` holds python test files, written with pytest. These tests can be run manually by running
`poetry run pytest`, and they are run automatically before you commit by pre-commit git hooks,
and when you create a pull request by github actions. All tests must pass before you can commit changes
and before a pull request will be accepted.

We ask that you write unit tests for your code, which ensures it works as intended and won't break other people's code.
If you already know how to do this, Great! We don't expect you to, so we have included some beginner-friendly documentation
on how to write tests. If you have any questions about tests, ask in discord or contact the Team Lead.

## `.editorconfig` File
`.editorconfig` tells your editor how to treat some files. This
includes 4 spaces per tab in python files, no whitespace at the end of lines, and using lf as the
new line character. This keeps configuration consistant between devs, and prevents technical issues when merging.
For more information, see the Editors section of the [Dev Environment](DEV_ENVIRONMENT.md) docs. You should never
have to do anything with this file.

## `.gitignore` File
`.gitignore` is one of the staples of git, which tells it what types of files not to track and sync with others.
You may need to edit this, but for the most part, any changes to it should be cleared with the team lead first.

## `.pre-commit-config.yaml` File
Pre-Commit is a tool that installs git hooks which automatically run some checks before you're able to commit your
changes. This file tells pre-commit what checks to run before you commit. These checks are explained in the Linters
and Formatters, and Static Analysis sections of the [Dev Environment](DEV_ENVIORNMENT.md) docs, but basically, they 
ensure your code looks the same as everyone else's, and it will run. You should never have to do anything with this file.

## `LICENSE` File
The license that te software is distributed under. We use an MIT license. Nobody should ever edit this file, but you're
free to read it if you want.

## `poetry.lock` File
`poetry.lock` is an auto-generated file that ensures the dependencies on everyone's system are the same version. Poetry
will modify it automatically when you update or add dependencies, so you will need to commit changes to it ocasionally.

## `pyproject.toml` File
This stores all of the project's dependencies, and configuration for tools such as poetry (dependency and virtual environment management),
isort (import sorting), Black (code formatting), and pytest (unit testing). You should never have to manually do anything with this file,
but poetry will modify it when you add dependencies using `poetry add package_name`, so you will need to commit changes to it.

## `setup.cfg` File
`setup.cfg` stores configuration for Flake8, which is used to lint your code to ensure it will run. You should never have to do
anything with this file.
