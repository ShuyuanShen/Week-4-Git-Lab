# Week 4 workshop: RStudio with Git and GitHub

Use this guide for setup and troubleshooting. Once connected, open **Week4_RStudio_Git_Lab.R** and stay in its numbered sections for demonstrations and practice. Tuesday uses sections 0–7. Thursday uses sections 8–14. Section 15 contains commented solutions. Version-control practice uses RStudio buttons and GitHub in a browser.

## 0. Before class

| Piece | Purpose | Check |
|---|---|---|
| RStudio Project | Opens the project folder and its R context | Project name appears at top right |
| Git | Records local file history | RStudio finds a Git executable |
| GitHub repository | Holds a connected online copy | You can open your own repository |
| Identity and authentication | Name commits and authorize online access | A test commit and Push succeed |

Git and RStudio are separate installations. Use the [Git installation page](https://git-scm.com/downloads) for your operating system. Windows offers an installer. On macOS, an instructor or campus support can help install Git if it is absent. Finish this before the lab.

In RStudio, open **Tools > Global Options > Git/SVN** (some macOS versions expose preferences through the RStudio menu). Enable the version-control interface and confirm RStudio finds Git. Restart after installation if needed. The Git tab appears in a project that uses Git; an ordinary `.Rproj` alone is insufficient.

Have `readr`, `dplyr`, and `ggplot2` installed using **Packages > Install**. These are familiar packages from earlier labs.

### One-time commit identity

Git attaches a name and email to commits. This is separate from GitHub sign-in. If not configured, install `usethis` through **Packages > Install**. With instructor help, run this R expression once in the **R Console**, replacing both examples with your details:

```r
usethis::use_git_config(
  user.name = "Your Name",
  user.email = "your GitHub-associated email"
)
```

Use the no-reply email shown in your GitHub email settings if preferred. This sets your Git identity for your computer’s projects. The teaching script does not change it automatically. This is setup in R, not a terminal workflow.

### One-time GitHub authentication

Create the repository in section 1 first. If a credential manager opens browser sign-in during Clone or Push, complete that sign-in. An ordinary GitHub account password does not authenticate HTTPS Git operations.

If RStudio instead asks for credentials and no working credential manager is available, the instructor can help with a personal access token:

1. On GitHub, open **Settings > Developer settings > Personal access tokens > Fine-grained tokens > Generate new token**.
2. Choose an expiration, your account as resource owner, and **Only select repositories**, selecting `css-rstudio-practice`.
3. Give that repository **Contents: Read and write** access. This exercise edits ordinary files and does not need workflow permissions.
4. Install `gitcreds` through **Packages > Install**. In the R Console, run `gitcreds::gitcreds_set()` and enter the token only at its interactive credential prompt. Keep it out of scripts, README files, screenshots, and notes. If credentials already exist, read the prompt deliberately rather than replacing another account accidentally.
5. Retry the operation. If it fails, check the account, repository access, token expiration, and any approval requirement.

After this one-time setup, use the Git pane for Commit, Pull, and Push. Retain any existing working institutional sign-in method.

### Concepts behind the buttons

Version control records file changes so we can compare and recover recorded versions. Pro Git’s snapshot diagram shows the state recorded at each commit. Unchanged files reuse stored content. In this lab, changing the R script can leave the data file unchanged.

![Project snapshots over time](screenshots/git-snapshots.png)

*Chacon and Straub, Pro Git, 2nd edition, §1.3, Figure 5. CC BY-NC-SA 3.0. Original diagram.*

![Working files, staging, and local history](screenshots/git-areas.png)

*Pro Git, §1.3, Figure 6. CC BY-NC-SA 3.0. Original labels retained. In RStudio: Save changes the working file; Staged selects a version; Commit records it in local history. The hidden .git directory stores that history. Checkout means putting a recorded version into the working files, as when switching branches.*

## 1. Connect GitHub to an RStudio Project

A **repository** stores project files and the history Git records through commits. A local repository is on your computer. A remote repository is a connected repository elsewhere; here it is on GitHub. RStudio provides the interface to the local project and Git.

1. In a browser, sign into GitHub and create `css-rstudio-practice`. Select **Private** and **Add a README file**. Leave the license and Git ignore template unset for now; the starter includes `.gitignore`.
2. Open **Code > HTTPS** and copy the repository URL.

![GitHub HTTPS address](screenshots/github-clone.png)

*Happy Git documentation example. Copy your own address, not the one pictured.*

3. In RStudio, select **File > New Project > Version Control > Git**.
4. Paste the URL into **Repository URL**. Choose a local parent folder outside the course download and any existing repository. Prefer a local working folder rather than a folder actively synchronized by Box, OneDrive, or iCloud. Let RStudio create the project directory.
5. Click **Create Project**. Find README, the generated `.Rproj`, the **Git** tab, and branch `main`. If you customized your GitHub default branch, use that name consistently wherever this guide says `main`.
6. Use Finder or File Explorer to copy the **contents** of the downloaded `starter-project` into the clone. Replace the initial README with the supplied project README. Include `.gitignore` and `data`. Keep the clone-generated `.Rproj`; do not copy another `.Rproj` or a `.git` directory from the teaching folder. On macOS, Command-Shift-period shows hidden files. Alternatively, create `.gitignore` in RStudio’s text editor using the supplied contents.
7. Open `Week4_RStudio_Git_Lab.R` from this connected folder.

**Check:** script, README, `.Rproj`, and `data` sit together in the clone. Git lists the new files and the branch is `main`. Cloning has configured a remote named `origin`: the connection to your GitHub repository.

A clone includes history and a remote connection. A ZIP contains files without Git history. An `.Rproj` establishes RStudio’s working folder; it does not by itself add Git.

## 2. Baseline analysis and the Git pane

Run script sections 1–2. The baseline selects 2007, gives 142 country observations and five continent groups, and plots GDP per capita against life expectancy.

![Source editor and Git pane in RStudio](screenshots/rstudio-overview.png)

*Posit documentation example. Its filenames and “no branch” state differ from our connected main branch. Pane placement and icons may vary by version.*

Save. In **Git**, inspect the starter files, then tick **Staged** for the script, `.Rproj`, README, `.gitignore`, data, and practice fixtures. Click **Commit**, enter `Add baseline R analysis`, and commit. **Push** and refresh GitHub to verify the files arrived. This is the baseline checkpoint.

## 3. Save, diff, stage, commit

Follow script section 3: change `analysis_year` from 2007 to 1997 and rerun sections 1–2. Save, select the file in Git, and click **Diff**.

![RStudio Review Changes window](screenshots/rstudio-commit.png)

*Posit example. Our file is Week4_RStudio_Git_Lab.R and our message is Compare life expectancy in 1997.*

- **Save** writes edits to the local file.
- **Diff** displays additions and removals relative to another version.
- **Staged** selects saved changes for the next commit.
- **Commit** records the staged snapshot and message in local history.
- **Push** sends local commits to the remote branch.

Read the diff, tick Staged, inspect the staged change, enter the message, and Commit. Leave **Amend previous commit** unchecked. If you edit after staging, inspect and stage that newer edit too.

**Check:** the diff records one year change. Rerunning checks the analytical effect. An empty Git pane does not prove correctness or successful sharing.

## 4. History

Use Git’s **History** clock icon, the Git menu’s History option, or History in Review Changes. Select a commit and file to see the recorded change. The message explains its purpose; the diff shows its content. The main RStudio **History** pane lists R expressions, while **Git History** lists commits. Use Git History here.

## 5. Push and pull

![Git pane controls](screenshots/rstudio-git-pane.png)

*Posit example. Down arrow: Pull. Up arrow: Push. The example predates its first commit, so some controls are disabled. Our clone has a branch and remote.*

Push from RStudio, then verify the correct branch, message, and source on GitHub. Add the connection-check line to README in GitHub’s browser editor and commit directly to `main`. With a clean Git pane locally, **Pull** and inspect README. Script section 5 gives the exact text.

Push sends commits to the remote. Pull retrieves remote changes and integrates them into the current local branch. This is deliberate synchronization, not continuous background sharing.

## 6. Ignored files

Run section 6 to save the plot. It appears in **Files** under `outputs/` and stays absent from **Git** because `.gitignore` excludes that directory. Track the script and input so a collaborator can recreate it. Track `.gitignore` itself.

Session files such as `.Rproj.user/`, `.Rhistory`, and `.RData` stay local. Keep the `.Rproj` settings file in Git. Ignore rules do not remove already tracked files or erase earlier commits.

## 7. Tuesday handoff

Complete G07: update README to describe the current 1997 analysis and one interpretation detail. Save, Diff, Stage, Commit, Push, and verify online. Commit practice notes separately. End on clean `main`.

## 8. Thursday starting point

Reopen the same connected `.Rproj`. Finish pending edits, confirm `main`, and Pull. Rerun sections 1–2 and 6. Verify 1997 and 142 rows. The saved script is authoritative; the Environment may still contain objects from before a branch switch or Pull.

## 9. A branch in RStudio

A branch is a line of development in a repository. It lets a proposal accumulate commits before joining accepted work on `main`.

1. On clean, current `main`, click **New Branch** beside Git’s branch selector.
2. Name it `clarify-labels`. Select remote **origin** if asked. Create and confirm the branch name.
3. Make the two label edits in script section 9. Rerun, save, inspect Diff, stage, commit `Clarify plot units`, and Push.
4. With no pending edits, use the branch dropdown to inspect `main`, then return to `clarify-labels`. Rerun after switching. Both branches use the same project folder.

**If branch controls differ:** create `clarify-labels` from `main` using GitHub’s branch dropdown. In RStudio on clean `main`, Pull to refresh remote branches. Select `origin/clarify-labels` in the branch dropdown and accept creation of a local tracking branch if prompted. If absent, reopen the project and ask the instructor to check the connection.

**Check:** labels change; year and country count do not. The proposal branch appears on GitHub after Push.

![A branch adds a commit while sharing earlier history](screenshots/git-branch.png)

*Pro Git, §3.2, Figure 20. CC BY-NC-SA 3.0. Original labels: master is analogous to our main, iss53 to clarify-labels, and C3 to our label-change commit. Arrows from commits point toward their parent history.*

## 10. Pull request and review

A **pull request** proposes bringing one branch’s changes into another and provides a review space. **Pull** updates your local branch from a remote.

1. After Push, click **Compare & pull request** on GitHub, or **Pull requests > New pull request**.
2. Confirm **base: main** and **compare: clarify-labels**. Use the title and explanation in script section 10, then create the request.
3. Open **Files changed** with a partner. Check units, intended scope, and the successful R rerun.
4. Revise in RStudio on `clarify-labels` if needed. Save, review, stage, commit, and Push. The existing request updates.

![Pull request banner](screenshots/github-pr.png)

![Files changed tab](screenshots/github-review.png)

*GitHub documentation examples. Our proposed branch is clarify-labels.*

A partner can review a private solo repository on the owner’s screen and give verbal feedback. Record it in the PR description. Authors cannot approve their own requests. Separate-account reviews or edits require access granted by the owner. Do not share logins.

A **fork** is a separate repository on GitHub, often used when you cannot contribute directly to an original. Our lab needs no fork.

## 11. Merge, pull, rerun

After review, the owner clicks **Merge pull request** and confirms. In RStudio, verify no unfinished edits, select local `main`, and Pull. Rerun and inspect. Both axes now state units, the year remains 1997, and there are 142 countries.

Browser Merge changes online `main`. Pull updates local `main`. Running R recreates its objects and plot. Check all three. A successful merge does not establish analytical correctness.

## 12. Conflict interpretation

Use `conflict-practice.txt`. It contains **typed example markers**, not a real unresolved Git merge. Do not run it as R. Choose the intended year and replace the whole marker block with the correct assignment. Follow script section 12.

If a real Pull conflict occurs, Git identifies an unresolved file. Open it in RStudio, agree on the intended analysis, remove markers and unwanted text, save, stage the resolved file, and finish the merge commit. Rerun and inspect before Push. Ask for help when the state is unclear. The simulation practices a content decision; it does not demonstrate completion of a real merge.

## 13. Recovery

Use the harmless README exercise in the script. RStudio’s **Revert** for selected changes discards uncommitted edits. Inspect the diff and confirmation carefully; uncommitted text has no Git checkpoint.

For the committed typo, inspect History, edit the correct text, and make a new correction commit. Both mistake and repair stay visible. This workflow uses ordinary edits and commits.

## 14. Handoff

A partner should find the question, source, year, script, and run instructions, then explain and rerun the plot. Write one next task with a concrete success check. Push and verify final notes on `main`. No additional file upload is required.

## Troubleshooting and offline work

| Symptom | Check and next step |
|---|---|
| No Git tab | Open the connected `.Rproj`; confirm Git detection in Git/SVN preferences. Reopen the clone rather than initializing the download folder. |
| CSV missing | Open the clone’s `.Rproj`; data/gapminder.csv belongs directly under that folder. |
| Nothing to commit | Save first; check whether the change is already committed or ignored. |
| Commit needs identity | Complete section 0’s one-time identity setup. |
| Push disabled | Check the connected clone, current branch, and remote origin. Ask for help if the connection is absent. |
| Authentication fails | Check account, token expiration, repository permission, and setup. An account password alone is insufficient for HTTPS Git. |
| Push rejected because online work is newer | Finish/commit local edits, Pull, inspect and rerun, then Push. Stop for help if a conflict appears. |
| Branch switch blocked | Save and commit meaningful work, or deliberately discard only an unwanted edit. Switch from a clean state. |
| Plot still old after Pull | Verify saved source and branch, then rerun sections 1–2 and 6. Environment objects do not update automatically. |
| Internet unavailable | Continue local analysis, commits, History, and branch practice. Review on screen. Mark online steps unfinished and complete them after access returns. |

For a fully offline start, copy starter-project to a new local folder. Use **File > New Project > Existing Directory**, then **Tools > Project Options > Git/SVN**, select Git, confirm initialization, and restart. Make a local baseline commit. This is local practice without a remote. Later create and clone the online repository; the instructor can help carry over working files. Local comparison does not complete a GitHub pull request.

## Sources and screenshot credits

The course examples adapt these workflows. Documentation screenshots retain their source filenames and labels. Accessed September 21, 2026.

- [Posit: version control](https://docs.posit.co/ide/user/ide/guide/tools/version-control.html): [overview](https://docs.posit.co/ide/user/ide/guide/tools/images/rstudio-vcs-pane-labeled.png), [Git pane](https://docs.posit.co/ide/user/ide/guide/tools/images/git-tab.png), [Review Changes](https://docs.posit.co/ide/user/ide/guide/tools/images/git-commit-pane.png).
- [Posit: RStudio Projects](https://docs.posit.co/ide/user/ide/guide/code/projects.html).
- [Happy Git: GitHub first](https://happygitwithr.com/new-github-first), [HTTPS screenshot](https://happygitwithr.com/img/github-https-or-ssh-url-annotated.png), [identity](https://happygitwithr.com/hello-git), [credentials](https://happygitwithr.com/https-pat), [branches](https://happygitwithr.com/git-branches).
- [GitHub: personal access tokens](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens).
- [GitHub: creating a pull request](https://docs.github.com/en/pull-requests/how-tos/create-pull-requests/creating-a-pull-request), [reviewing changes](https://docs.github.com/en/pull-requests/how-tos/review-pull-requests/reviewing-proposed-changes-in-a-pull-request). The banner and Files changed screenshots come from these pages.
- [Git: repositories](https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository), [recording changes](https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository), [ignore rules](https://git-scm.com/docs/gitignore).
- [GitHub: conflicts](https://docs.github.com/en/pull-requests/reference/merge-conflicts), [forks](https://docs.github.com/en/get-started/quickstart/fork-a-repo).
- [Gapminder teaching extract](https://github.com/jennybc/gapminder), copied unchanged from Week 3.
- Assigned [Git & GitHub Crash Course](https://www.youtube.com/watch?v=mAFoROnOfHs). Huddles retrieve viewing notes; classroom practice uses RStudio.

- Chacon and Straub, [Pro Git §1.1: version control](https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control), [§1.3: What is Git?](https://git-scm.com/book/ms/v2/Getting-Started-What-is-Git%3F), and [§3.2: branching](https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging). Diagrams reproduced from the [official book source](https://github.com/progit/progit2/tree/main/images) under [CC BY-NC-SA 3.0](https://creativecommons.org/licenses/by-nc-sa/3.0/).
