> **AI Assistance Declaration:** I used Claude (Anthropic, Opus 5.5, 26–27 Oct 2026) to help draft and format this README, the R Markdown file and the reflection wording, and to suggest structure. Prompts used: see [`docs/Appendix_AI_Prompts.md`](docs/Appendix_AI_Prompts.md). I verified outputs using GitHub's Markdown preview, a comparison with the tidyverse `dplyr` README, and by running the R script myself in RStudio/Posit Cloud. All final calculations are done by myself. I am responsible for the accuracy and originality of this work.

# Markdown Buddy: Toronto Cakes Order Analysis

![R](https://img.shields.io/badge/language-R-276DC3)
![Data](https://img.shields.io/badge/data-synthetic-lightgrey)
![License](https://img.shields.io/badge/license-MIT-green)

A small R project that summarises custom-cake orders for **Toronto Cakes**, a home-based cake business that takes most of its orders through Instagram. The project shows which order types earn the most, how far ahead customers book, and how orders change month to month.

> **Note:** All data in this repository is synthetic. No real customer information is included.

## Table of Contents

- [Overview](#overview)
- [Project Structure](#project-structure)
- [Dataset](#dataset)
- [Installation](#installation)
- [Usage](#usage)
- [Example Code](#example-code)
- [Outputs](#outputs)
- [Documentation](#documentation)
- [License](#license)
- [Author](#author)
- [AI Assistance Disclosure](#ai-assistance-disclosure)

## Overview

Custom cake orders arrive through Instagram DMs, story replies and a website form. Tracking them by hand makes it hard to see patterns. This project answers three questions:

1. Which order type (Birthday, Wedding, Baby Shower, Other) brings in the most revenue?
2. What is the average lead time between ordering and pickup for each type?
3. How do order counts and revenue change by month?

## Project Structure

```text
markdown-buddy-may-elmady/
├── README.md                       # Project documentation (this file)
├── Reflection.md                   # Reflection on AI-assisted documentation
├── LICENSE                         # MIT license
├── .gitignore                      # Keeps generated files out of Git
├── data/
│   └── cake_orders_synthetic.csv   # Synthetic order data (20 rows)
├── scripts/
│   ├── order_summary.R             # Main analysis script
│   └── order_summary.Rmd           # R Markdown documentation of the script
└── docs/
    ├── README_Outline.md           # Step 1 README section outline
    ├── Appendix_AI_Prompts.md      # All AI prompts and key responses
    └── Verification_CrossCheck.csv  # SUMIF/COUNTIF cross-check (open in Google Sheets)
```

## Dataset

`data/cake_orders_synthetic.csv` contains 20 synthetic orders from January to May 2026.

| Column         | Description                                   |
|----------------|-----------------------------------------------|
| `order_id`     | Unique order code (e.g., `TC001`)             |
| `order_date`   | Date the order was confirmed                  |
| `pickup_date`  | Pickup or delivery date                       |
| `order_type`   | Birthday, Wedding, Baby Shower, or Other      |
| `cake_flavour` | Main cake flavour                             |
| `tiers`        | Number of tiers                               |
| `servings`     | Number of servings                            |
| `price_cad`    | Final price in CAD                            |
| `channel`      | Instagram DM, Instagram Story Reply, or Website Form |

## Installation

**Requirements:** R 4.2 or later, plus RStudio or Posit Cloud.

1. Clone the repository:

   ```bash
   git clone https://github.com/may0elmady-ship-it/markdown-buddy-may-elmady.git
   cd markdown-buddy-may-elmady
   ```

2. Install the required packages:

   ```r
   install.packages(c("readr", "dplyr", "lubridate", "ggplot2", "rmarkdown"))
   ```

## Usage

Run the analysis from the project root:

```r
source("scripts/order_summary.R")
```

To build the HTML documentation, open `scripts/order_summary.Rmd` in RStudio and click **Knit**, or run:

```r
rmarkdown::render("scripts/order_summary.Rmd")
```

## Example Code

Summarising revenue and lead time by order type:

```r
library(dplyr)

orders %>%
  mutate(lead_time_days = as.integer(pickup_date - order_date)) %>%
  group_by(order_type) %>%
  summarise(
    n_orders      = n(),
    total_revenue = sum(price_cad),
    avg_lead_time = mean(lead_time_days),
    .groups = "drop"
  ) %>%
  arrange(desc(total_revenue))
```

## Outputs

| Output                                | Description                                       |
|---------------------------------------|---------------------------------------------------|
| `order_type_summary`                  | Orders, revenue, average price and lead time per order type |
| `monthly_summary`                     | Orders and revenue per month                      |
| `outputs/revenue_by_order_type.png`   | Bar chart of total revenue by order type          |

## Documentation

Full step-by-step documentation of the script, including inputs, outputs and code chunks, is in [`scripts/order_summary.Rmd`](scripts/order_summary.Rmd).

## License

This project is licensed under the [MIT License](LICENSE).

## Author

**May Elmady**
Data Analytics With Capstone, CDI College
BDA400 Data Science Tools and Techniques, Assignment 1

---

## AI Assistance Disclosure

**AI tool used:** Claude (Anthropic), model Opus 5.5, used on 26–27 October 2026 to help draft and format the README, the R Markdown file and the reflection wording.

**Main prompts given:**

1. "Explain what sections a good GitHub README for an R data analysis project should include."
2. "Revise the sections list so it's concise and uses Markdown headers and bullet formatting."
3. "Check the Markdown syntax for correctness and readability."
4. "Here's a summary of my R project: [summary]. Generate a professional README.md file using Markdown."
5. "Add sections for Installation, Example Code, and License. Keep tone concise and professional."
6. "Review the Markdown for syntax errors and suggest 2 improvements for clarity."
7. "Here's my R script description. Suggest Markdown formatting and code block examples."
8. "Add syntax highlighting and improve section organization (e.g., # Purpose, ## Inputs, ## Outputs)."
9. "Is the Markdown consistent with RMarkdown best practices?"

The full prompts and key responses are in [`docs/Appendix_AI_Prompts.md`](docs/Appendix_AI_Prompts.md).

**Changes I made after reviewing the outputs:**

- Replaced the generic example project with my own Toronto Cakes order scenario and synthetic dataset.
- Added a Table of Contents and a Dataset table after comparing with the tidyverse `dplyr` README.
- Added `text` as the language on the folder-tree block so GitHub does not try to highlight it.
- Indented the code blocks inside the numbered Installation list so the numbering does not restart.
- Removed a suggested "Contributing" section because this is a single-author course project.
- Ran the script myself and checked the summary totals against a SUMIF/COUNTIF/AVERAGEIF cross-check (`docs/Verification_CrossCheck.csv`); all totals match.
