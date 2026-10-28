# AI Assistance Declaration: I used Claude (Anthropic, Opus 5.5, 26 Oct 2026) for
# layout suggestions, comment wording and code-structure ideas. Prompts used: see
# docs/Appendix_AI_Prompts.md. I verified outputs by running the script myself in
# RStudio/Posit Cloud and cross-checking totals in Google Sheets. All final
# calculations are done by myself. I am responsible for the accuracy and
# originality of this work.

# -----------------------------------------------------------------------------
# order_summary.R
# Purpose : Summarise Toronto Cakes (synthetic) custom-cake orders by order type
#           and by month, and plot revenue by order type.
# Input   : data/cake_orders_synthetic.csv
# Outputs : order_type_summary (tibble), monthly_summary (tibble),
#           outputs/revenue_by_order_type.png
# Author  : May Elmady
# -----------------------------------------------------------------------------

library(readr)
library(dplyr)
library(lubridate)
library(ggplot2)

# 1. Load the data ------------------------------------------------------------
orders <- read_csv(
  "data/cake_orders_synthetic.csv",
  col_types = cols(
    order_date  = col_date(),
    pickup_date = col_date(),
    tiers       = col_integer(),
    servings    = col_integer(),
    price_cad   = col_double(),
    .default    = col_character()
  )
)

# 2. Add helper columns -------------------------------------------------------
orders <- orders %>%
  mutate(
    lead_time_days  = as.integer(pickup_date - order_date),
    price_per_serve = price_cad / servings,
    order_month     = floor_date(order_date, unit = "month")
  )

# 3. Summary by order type ----------------------------------------------------
order_type_summary <- orders %>%
  group_by(order_type) %>%
  summarise(
    n_orders          = n(),
    total_revenue     = sum(price_cad),
    avg_price         = mean(price_cad),
    avg_lead_time     = mean(lead_time_days),
    avg_price_per_srv = mean(price_per_serve),
    .groups = "drop"
  ) %>%
  arrange(desc(total_revenue))

# 4. Summary by month ---------------------------------------------------------
monthly_summary <- orders %>%
  group_by(order_month) %>%
  summarise(
    n_orders      = n(),
    total_revenue = sum(price_cad),
    .groups = "drop"
  )

# 5. Plot revenue by order type -----------------------------------------------
revenue_plot <- ggplot(order_type_summary,
                       aes(x = reorder(order_type, total_revenue),
                           y = total_revenue)) +
  geom_col(fill = "#C97B84") +
  coord_flip() +
  labs(
    title = "Toronto Cakes: Revenue by Order Type (synthetic data)",
    x     = "Order type",
    y     = "Total revenue (CAD)"
  ) +
  theme_minimal()

dir.create("outputs", showWarnings = FALSE)
ggsave("outputs/revenue_by_order_type.png", revenue_plot, width = 7, height = 4)

print(order_type_summary)
print(monthly_summary)
