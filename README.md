### This project creates an interactive poster that visualizes data from The Loop using genomics related plots.

- Please reach out to access original poster. If download does not format correctly.
  
The poster combines interactive charts, static plots, and summary tables to explore three key questions:
Who uses The Loop, when do they visit, and what do they exchange?

Below are the required packages. Make sure the following R packages are installed before running the code.
library(plotly)       # For interactive charts
library(ggplot2)      # For data visualization
library(htmltools)    # For HTML structure and layout
library(htmlwidgets)  # For embedding interactive plots

## Overview 
After generating your plots and static image the following code will assemble them into a three-column HTML poster layout.

Each column highlights a different dimension of The Loop’s data:
- Visitor Demographics: A Plotly bar chart showing visit patterns across campus groups.
- Clothing Flow: A Circos diagram visualizing clothing exchange patterns between item types.
- Visit Timing + Summary Table: A bubble chart for peak visit hours and a “Year in Review” summary.

## Notes on Design
- Uses accessible fonts (Arial and Arial Black) and high-contrast color palette (navy, gold, and white).
- Includes alt text–like descriptions for accessibility.
- Layout built with htmltools::tagList() for flexibility and modularity.

## The poster’s sections mirror a typical scientific visualization used in genomics and sustainability dashboards.

poster_layout <- browsable(
  tagList(
    # ---- TITLE BAR ----
    tags$div(
      style = "background-color:#1E2A5E; color:white; text-align:center;
               padding:60px 20px; border-bottom:4px solid #FFD700;",
      tags$h1("Exploring Sustainability through The Loop Clothing Exchange",
              style="font-family:'Arial Black',Arial; font-size:3.5rem; margin:0;"),
      tags$p(
        "The Loop is GW’s free clothing exchange store on the Mount Vernon Campus. 
        All inventory comes from clothing donations by GW community members, promoting reuse 
        and reducing textile waste. Each year, over 25,000 pounds of clothing are collected.",
        style="font-family:Arial; font-size:1.6rem; line-height:2; max-width:1000px; margin:25px auto 0 auto;"
      )
    ),
    
    # ---- THREE-COLUMN BODY ----
    tags$div(
      style="display:flex; justify-content:space-around; align-items:flex-start;
             padding:50px; gap:40px; background-color:#F8F9FA;",
      
      # Column 1 - Visitor Demographics
      tags$div(
        style="flex:1; background-color:white; border-radius:10px;
               padding:30px; box-shadow:0 4px 10px rgba(0,0,0,0.1);",
        tags$h2("Visits by Campus Demographics (2025)",
                style="text-align:center; color:#2C3E50; font-family:Arial; font-size:2rem;"),
        tags$div(style="height:900px; width:100%;", p_monthly_interactive),
        tags$p(
          "This visualization illustrates the share of visits contributed by each campus demographic group throughout 2025. 
           Hover over each bar to see the number of visits for that demographic and month.",
          style="font-size:2rem; color:#2C3E50; line-height:1.8; margin-top:5px;"
        )
      ),
      
      # Column 2 - Clothing Flow
      tags$div(
        style="flex:1; background-color:white; border-radius:10px;
               padding:30px; box-shadow:0 4px 10px rgba(0,0,0,0.1); text-align:center;",
        tags$h2("Clothing Flow",
                style="text-align:center; color:#2C3E50; font-family:Arial; font-size:2rem;"),
        tags$img(
          src="final_3_circos.png",
          style="display:block; margin:auto; width:90%; border:none;
                 border-radius:10px; box-shadow:0 4px 8px rgba(0,0,0,0.1);"
        ),
        tags$p(
          "The circos diagram illustrates exchange patterns between clothing types, 
           with arcs representing item categories and ribbons showing the flow of exchanges. 
           This type of visualization is commonly used in genomics to depict data relationships — here adapted for sustainability data.",
          style="font-size:2rem; color:#2C3E50; line-height:1.8; margin-top:10px;"
        )
      ),
      
      # Column 3 - Visit Timing + Summary
      tags$div(
        style="flex:1; background-color:white; border-radius:10px;
               padding:25px; box-shadow:0 4px 10px rgba(0,0,0,0.1);",
        tags$h2("Popular Visit Times and Days",
                style="text-align:center; color:#2C3E50; font-family:Arial; font-size:2rem; margin-bottom:10px;"),
        tags$div(style="height:600px; width:100%; margin-bottom:5px;", top_slots_interactive),
        tags$p(
          "The bubble chart shows when visits to The Loop are most frequent across days and times of day. 
           Larger, lighter bubbles indicate afternoon peaks with the highest traffic.",
          style="font-size:2rem; color:#2C3E50; line-height:1.8; margin-top:5px; margin-bottom:10px;"
        ),
        tags$div(
          style="margin-top:10px; text-align:center;",
          tags$h3("The Loop 2025: Year in Review",
                  style="color:#2C3E50; font-family:'Arial Black',Arial; font-size:2rem; margin-bottom:10px;"),
          tags$table(
            style="margin:auto; border-collapse:collapse; font-size:1.8rem; color:#2C3E50;",
            tags$thead(
              tags$tr(
                tags$th("Category", style="border-bottom:3px solid #1E2A5E; padding:6px 20px; text-align:left;"),
                tags$th("Metric", style="border-bottom:3px solid #1E2A5E; padding:6px 20px; text-align:left;"),
                tags$th("Value / Insight", style="border-bottom:3px solid #1E2A5E; padding:6px 20px; text-align:left;")
              )
            ),
            tags$tbody(
              tags$tr(tags$td("Total Visits"), tags$td("Recorded count"), tags$td("877")),
              tags$tr(tags$td("Average Rating"), tags$td("Mean visitor experience"), tags$td("⭐ 4.8 / 5")),
              tags$tr(tags$td("Top Visitor Group"), tags$td("Most frequent demographic"), tags$td("Undergraduates (~80%)")),
              tags$tr(tags$td("Donations"), tags$td("Visits including donations"), tags$td("~30%")),
              tags$tr(tags$td("Most Exchanged Item"), tags$td("Top clothing type"), tags$td("Tops (490 items)")),
              tags$tr(tags$td("Total Items Tracked"), tags$td("Sum across all categories"), tags$td("≈1,900 pieces"))
            )
          )
        )
      )
    ),
    
    # ---- FOOTER ----
    tags$div(
      style="background-color:#1E2A5E; color:white; text-align:center;
             padding:20px; font-family:Arial; font-size:1.2rem; line-height:1.6;",
      HTML("George Washington University Office of Sustainability<br>
           Poster created in R using <i>ggplot2</i>, <i>plotly</i>, <i>htmltools</i>, and <i>circlize</i>.")
    )
  )
)

## Output

Running this code produces an interactive HTML poster in your Viewer pane (or browser) featuring:
- Hover tooltips for interactivity
- A clean three-column layout
- Descriptive text and a summary table
  
### You can save the poster as an HTML file using:
htmltools::save_html(poster_layout, "loop_poster_three_grid.html")
