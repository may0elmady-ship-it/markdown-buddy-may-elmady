> **AI Assistance Declaration:** I used Claude (Anthropic, Opus 5.5, 26 Oct 2026) for README structure ideas, Markdown and R Markdown formatting suggestions, and wording. Prompts used: see [`docs/Appendix_AI_Prompts.md`](docs/Appendix_AI_Prompts.md). I verified outputs using GitHub's Markdown preview, a comparison with the tidyverse `dplyr` README, knitting the `.Rmd` in RStudio/Posit Cloud, and a Google Sheets cross-check of the summary totals. All final calculations are done by myself. I am responsible for the accuracy and originality of this work.

# Reflection: AI-Assisted Documentation

**Student:** May Elmady
**Course:** BDA400 Data Science Tools and Techniques
**Assignment:** Assignment 1 – Markdown Buddy

## 1. How did the AI tool support your documentation process?

The AI was most useful at the start, when I had a working R script but no clear idea how to present it. My first prompt gave me a full list of README sections in a few seconds, and the refinement prompt turned that list into a clean Markdown outline I could build on. It saved me from staring at an empty file.

It was also helpful as a syntax checker. When I asked it to review my README, it caught two problems I had missed: the code blocks inside my numbered Installation list were not indented, so GitHub restarted the numbering, and my folder-tree block had no language tag. For the `.Rmd` file, it reminded me to add a hidden `setup` chunk, set the root directory so the data path works when knitting, and use `eval = FALSE` on the install and `source()` chunks. These are small details, but they make the difference between a file that renders properly and one that breaks.

The content itself, though, had to come from me. The AI's first draft described a generic "sales analysis" project. I rewrote the Overview around the three questions I actually ask about my own cake business: which order types earn the most, how far ahead customers book, and how orders change by month.

## 2. What were the strengths and weaknesses of using AI for this task?

**Strengths**

- **Speed:** a complete, well-organised first draft in minutes.
- **Consistency:** it applied the same header levels and code-block style across the whole file.
- **Iteration:** each follow-up prompt improved one specific thing, so I could refine step by step instead of starting over.
- **Best-practice reminders:** it knew R Markdown conventions, such as named chunks and `knitr::kable()` for tables, that I would have had to look up.

**Weaknesses**

- **Generic content:** without my edits, the README could describe any project. It did not know my data or my business.
- **Extra sections:** it added a "Contributing" section that does not make sense for a single-author course project, so I removed it.
- **No real verification:** the AI can say the Markdown "looks correct", but it cannot see how GitHub or RStudio actually renders it. Only previewing and knitting it myself proved it worked.
- **Risk of trusting numbers:** if I had asked it to calculate totals, it could have produced figures that look right but are wrong. I kept all calculations in R and checked them in Google Sheets.

## 3. How did you use AI ethically, and how did you verify its output?

I followed three rules. First, **privacy:** I only shared my synthetic dataset and a written summary of the project. I did not upload any real customer names, messages or prices from my Instagram orders. Second, **transparency:** I added the AI Assistance Declaration to the top of every file, listed every prompt in `docs/Appendix_AI_Prompts.md`, and added a disclosure section at the bottom of the README explaining what I changed. Third, **responsibility:** the AI was a design assistant only. It suggested structure and wording, but it did not compute anything.

To verify the output, I:

1. Compared the AI's README structure with the tidyverse `dplyr` README and added a badge row, table of contents and documentation link to match professional practice.
2. Previewed the README on GitHub to confirm headers, tables, lists and code blocks rendered correctly.
3. Knitted the `.Rmd` file in RStudio/Posit Cloud and checked every section, table and the chart.
4. Ran the R script myself, then cross-checked the totals by order type in Google Sheets using `SUMIF`, `COUNTIF` and `AVERAGEIF`, and spot-checked the Wedding orders by hand.

This process showed me that AI is a strong starting point for documentation, but the final quality depends on the person checking it. I would use the same workflow again: let AI draft the structure, then make the content my own and verify everything before publishing.
