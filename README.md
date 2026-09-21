# Week 4: version control and collaboration in RStudio

POLS 4130 · September 22 and 24, 2026

Use **RStudio’s Git pane** for version control and **GitHub in your browser** for sharing and review. The lab builds on Week 3’s visualization work. It does not require Quarto or terminal commands.

## Start here

1. Follow sections 0–1 of `Week4_Git_Workshop.md` to connect a new practice repository to an RStudio Project.
2. Copy the contents of `starter-project` into that cloned project, including `.gitignore`. Keep the `.Rproj` file RStudio created for the clone.
3. Open **Week4_RStudio_Git_Lab.R** inside the clone. It contains the demonstrations, individual practice, observable checks, and commented solutions for both meetings.

Finish the brief slides first, then stay in this R script for the lab. Keep the guide available for setup and troubleshooting. The downloaded teaching folder is a source of starter files; the connected clone is where you practice.

- **Tuesday:** sections 0–7. Edit and rerun an R analysis, inspect its diff, commit it, and push it to GitHub.
- **Thursday:** sections 8–14. Create a branch in RStudio, review a pull request on GitHub, merge, pull, and rerun the accepted analysis.

Each class lasts 100 minutes. Allow about 20 minutes for slides, 65 minutes for guided practice, and 15 minutes for supported work. Core Tuesday work is through section 6; section 7 combines the skills. Core Thursday work is sections 8–11 and 14. Sections 12–13 add conflict interpretation and recovery practice.

## Files

| File | Purpose |
|---|---|
| `Week4_Git_Workshop.md` | Setup, interface reference, troubleshooting, and source links |
| `starter-project/Week4_RStudio_Git_Lab.R` | Main lab: one R script with numbered demonstrations and practice |
| `starter-project/data/gapminder.csv` | The unchanged Week 3 historical data, 1,704 country-year rows |
| `starter-project/README.md` | Instructions a collaborator can use to rerun the project |
| `starter-project/practice-notes.md` | Short observations and explanations |
| `starter-project/research-question.md` | The question and scope of the analysis |
| `starter-project/conflict-practice.txt` | A clearly labeled text simulation; never run this file as R |
| `starter-project/.gitignore` | RStudio session files and generated output stay local |
| `screenshots/` | Documentation screenshots used in the slides and setup guide |

The top-level `.Rproj` and two original fixture paths remain available for continuity. The lab itself uses the newly cloned project. All examples use historical country-level data; the plot supports description, not a causal claim.

## Before class

Have RStudio, R, Git, a GitHub account, and the `readr`, `dplyr`, and `ggplot2` packages ready. Git must be installed where RStudio can detect it. The setup guide includes one-time identity and sign-in help using RStudio and the browser. Git operations in the lab use buttons and menus.

Use your own private practice repository. A partner can review on your screen. For separate-account contributions, the owner must arrange collaborator access. Local editing and commits can continue without the internet after setup; online checks remain unfinished until connection is restored.
