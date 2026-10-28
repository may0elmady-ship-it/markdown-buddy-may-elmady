> **AI Assistance Declaration:** I used Claude (Anthropic, Opus 5.5, 26–27 Oct 2026) to help draft and format my README, R Markdown file and the wording of this reflection, and to suggest structure. Prompts used: see [`docs/Appendix_AI_Prompts.md`](docs/Appendix_AI_Prompts.md). I verified outputs using GitHub's Markdown preview, a comparison with the tidyverse `dplyr` README, knitting the `.Rmd` file, and a SUMIF/COUNTIF/AVERAGEIF cross-check of the summary totals in Google Sheets. All final calculations are done by myself. I am responsible for the accuracy and originality of this work.

# Reflection: AI-Assisted Documentation

**Student:** May Elmady
**Course:** BDA400 Data Science Tools and Techniques
**Assignment:** Assignment 1 – Markdown Buddy

## 1. How did the AI tool support your documentation process?

Before this assignment I never had a GitHub account. I made one for this project, so for me the hardest part was not the R code. It was knowing what a "good" README even looks like. The AI gave me a list of sections in a few seconds, and then the refinement prompt turned it into a clean outline with `##` headers. I used that outline like a recipe card: I knew what goes first and what comes after.

My project is about my own cake business, Toronto Cakes. Most of my orders come to me as Instagram DMs, and I usually track them in my head or in my notes app. The AI did not know any of this. Its first draft was about a general "sales analysis". I had to tell it the real questions I have as a business owner: which cakes bring the most money, how early customers book a wedding cake compared to a birthday cake, and which months are busy. After I gave it this context, the README started to sound like my project and not like a template.

The AI was also useful as a second pair of eyes for formatting. It told me that the code blocks inside my numbered Installation list must be indented, or GitHub will restart the numbers from 1. It also reminded me to add `eval = FALSE` to the `install.packages()` chunk in the `.Rmd`, so knitting does not reinstall everything every time. I would not have known these small rules by myself.

## 2. What were the strengths and weaknesses of using AI for this task?

**Strengths**

- **It saved time.** As a mom of four with a business and school at the same time, getting a first draft fast is a big help. I could spend my time checking and fixing instead of starting from an empty page.
- **It explained the "why".** When I asked about R Markdown best practices, it did not only fix the file. It explained why the `setup` chunk is hidden and why `root.dir` matters when the file is inside the `scripts/` folder.
- **Step-by-step improvement.** The seed, refinement and critique prompts worked like tasting a cake batter: each round I fixed one thing and the result got better.

**Weaknesses**

- **It does not know my data.** It can write a nice sentence like "revenue increased", but it cannot know if that is true. Only my R output and my own check can tell me that.
- **It cannot see the real result.** The AI said the Markdown "looks correct", but I only trusted it after I saw the README on GitHub and the knitted `.Rmd`.
- **Small details can break things.** When I prepared my cross-check file for Google Sheets, I noticed that a month value like `2026-01` can be changed into a date automatically, and then `COUNTIF` does not match. I changed the labels to `2026_01` so they stay as text. This kind of problem only shows up when you actually test the file, not when you read AI text.
- **It adds things I do not need.** It suggested a "Contributing" section, but this is a one-person school project, so I removed it.

## 3. How did you use AI ethically, and how did you verify its output?

My customers trust me with their names, phone numbers and party details in my DMs, so privacy is very important to me. I did **not** give the AI any real customer information. My dataset is 20 synthetic orders that I created with realistic cake types, prices and dates, and the README clearly says the data is synthetic.

I was also open about my AI use. Every file starts with the AI Assistance Declaration, the README ends with an AI Assistance Disclosure section, and all my prompts and the key responses are in `docs/Appendix_AI_Prompts.md`. I did not let the AI do the math. The numbers come from my R script, and I used the AI only for structure, formatting and wording.

To verify, I followed the verification pattern from the course:

1. **Primary calculation:** I ran `order_summary.R` to get revenue, order counts and lead times by order type and by month.
2. **Independent cross-check:** I opened `docs/Verification_CrossCheck.csv` in Google Sheets, where `SUMIF`, `COUNTIF` and `AVERAGEIF` formulas calculate the same totals. Everything matched: 20 orders and $7,215 in total, with Wedding cakes at $4,870.
3. **Spot-check:** I added the five Wedding orders by hand from the CSV (780 + 1,150 + 890 + 760 + 1,290 = 4,870) to be sure.
4. **Preview:** I checked the README on GitHub and knitted the `.Rmd` to make sure headers, tables, code chunks and the chart all show correctly.

What I learned is that AI is a good assistant, like a helper in the kitchen, but I am still the baker. I decide what goes in, I taste it, and I am the one who puts my name on it.
