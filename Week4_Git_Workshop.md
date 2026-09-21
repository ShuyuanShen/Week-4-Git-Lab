# Week 4 Git workshop

POLS 4130. Tuesday, September 22: sections 0–7. Thursday, September 24: sections 8–15.

Finish the brief slides, then keep this guide open beside GitHub Desktop and a text editor. The optional `Week4_Git_Commands.sh` uses matching section numbers. Complete an action in Desktop **or** the terminal, then inspect its result. Git commands are not R code.

The assigned preparation is [Git & GitHub Crash Course for Beginners [2026]](https://www.youtube.com/watch?v=mAFoROnOfHs). Use your own viewing notes in the huddle. This guide supplies the selected classroom workflow independently of the video's interface.

For each exercise: **PREDICT**, **TRY**, **CHECK**, then **EXPLAIN**. Write short answers in `practice-notes.md`, unless the task names another file. Unless a task asks you to leave edits uncommitted, save and make a separate practice commit before proceeding so each next demonstration starts with no unfinished changes. Worked examples supply their own text. Your practice answers can differ without changing later demonstrations.

## 0. Setup and the connection to Week 3

**USE:** Record how research files change and why. A repository holds a project's files and Git history. Your working tree contains the files you currently edit. A commit records a project snapshot and a message, including the changes selected for that checkpoint.

Week 3's `.qmd` is source. Rendering creates its HTML output. Git can record changes to the source, but it does not run R, validate a claim, or prove that rendering succeeds. A complete reproducible project also needs its required data, packages, and instructions.

Open GitHub Desktop and a plain-text editor. RStudio's Source editor works for Markdown and text. Authenticate Desktop with your own GitHub account for the online steps. Review the commit name and email in Desktop's Git settings. Use your GitHub-provided no-reply email if you want to keep your personal email out of commit metadata.

**PREDICT:** If you edit a `.qmd` and save, what has changed in Git history?
**CHECK:** Nothing enters history until you commit. Nothing reaches GitHub until you successfully publish or push.

## 1. A fresh practice repository

**USE:** Keep the exercise in its own folder, with a known starting state.

In Desktop choose **File > New repository**. Name it `css-practice`. Choose an ordinary local folder outside another Git repository, preferably outside a cloud-sync folder. Select **Initialize this repository with a README**, leave the Git ignore and license choices empty, and create it. Confirm the current branch is `main`; if necessary rename the default branch to `main` before continuing.

Choose **Repository > Show in Finder/Explorer** to locate the actual repository folder. Copy the contents of `starter-project` into it, replacing only the just-created sample README. Include `.gitignore`: show hidden files in your file manager, or create that file in your text editor using the supplied content. Do not copy an entire outer folder into `css-practice`.

In Desktop's **Changes** tab, inspect all five starter files. Select those files and commit with `Add fictional transit starter`. The initial README commit may also appear in history. This guide does not assume a fixed total number of commits.

**CHECK:** The repository root contains `README.md`, `research-question.md`, `practice-notes.md`, `conflict-practice.txt`, and `.gitignore`. Desktop shows no uncommitted changes. History includes `Add fictional transit starter`. Everything remains local.

**G01 (3 minutes):** Locate the folder and the starter commit. In `practice-notes.md`, explain how a folder containing files differs from a repository with recorded history. Save and commit only your note as `Explain repository history`.
**CHECK:** History contains the new note and the file still appears in the folder.
**EXPLAIN:** Why would renaming a file `final_v2` be less informative than a history with meaningful messages?

## 2. Saving an edit and reading a diff

**USE:** A diff compares two versions. Removed lines begin with `-`; added lines begin with `+`. These are comparison markers, not characters to paste into the research question.

Open `research-question.md`. Replace `Does social media change politics?` with this worked example:

> What bus reliability concerns appear in fictional transit comments?

Save. Do not commit yet. In Desktop, select the changed file and read its diff. Predict which old line will disappear and which new line will appear.

```diff
-Does social media change politics?
+What bus reliability concerns appear in fictional transit comments?
```

**CHECK:** The diff shows the question replacement. The file changes on disk, but the latest commit still contains the broad question. Git records text changes without deciding whether the question is substantively better.

**G02 (4 minutes):** In `practice-notes.md`, write a different, specific question about a social topic you choose. Name a setting, an evidence source, and an analysis task. Inspect that file's diff. Leave the worked question unchanged.
**CHECK:** Only the question file and your practice notes differ from their previous versions.
**EXPLAIN:** Which change narrows a research question, and which merely changes wording?

## 3. Selecting changes and committing

**USE:** Select one coherent change for a checkpoint. In the terminal, `git add` places current content in the staging area and `git commit` records it. In Desktop, checked files or lines control what Desktop includes in its next commit. Desktop's checkboxes are its selection interface, not a separate terminal staging step you must also perform.

For the worked example, check only `research-question.md`. Leave `practice-notes.md` unchecked. Enter `Narrow transit question` as the commit summary and commit to `main`. Open **History**, choose that commit, and inspect the recorded diff. Then make a separate practice commit for `practice-notes.md`, if changed.

Optional terminal equivalent for the worked question, after saving it:

```bash
git diff -- research-question.md
git add research-question.md
git diff --cached
git commit -m "Narrow transit question"
```

`git diff` shows unstaged edits to tracked files. `git diff --cached` shows staged changes. An untracked file may not appear in plain `git diff`; `git status` identifies it. If you edit a file again after staging, add it again only if the new text belongs in the same commit.

**CHECK:** History records the question with its message. After recording any separate practice notes, Changes is empty. GitHub still has no copy of these commits unless you already published and pushed.

**G03 (4 minutes):** Add a sentence under `## Revision notes` explaining that the question is descriptive. Save, inspect, and commit only that change with a useful message.
**CHECK:** A distinct commit contains only the intended revision note.
**EXPLAIN:** Why does `Clarify descriptive purpose` tell a future reader more than `fixed it`?

## 4. History and evidence of a change

**USE:** Find what changed, when, and with which explanation. The commit identifier is a reference to the recorded snapshot. Your identifier and time will differ from anyone else's.

Open History and inspect `Narrow transit question`. Compare its diff with the current file. Later commits may add text beyond that historical snapshot. A clean working tree means no uncommitted tracked changes or visible untracked files remain; it does not mean a report is correct or all commits are online.

Optional inspection:

```bash
git status --short
git log --oneline -5
git show --stat HEAD
```

`HEAD` names the current commit in this ordinary branch workflow. The status command prints no file entries when the working tree and staging area are clean. Log displays recent commit identifiers and messages.

**G04 (3 minutes):** Show a partner one focused commit. Ask them to explain the change from its message and diff before you describe it.
**CHECK:** They identify the changed file and the substantive revision.
**EXPLAIN:** What can the history show that a final rendered HTML file alone cannot?

## 5. A README and an ignore file

**USE:** Help someone continue the project and keep local clutter out of new commits.

A README introduces a repository. Add this worked sentence under `## Proposed approach` in the project's README:

> We would classify fictional comments by concern and compare the categories.

Keep the statement that no data have been collected. Save, inspect, and commit as `Describe proposed analysis`.

Open the supplied `.gitignore`. It lists filename patterns for untracked files Git should ignore. Its core R patterns are:

```text
.Rhistory
.RData
.Rproj.user/
.DS_Store
```

Commit `.gitignore` itself so collaborators receive the same rules. It does not remove files that Git already tracks or erase earlier history. The supplied file also ignores `scratch/` for disposable notes. Do not put required code or data in that folder.

**G05 (5 minutes):** Create a `scratch` folder and save a harmless `notes.txt` inside it. In Desktop, verify the file is absent from Changes. Then improve one instruction in README and commit that README change.
**CHECK:** README appears in the commit, while the scratch file remains on disk and untracked. The optional command `git check-ignore -v scratch/notes.txt` names the matching rule.
**EXPLAIN:** Why does an ignore rule help with clutter but fail to make committed private data safe?

Track the source and shareable files needed to reproduce work. Review the contents before publishing. Keep passwords, tokens, private participant information, and material without sharing permission out of the repository. A rendered report can be shared separately or tracked for a deliberate publishing workflow; it cannot replace its source and inputs.

## 6. A remote and the first publication

**USE:** Connect local history to a hosted repository. A remote is a named connection to another repository. `origin` is the conventional name used here. GitHub hosts the remote. GitHub Desktop operates on your local repository and exchanges commits with it.

In Desktop choose **Publish repository**. Check your own account, the `css-practice` name, and **Keep this code private**. Publish and choose **View on GitHub**. Confirm README and `Narrow transit question` appear on the correct branch. A private repository still needs careful content choices.

After this first publication, **Push origin** sends later local commits. **Fetch origin** retrieves information about remote commits without combining them into your working branch. **Pull origin** retrieves and integrates remote changes into that branch. Desktop may show different buttons depending on whether there are commits to send or receive.

**G06 (5 minutes):** Add a short project limitation to README and commit it. Before pushing, compare Desktop History with GitHub's commit list. Then push and refresh the browser.
**CHECK:** The new commit appears online after a successful push. The local and online file contents agree on `main`.
**EXPLAIN:** Why can Changes be empty while GitHub still lacks your latest work?

**No-login fallback:** Complete the local commit and show its diff to a partner. Record that online verification remains unfinished. Do not claim a push occurred. Continue local work and return to publication when sign-in or connectivity works.

## 7. Combined application and troubleshooting

**G07 (8–10 minutes):** Create `question-extension.md` for a different topic of your choice. State a question and the evidence you would need. Make one focused commit. Add a limitation in a second commit. Push if connected, and ask a partner to find both changes.
**CHECK:** Two readable diffs show two coherent changes. The project remains explicitly hypothetical. Your proposed evidence fits your question.
**EXPLAIN:** Does recording a research design establish that its causal claim is justified?

If something is missing, locate the state before repeating actions:

| Observation | Check |
|---|---|
| No edit in Changes | Save the file, confirm repository folder and current branch, then inspect ignore rules. |
| No edit in History | You may have saved without committing, or left the file unchecked. |
| Commit absent online | Confirm account, repository, branch, and successful publish/push. |
| New file absent from plain `git diff` | Inspect `git status`; it may be untracked. |
| Push rejected or updates requested | Stop new edits. Fetch and inspect the remote changes, then integrate deliberately. Avoid force pushing. |
| Terminal cannot find Git | Use Desktop for the main route, or install command-line Git before the optional route. |

Before Thursday, finish or separately commit your practice notes. No particular G07 answer is required next time.

## 8. Returning to a project: clone and synchronize

**USE:** Begin collaboration from a known current version.

Open Tuesday's `css-practice` in Desktop. Select `main`. Check that Changes is empty. Fetch and pull if Desktop offers incoming changes. Inspect the question and README. You do not need to clone a repository you already have locally.

A **clone** creates a new local repository from an existing one, including history and a connection to its source. In Desktop, **File > Clone repository** downloads your existing GitHub repository into a new, empty destination when you need another working copy. A ZIP download contains files without Git history. A **fork** creates a separate repository on GitHub, useful for proposing changes where you cannot write directly. A fork still needs a clone for local work. This class uses your own repository and does not require a fork.

**If Tuesday was missed:** Complete sections 0–1, then perform the worked edits and commits in sections 2–3 and 5. Publish through section 6 if connected. Skip practice answers for now.

**G08 (3 minutes):** Explain which operation fits each situation: continuing in Tuesday's folder, working on a second computer, and contributing to someone else's project without write access.
**CHECK:** Reopen and synchronize; clone; fork then clone are the respective choices for this workflow.
**EXPLAIN:** Why would downloading a ZIP be insufficient for inspecting earlier commits?

## 9. A branch for one proposed change

**USE:** Develop a change along a separate line of history before merging it into `main`.

In Desktop, starting from clean `main`, select **Current Branch > New Branch**. Name it `clarify-method` and create it from `main`. In `research-question.md`, add:

```text
## Proposed method
We would label each fictional comment by its main concern.
We would compare concern categories without claiming causation.
```

Save, inspect, and commit as `Explain proposed coding method`. The branch shares earlier history with `main`, then records this new commit. Switching branches changes which committed version appears in the same folder. You do not need a duplicate folder.

**CHECK:** With no uncommitted edits, switch to `main`: the new method is absent. Switch back to `clarify-method`: it reappears. Finish on `clarify-method`. Do not move unfinished edits between branches to perform this check.

**G09 (4 minutes):** On `clarify-method`, add one sentence acknowledging that different coders might disagree. Commit it separately.
**CHECK:** The branch contains the method and limitation. `main` still lacks both.
**EXPLAIN:** How does the branch let another person review a change before it becomes part of `main`?

## 10. A pull request and review

**USE:** A pull request (PR) proposes combining changes into a destination branch. It supports review before a merge. It is a GitHub workflow, distinct from pulling remote changes into a local branch.

On `clarify-method`, choose **Publish branch** or **Push origin** as appropriate. Use **Preview Pull Request**, verify base `main` and compare `clarify-method`, then **Create Pull Request** to continue in the browser. Describe the method addition and why it helps a reader. Inspect **Files changed** before opening the request.

A partner can review on your screen. They do not need access to the private repository for this route. If they use a separate account for an online review, they need appropriate repository access. The author cannot formally approve their own PR. A verbal classroom review is a real peer check, but is not a recorded GitHub approval.

**G10 (6 minutes):** Ask a partner to inspect the question, method, and limitation. Have them identify one unclear phrase. Revise it on the same branch, commit, and push.
**CHECK:** The existing PR displays the new revision. No second PR is needed. The reviewer can explain how the method addresses the question.
**EXPLAIN:** Why does a successful automatic merge not prove the proposed analysis is valid?

**Offline fallback:** Compare `clarify-method` with `main` in Desktop and review the diff together. Record feedback locally. Section 11 gives a local merge route. This substitutes for reviewing and combining a change, but does not create an online PR.

## 11. Merge and update the local main branch

**USE:** A merge combines development histories. After an online merge, your local `main` needs an update.

On GitHub, recheck the PR's base and Files changed. Once the classroom review is addressed, merge the request using the available merge option and confirm. If repository rules block merging, resolve the stated requirement instead of bypassing it. In Desktop, select `main`, fetch, and pull. Open the file locally.

**CHECK:** `main` now includes the proposed method. Local and online text agree. A squash merge may create a different commit identifier from the branch's original commits, so compare the accepted content as well as the history.

For the offline route only: with no uncommitted edits, switch to `main`. Under **Current Branch**, choose the option to merge a branch into `main`, select `clarify-method`, and merge. Inspect the local file. This merges locally; it does not mark an online PR as reviewed or merged. Push when online if you chose this route, and inspect any existing PR before proceeding further.

**G11 (4 minutes):** Locate the accepted method in local `main` and, if online, GitHub's `main`. Explain which action updated each location.
**CHECK:** Both copies show the accepted method when synchronized.
**EXPLAIN:** Why did merging in the browser leave the local file unchanged until synchronization?

## 12. Conflict markers and a decision about meaning

**USE:** Git reports a merge conflict when it cannot combine changes automatically. Editing different lines often merges cleanly; overlapping edits or edit/delete disagreements can require a person to decide.

Open `conflict-practice.txt`. Its first line explicitly calls it a **simulation**. The marker block represents a fictional merge into a branch containing the reliability wording:

```text
<<<<<<< HEAD
We study bus reliability concerns.
=======
We study bus accessibility concerns.
>>>>>>> other-branch
```

For this ordinary merge example, the first side is the current branch and the second is the incoming branch. Those meanings depend on the operation; do not treat them as universal labels for local and remote data. Read the branches and context. The words inside the markers disagree about the study's scope.

**G12 (6 minutes):** Decide whether the project should study reliability, accessibility, or explicitly compare both. Replace the entire marker block with one coherent paragraph. Keep the simulation disclosure. Save, inspect, and commit as `Resolve simulated scope disagreement`.
**CHECK:** No marker lines remain in that file. The final paragraph matches the chosen scope. Desktop does not report an unresolved merge because this file was never in an actual conflicted Git state.
**EXPLAIN:** Why could blindly keeping both versions produce a worse research design?

Section 15 creates a real conflict in a separate disposable repository. In an actual conflict, editing the text alone is insufficient: you must also mark it resolved and complete the merge.

## 13. Recovery that preserves history

**USE:** Revert a committed mistake by making a new commit that reverses its changes. The original commit stays visible. An uncommitted edit has no checkpoint to revert; inspect its diff and preserve valuable text before discarding anything.

**G13 (5 minutes):** On clean `main`, create `recovery-demo.txt` with the harmless text `This is a temporary practice file.` Commit only that file as `Add recovery demonstration`. Immediately open History, right-click that new commit, and choose **Revert Changes in Commit**. Inspect the new commit and the folder.
**CHECK:** The original commit and a new reversing commit both appear. The temporary file is absent. Your research question is unchanged. Push the resulting history if connected.
**EXPLAIN:** Why does revert help collaborators understand a correction?

The optional command route uses `git revert --no-edit HEAD` only when `HEAD` is exactly the isolated demonstration commit. Do not apply it to whichever real project commit happens to be latest. Avoid reset, force push, or rewriting shared history in this workshop.

## 14. An issue and a project handoff

**USE:** An issue records a problem, question, or planned improvement. It can exist before anyone has code ready. A PR proposes an actual branch change. A useful issue states the expected result, current problem, and a way to check completion.

**G14 (8 minutes):** Ask a partner to find the project's question, latest accepted method, and next improvement. Improve README if any is hard to locate. Open an issue on your own practice repository for one remaining improvement, or write it in `practice-notes.md` offline.

Example issue title: `Define the concern categories`. Description: `The method says we will label comments, but no category definitions exist yet. Add definitions and one fictional example per category. A second reader should be able to apply each definition.`

**CHECK:** A new reader can find the purpose and next action. The issue describes a checkable task. Any README change has its own reviewed diff and commit.
**EXPLAIN:** Which future change would need an issue, a PR, or both?

For next week's website, Quarto will build pages from source, Git will record source history, and GitHub Pages will host the site. Publication is a later workflow. This week does not publish a website.

## 15. Optional extension: a real merge conflict

**USE:** Distinguish a text simulation from an actual unresolved merge. Allow 10–15 minutes. Use the commands in section 15 of `Week4_Git_Commands.sh` in Terminal or Git Bash. They create `css-conflict-demo` as a **new sibling folder outside all other repositories**. If the name already exists, choose a new name rather than reusing it. No remote is involved.

The sequence creates one baseline line, creates branch `accessibility`, changes the same line on that branch, returns to `main`, and changes the line differently there. Merging `accessibility` into `main` deliberately stops with a conflict.

**PREDICT:** Why can Git not choose the study's scope for us?
**CHECK before editing:** `git status --short` displays `UU scope.txt`. `git diff --name-only --diff-filter=U` displays `scope.txt`. The file contains markers. These Git states distinguish it from section 12's simulation.

Edit the file to one intended sentence and remove the markers. In this example, write `We compare bus reliability and accessibility concerns.` Then stage `scope.txt` and complete the merge with the supplied commit command.

**CHECK after committing:** Status has no file entries, the unresolved-file command prints nothing, and the log shows both branches' work and a merge commit. Read the sentence too. A clean Git state does not judge the research design.

## 16. Suggested solutions and interpretation checks

Try each practice before reading its solution. Exact wording can vary. These are examples and checking criteria, not required findings.

<details>
<summary>G01–G04: local history</summary>

- **G01:** A repository links files to recorded snapshots and explanations. File names alone do not establish ancestry or the content of each revision.
- **G02:** Example: `Which service problems recur in fictional comments about city buses?` This names a setting, evidence, and classification task. The diff should show only the intended text edits.
- **G03:** Example revision note: `This question describes stated concerns and does not estimate an effect on behavior.` Commit summary: `Clarify descriptive purpose`.
- **G04:** The selected diff shows the old broad question and new narrow question. A rendered file communicates the current result but ordinarily lacks that sequence of source decisions.

</details>

<details>
<summary>G05–G08: sharing and copies</summary>

- **G05:** `scratch/notes.txt` matches `scratch/` and stays untracked. README remains trackable. Ignore patterns do not remove committed content or replace a sharing decision.
- **G06:** A local commit may be ahead of the remote even with no unfinished edits. A successful push makes the new commit available on the remote branch.
- **G07:** A first commit could add a question about fictional housing comments. A second could explain that those comments would not represent all residents. Clear history documents decisions without validating the design.
- **G08:** Reopen and synchronize an existing local copy. Clone for a new local copy. Fork then clone when a separate hosted repository is needed for contributions without direct write access.

</details>

<details>
<summary>G09–G11: review and merge</summary>

- **G09:** Example: `Two coders may interpret an ambiguous comment differently.` It should appear on `clarify-method` and remain absent from `main` before the merge.
- **G10:** A reviewer could ask what `main concern` means for a comment mentioning two problems. Clarify the coding rule and push to the same branch. The PR updates to include the change.
- **G11:** GitHub's merge changes remote `main`. Switching to local `main` and pulling brings the accepted change into that local branch. A local offline merge combines the branches locally instead.

</details>

<details>
<summary>G12–G14: conflict, recovery, and handoff</summary>

- **G12:** A valid comparison solution is `We compare bus reliability and accessibility concerns in fictional transit comments.` Keeping only one scope can also be valid if justified. Remove all three marker lines and both competing original lines. Keep the fictional simulation disclosure.
- **G13:** The added temporary file disappears after revert. Two history entries remain: the original addition and its reversal. No unrelated source file should change.
- **G14:** A new reader should locate a descriptive question, hypothetical data, proposed labeling method, and one remaining checkable task. An issue records the task. A later PR proposes a change that addresses it.

</details>

## Sources and further help

Official documentation checked September 19, 2026. Interface labels may vary slightly by platform or app version.

- [First repository in GitHub Desktop](https://docs.github.com/en/desktop/overview/creating-your-first-repository-using-github-desktop)
- [Reviewing and committing changes](https://docs.github.com/en/desktop/making-changes-in-a-branch/committing-and-reviewing-changes-to-your-project-in-github-desktop)
- [Git status](https://git-scm.com/docs/git-status) and [Git diff](https://git-scm.com/docs/git-diff)
- [Ignoring files](https://docs.github.com/en/get-started/getting-started-with-git/ignoring-files)
- [Synchronizing a branch](https://docs.github.com/en/desktop/working-with-your-remote-repository-on-github-or-github-enterprise/syncing-your-branch-in-github-desktop)
- [Creating a pull request or issue](https://docs.github.com/en/desktop/working-with-your-remote-repository-on-github-or-github-enterprise/creating-an-issue-or-pull-request-from-github-desktop)
- [Merge conflicts](https://docs.github.com/en/pull-requests/reference/merge-conflicts)
- [Reverting a commit in Desktop](https://docs.github.com/en/desktop/managing-commits/reverting-a-commit-in-github-desktop) and [Git revert](https://git-scm.com/docs/git-revert)
