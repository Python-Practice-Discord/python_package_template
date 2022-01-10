# Git Workflow

This project uses [GitHub Flow](https://guides.github.com/introduction/flow/) and follows a couple
of simple principles:

* All code on the `main` branch is in production.
* All code going into `main` must go through a pull request.
* All pull requests must pass GitHub Action checks and have multiple reviewers.
* To deploy code into environments other than production git tags are used. IE: `STAGING`, `BETA`

Most of this workflow will be managed by the Team Lead, but it's helpful to be familiar with it
as much as you can. If you're feeling overwhelmed, just look at the parts on Commit Messages, Feature
and Bugfix Branches, and Merging. Feel free to ask any questions you have in Discord.

### Commit messages

Commit messages are very important. They tell other developers what you did without them having to
read all the changes you made. Commit messages should be in the form:

```text
#<GitHub issue number>: <Description of what you did>
```

IE:

```text
#15: Added endpoints for adding/removing users,
added constants to consts.py,
added user schema.
```

### Branches

#### Main

Code on the main branch is in production. All code merged into main must go through a PR.

#### Feature

Feature branches are the catch-all branches. If you are not fixing a bug or doing a hotfix then it
should be on a feature branch.

These branches must be deployed to STAGING and tested before being released.

Feature branches naming convention are as
follows: `feature/<github ticket_number>_<short_description>` IE: `feature/#15_example_ticket`

#### Bugfix

Bugfix branches are used when working a ticket labeled as a bug. Bugfixes differ from hotfixes in
hotfixes are an issue that is causing production to fail. Bugfixes can take longer and are not a
drop everything to resolve issue.

These branches must be deployed to STAGING and tested before being released.

Bugfix branches naming convention are as
follows: `bugfix/<github ticket_number>_<short_description>` IE: `bugfix/#2_example_bugfix_ticket`

#### Hotfix

Hotfix branches are ONLY used when there is a production issue that has to be resolved ASAP.

Hotfix branches are the only branches that can be deployed directly into production without being
deployed to a test environment first. All other branches must be deployed to the staging environment
prior to being merged to `main`

Feature branches naming convention are as
follows: `hotfix/<github ticket_number>_<short_description>` IE: `hotfix/#1_stop_everything_and_fix`

### Merging

All merging must be done via a pull request. All pull requests must pass the GitHub actions.