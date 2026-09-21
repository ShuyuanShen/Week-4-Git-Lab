#!/usr/bin/env bash
# POLS 4130 | Week 4 | September 22 and 24, 2026
# Optional terminal companion to Week4_Git_Workshop.md.
# All commands are commented: running or sourcing this file does nothing.
# Copy a command without its leading '# ' into Terminal or Git Bash.
# Do not paste Git commands into the R Console.
# Use Desktop OR these commands for a step, not both.
# Sections and G-practice numbers match the main guide, which contains solutions.
# READ BEFORE EACH BLOCK: check the current directory, branch, and status.
# Run one command at a time and inspect its result. Stop if a command fails.
# Git 2.28+ supports the init -b syntax below; Git 2.23+ supports switch.

# 0. Setup: verify terminal Git ----
# git --version
# pwd
# If git is unavailable, use GitHub Desktop or install command-line Git.
# Commit identity belongs to metadata, not authentication.
# Once inside the new repository, configure your actual display name and
# chosen email if needed. Replace the examples; do not use these identities:
# git config user.name "Your Name"
# git config user.email "Your GitHub no-reply email"
# These commands set identity only for the current repository.

# 1. Fresh repository: alternative to Desktop setup ----
# Start in an ordinary local parent folder outside any existing repository.
# If css-practice already exists, use that project's guide instead of these.
# mkdir css-practice
# cd css-practice
# git init -b main
# Configure identity as explained in section 0 before the first commit.
# COPY all five starter-project files here, including hidden .gitignore.
# git status --short
# git add README.md research-question.md practice-notes.md conflict-practice.txt .gitignore
# git diff --cached
# git commit -m "Add fictional transit starter"
# CHECK: git status --short prints no file entries.
# G01: write the history explanation in practice-notes.md, then:
# git add practice-notes.md
# git diff --cached
# git commit -m "Explain repository history"

# 2. Save and inspect the question edit ----
# In your editor, replace the broad question with:
# What bus reliability concerns appear in fictional transit comments?
# git status --short
# git diff -- research-question.md
# CHECK: one removed question and one added question.
# G02: independently write another question in practice-notes.md.
# Save in the editor before inspecting the diff.
# Plain git diff does not normally show untracked file contents.

# 3. Stage and commit one coherent change ----
# git diff -- research-question.md
# git add research-question.md
# git diff --cached
# git commit -m "Narrow transit question"
# CHECK: the staged diff contains only the intended question edit.
# If practice-notes.md is also changed, commit it separately:
# git add practice-notes.md
# git diff --cached
# git commit -m "Practice a specific research question"
# G03: add a descriptive-purpose note in research-question.md, then inspect,
# stage just that file, inspect the staged diff, and commit with your message.
# Staging records the current file content. Later edits need another git add
# if you want those edits included in this commit.

# 4. Inspect recorded history ----
# git status --short
# git log --oneline -5
# git show --stat HEAD
# CHECK: status prints no file entries when the work is clean.
# Log identifiers and timestamps differ between students.
# G04: use git show with an identifier you actually found in git log.
# A commit records history; it does not run the code to test it.

# 5. README and ignored files ----
# Add the guide's proposed-analysis sentence to README.md in your editor.
# git diff -- README.md
# git add README.md
# git diff --cached
# git commit -m "Describe proposed analysis"
# G05: create scratch/notes.txt in your editor or file manager, then:
# git check-ignore -v scratch/notes.txt
# git status --short
# CHECK: the scratch/ rule appears; notes.txt is absent from normal status.
# Never ignore required source or data just to obtain a clean status.

# 6. Remote publication and later synchronization ----
# Use Desktop's Publish repository for the first private GitHub publication.
# Terminal commands below assume origin and upstream tracking already exist.
# Authenticate through Desktop or your Git credential manager; never paste
# passwords or tokens into this file, a commit, or the repository URL.
# git remote -v
# git branch -vv
# git push
# CHECK: inspect GitHub's correct repository and branch after pushing.
# G06: make and commit the README limitation first, compare local/remote,
# then push. With no remote/authentication, stop at the local check.

# 7. Combined application ----
# G07: create question-extension.md in your editor with the required question.
# git add question-extension.md
# git diff --cached
# git commit -m "Add another proposed research question"
# Add a limitation in the editor, then stage, inspect, and commit separately.
# Push only when the intended remote has been set up in section 6.

