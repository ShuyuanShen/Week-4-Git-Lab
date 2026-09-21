# Week 4: Git and GitHub!

Studends:
A

POLS 4130, September 22 and 24, 2026.

Students:
B

Both meetings begin with brief conceptual slides, then switch once to **Week4_Git_Workshop.md** for demonstrations and practice. GitHub Desktop is the main interface. Keep the guide beside your text editor and Desktop throughout the lab. RStudio can edit the text files, but Git commands belong in a terminal, never the R Console.

## Start here

1. Open `Week4_Git_Workshop.md`. Tuesday uses sections 0–7. Thursday uses sections 8–15.
2. Create a new `css-practice` repository using section 1. Copy the **contents** of `starter-project` into it, including the hidden `.gitignore` file. Keep the teaching guide outside the practice repository.
3. Predict the effect of an action, perform it, inspect the result, and explain what changed. Each practice has a separate attempt, an observable check, and an explanation prompt.

`Week4_Git_Commands.sh` is an optional command companion, organized with the same section numbers. All commands are comments. Copy only the command you need into a terminal after checking its instructions. Running the whole file makes no changes. Desktop and terminal commands are alternative routes through the same Git operations; do not perform both commits for the same example.

## Two sessions

- **Tuesday: local history and sharing.** About 15–20 minutes of slides, followed by sections 0–7. Core practice: G01–G06. G07 applies the workflow to a second research question.
- **Thursday: collaboration and recovery.** About 15–20 minutes of slides, followed by sections 8–15. Core practice: G08–G12 and G14. G13 is a short recovery exercise. Section 15 is an optional real-conflict extension.

Each meeting lasts 100 minutes. Allow the remaining time for supported work and questions. The practice bank may continue after class. Solutions are in section 16. Worked examples establish the required state; later examples do not require a particular practice answer. Finish or separately commit practice edits before changing branches.

## Files

| File | Purpose |
|---|---|
| `Week4_Git_Workshop.md` | Main guide: examples, G01–G14, checks, troubleshooting, solutions |
| `Week4_Git_Commands.sh` | Commented terminal equivalents, including the optional real-conflict lab |
| `starter-project/README.md` | Short project description that students will improve |
| `starter-project/research-question.md` | Deliberately broad starting question |
| `starter-project/practice-notes.md` | Space for independent practice answers |
| `starter-project/conflict-practice.txt` | Clearly labeled simulation of conflict markers |
| `starter-project/.gitignore` | Rules for RStudio and local temporary files |
| `research-question.md`, `conflict-practice.txt` | Same starter text at the original locations for compatibility |

All transit examples are fictional. No comments have been collected and no findings are claimed. This week practices project history with small text files, then connects that workflow to the `.R`, `.qmd`, and data files from Weeks 2–3. It introduces no new R packages or graded submission.

## Requirements and fallback

Install GitHub Desktop and a plain-text editor before class. For online work, sign into your own GitHub account and use a private practice repository. A partner can review on your screen without receiving repository access. A shared repository with separate accounts requires collaborator access arranged by its owner.

Local commits, branches, and the optional real-conflict exercise work offline after setup. If sign-in or the network fails, follow the local fallback in sections 6 and 10. A local merge practices Git, but it does not complete a GitHub pull request. Return to the online steps when access is available.

For the optional command route, install Git 2.28 or later and use Terminal on macOS/Linux or Git Bash on Windows. Desktop includes Git for its own use; that does not guarantee `git` is available in your terminal. Verify with `git --version`.

The guide links the assigned crash course and the official documentation used for the workflows. Keep Week 3's report and data together when you later track that project. A successful commit does not test whether its report renders.
