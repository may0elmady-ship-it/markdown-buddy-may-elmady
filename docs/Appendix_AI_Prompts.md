> **AI Assistance Declaration:** I used Claude (Anthropic, Opus 5.5, 26 Oct 2026) for README structure ideas, Markdown and R Markdown formatting suggestions, and wording. Prompts used: listed in full below. I verified outputs using GitHub's Markdown preview, a comparison with the tidyverse `dplyr` README, knitting the `.Rmd` in RStudio/Posit Cloud, and a Google Sheets cross-check of the summary totals. All final calculations are done by myself. I am responsible for the accuracy and originality of this work.

# Appendix: AI Prompts and Key Responses

**Tool:** Claude (Anthropic)
**Model / version:** Opus 5.5
**Date used:** 26 October 2026
**Project:** `markdown-buddy-may-elmady` (BDA400 Assignment 1)

This appendix lists every prompt I gave the AI, a short summary of the key response, and what I did with it. Responses are summarised, not pasted in full, to keep the file readable.

## Contents

- [Step 1: Markdown Structure and Documentation Goals](#step-1-markdown-structure-and-documentation-goals)
- [Step 2: AI-Assisted README.md](#step-2-ai-assisted-readmemd)
- [Step 3: Documenting the R Script with R Markdown](#step-3-documenting-the-r-script-with-r-markdown)
- [Verification Summary](#verification-summary)

---

## Step 1: Markdown Structure and Documentation Goals

### Prompt 1.1 (Seed)

> Explain what sections a good GitHub README for an R data analysis project should include.

**Key response:** The AI suggested Title and short description, Overview / Purpose, Project Structure, Data description, Installation (R version and packages), Usage, Example Code, Outputs / Results, Contributing, License, Author / Contact and Acknowledgements.

**What I did:** Kept the list as a starting point. Noted that "Contributing" is less useful for a single-author course project.

### Prompt 1.2 (Refinement)

> Revise the sections list so it's concise and uses Markdown headers and bullet formatting.

**Key response (Markdown outline):**

```markdown
# Project Title
Short one-line description.

## Overview
- Business question(s) the project answers

## Project Structure
- Folder tree with one-line notes

## Dataset
- Source, size, column descriptions

## Installation
- R version
- Required packages

## Usage
- How to run the script / knit the Rmd

## Example Code
- Short code block showing the main step

## Outputs
- Tables and charts produced

## License

## Author
```

**What I did:** Used this as my intended README outline. Added a Table of Contents and a Documentation link to the `.Rmd` file.

### Prompt 1.3 (Critique / Validation)

> Check the Markdown syntax for correctness and readability.

**Key response:** The syntax was valid. The AI recommended one `#` H1 only, `##` for every main section, a blank line before and after each header and list, and a language tag on every fenced code block.

**What I did:** Applied all four points in my README.

**Verification check:** I compared the structure with the [tidyverse `dplyr` README](https://github.com/tidyverse/dplyr). `dplyr` uses Overview, Installation and Usage sections with short code examples, badges at the top, and links out to fuller documentation. I added badges and a link to my `.Rmd` documentation to match that style.

---

## Step 2: AI-Assisted README.md

### Project summary I gave the AI

> My R project analyses synthetic custom-cake orders for my business, Toronto Cakes, which takes most orders through Instagram DMs. The main script is `scripts/order_summary.R`. It reads `data/cake_orders_synthetic.csv` (20 orders, Jan–May 2026), adds lead time and price per serving, summarises orders and revenue by order type and by month, and saves a bar chart of revenue by order type. It uses readr, dplyr, lubridate and ggplot2.

### Prompt 2.1 (Seed)

> Here's a summary of my R project: [summary above]. Generate a professional README.md file using Markdown.

**Key response:** A first README with Title, Overview, Project Structure, Dataset table, Usage and Outputs sections.

**What I did:** Kept the overall layout. Rewrote the Overview in my own words around the three business questions I actually care about.

### Prompt 2.2 (Refinement)

> Add sections for Installation, Example Code, and License. Keep tone concise and professional.

**Key response:** Added Installation (clone command plus `install.packages()`), Example Code (a `dplyr` pipeline that summarises by order type) and License (MIT).

**What I did:** Checked that the example pipeline matches the code in my script. Added a `LICENSE` file to the repo so the link works.

### Prompt 2.3 (Critique / Validation)

> Review the Markdown for syntax errors and suggest 2 improvements for clarity.

**Key response:**

1. The code blocks inside the numbered Installation list were not indented, so GitHub restarted the numbering at 1. Fix: indent them by three spaces.
2. The folder-tree block had no language tag, so GitHub tried to highlight it. Fix: use ` ```text `.

**What I did:** Applied both fixes and confirmed them in GitHub's preview.

**Verification check:** Previewed the README on GitHub. Headers, the Table of Contents links, both tables, the numbered list and all code blocks render correctly.

---

## Step 3: Documenting the R Script with R Markdown

### Script description I gave the AI

> `order_summary.R` loads `data/cake_orders_synthetic.csv`, adds `lead_time_days`, `price_per_serve` and `order_month`, then creates `order_type_summary` and `monthly_summary` tables and saves `outputs/revenue_by_order_type.png`.

### Prompt 3.1 (Seed)

> Here's my R script description. Suggest Markdown formatting and code block examples.

**Key response:** Suggested a YAML header, a Purpose section, an Inputs table, one code chunk per processing step, and an Outputs section.

**What I did:** Used that layout and wrote the Purpose and business questions myself.

### Prompt 3.2 (Refinement)

> Add syntax highlighting and improve section organization (e.g., # Purpose, ## Inputs, ## Outputs).

**Key response:** Added `highlight: tango` and a floating table of contents to the YAML, named every code chunk (`load-data`, `helper-columns`, ...), and organised the file as `# Purpose`, `# Inputs`, `# Processing Steps`, `# Outputs`, `# How to Run`, `# Notes and Limitations`.

**What I did:** Kept the structure. Added `knitr::kable()` so the summary tables display neatly when knitted.

### Prompt 3.3 (Critique / Validation)

> Is the Markdown consistent with RMarkdown best practices?

**Key response:** Mostly yes. Three suggestions:

1. Add a hidden `setup` chunk with `include = FALSE` to set global chunk options.
2. Set `root.dir` to the project root so the relative data path works when knitting from `scripts/`.
3. Mark the `install.packages()` and `source()` chunks `eval = FALSE` so knitting does not reinstall packages or run the script twice.

**What I did:** Applied all three.

**Verification check:** Knitted `order_summary.Rmd` in RStudio/Posit Cloud. The table of contents, headers, tables, code chunks and the chart render correctly.

---

## Verification Summary

| Check | Method | Result |
|-------|--------|--------|
| README structure | Compared with tidyverse `dplyr` README | Added badges, ToC and documentation link |
| README syntax | GitHub Markdown preview | All elements render correctly |
| Rmd rendering | Knit in RStudio/Posit Cloud | All sections, chunks and chart render |
| Summary totals | Primary: R script. Cross-check: Google Sheets `SUMIF` / `AVERAGEIF` / `COUNTIF` | Totals match (`docs/Verification_CrossCheck.csv`) |
| Spot-check | Manually re-added the Wedding orders from the CSV | Matches R output |
| Privacy | Only synthetic data shared with the AI | No real customer data used |

The AI did not perform any calculations. All numbers come from running the R script myself and checking them in Google Sheets.