# 8. Start Thursday from a clean main ----
# git status --short
# Proceed only when no unfinished changes remain.
# git switch main
# git fetch origin
# git pull --ff-only
# CHECK: the current branch is main and the latest remote content is present.
# --ff-only stops if the branches diverged. Ask for help and inspect history
# rather than forcing an update. Offline: omit fetch/pull and check local main.
# To clone instead, copy the URL from your own GitHub repository's Code menu.
# Run git clone with that URL and a new destination outside existing repos.
# Do not clone again when you already have the local repository you need.

# 9. A branch for the proposed method ----
# git switch -c clarify-method
# If that name exists, inspect it instead of deleting or overwriting it.
# EDIT research-question.md: add the Proposed method text in guide section 9.
# git diff -- research-question.md
# git add research-question.md
# git diff --cached
# git commit -m "Explain proposed coding method"
# git diff main...clarify-method
# CHECK: the diff shows the added method relative to the shared starting point.
# G09: add the coder-disagreement limitation, inspect, and commit separately.

# 10. Publish branch and review ----
# git push -u origin clarify-method
# Create the PR in Desktop/GitHub. Verify base main, compare clarify-method.
# Git itself has no built-in command for creating a GitHub PR.
# G10: after feedback, edit and commit on clarify-method, then:
# git push
# CHECK: the existing PR includes the follow-up commit.
# Offline review:
# git diff main...clarify-method

# 11. After merging the PR in the browser ----
# Confirm a clean working tree before switching:
# git status --short
# git switch main
# git fetch origin
# git pull --ff-only
# CHECK: local main includes the accepted method.
# Offline alternative ONLY, when you did not merge the PR online:
# git switch main
# git merge clarify-method
# Inspect the accepted file. This is a local merge, not a GitHub PR review.

# 12. Simulated conflict ----
# EDIT conflict-practice.txt using guide G12. Remove its marker block and
# retain the fictional simulation disclosure and one intended paragraph.
# git diff -- conflict-practice.txt
# git add conflict-practice.txt
# git diff --cached
# git commit -m "Resolve simulated scope disagreement"
# git diff --name-only --diff-filter=U
# CHECK: no unresolved paths. This simulation never created a real conflict.

# 13. A reversible isolated mistake ----
# Begin with clean main. Create recovery-demo.txt in your editor with:
# This is a temporary practice file.
# git add recovery-demo.txt
# git diff --cached
# git commit -m "Add recovery demonstration"
# git log --oneline -1
# ONLY if that latest commit is exactly this single-file demonstration:
# git revert --no-edit HEAD
# git log --oneline -2
# git status --short
# CHECK: original addition and reversing commit remain; the file disappears.

# 14. Issue and handoff ----
# G14 happens in GitHub or practice-notes.md. Check README changes normally.
# The issue needs a problem and a checkable completion condition.
# git status --short
# git log --oneline -5

# 15. OPTIONAL: actual conflict in a NEW disposable repository ----
# First navigate with your terminal to a local parent folder OUTSIDE all repos.
# Do not paste this entire block. Run each line and inspect its result.
# If mkdir reports that the folder exists, STOP and choose a new folder name.
# mkdir css-conflict-demo
# cd css-conflict-demo
# git init -b main
# Configure your real identity for this repository as described in section 0.
# printf '%s\n' 'We study transit concerns.' > scope.txt
# git add scope.txt
# git commit -m "Add starting scope"
# git switch -c accessibility
# printf '%s\n' 'We study bus accessibility concerns.' > scope.txt
# git add scope.txt
# git commit -m "Focus on accessibility"
# git switch main
# printf '%s\n' 'We study bus reliability concerns.' > scope.txt
# git add scope.txt
# git commit -m "Focus on reliability"
# git merge accessibility
# EXPECTED STOP: Git reports a content conflict. Do not rerun the merge.
# git status --short
# git diff --name-only --diff-filter=U
# CHECK: UU scope.txt and the unresolved path scope.txt.
# OPEN scope.txt and read both sides. Choose the intended scope.
# Replace the marker block with this illustrative resolution:
# We compare bus reliability and accessibility concerns.
# Save the file. Then:
# git add scope.txt
# git commit -m "Resolve scope by comparing concerns"
# git status --short
# git diff --name-only --diff-filter=U
# git log --oneline --graph --all
# CHECK: no unresolved paths or unfinished changes; both histories appear.
# No network or remote is needed. Leave this separate demo folder separate.

# 16. Suggested solutions ----
# See the expandable solutions in Week4_Git_Workshop.md.
# Validate the meaning as well as Git's state. Alternative wording is welcome.
# Sources: https://git-scm.com/docs and GitHub Docs links in the main guide.
