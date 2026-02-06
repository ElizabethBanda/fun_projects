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
        All the inventory is sourced from clothing donations from GW community members. 
        Each year, the Office of Sustainability receives more than 25,000 pounds’ worth 
        of clothing donations — promoting reuse and reducing textile waste.",
        style="font-family:Arial; font-size:1.6rem; line-height:2; 
               max-width:1000px; margin:25px auto 0 auto;"
      )
    ),
    
    # ---- THREE-COLUMN BODY ----
    tags$div(
      style="display:flex; justify-content:space-around; align-items:flex-start;
             padding:50px; gap:40px; background-color:#F8F9FA; flex-wrap:wrap;",
      
      # Column 1 – Visitor Demographics inspired by relative abundance charts
      tags$div(
        style="flex:1; min-width:350px; background-color:white; border-radius:10px;
               padding:30px; box-shadow:0 4px 10px rgba(0,0,0,0.1);",
        tags$h2("Visits by Campus Demographics (2025)",
                style="text-align:center; color:#2C3E50; font-family:Arial; font-size:2rem;"),
        
        # iframe to keep layout intact
        tags$iframe(
          src="plots/p_monthly_interactive.html",
          style="width:100%; height:900px; border:none; border-radius:10px; box-shadow:0 2px 6px rgba(0,0,0,0.1);"
        ),
        
        tags$p(
          "This visualization illustrates the share of visits contributed by each campus demographic group throughout 2025. 
           Hover or click over each bar to see the exact number of visits for that demographic and month.",
          style="font-size:1.8rem; color:#2C3E50; line-height:1.8; margin-top:5px;"
        )
      ),
      
      # Column 2 – Clothing Flow inspired by circus plots
      tags$div(
  style="flex:1; min-width:350px; background-color:white; border-radius:10px;
         padding:30px; box-shadow:0 4px 10px rgba(0,0,0,0.1); text-align:center;",
  tags$h2("Clothing Flow",
          style="text-align:center; color:#2C3E50; font-family:Arial; font-size:2rem;"),

  # 
  tags$img(
    src = "images/final_3_circos.png",
    style = "display:block; margin:auto; width:90%; border:none;
             border-radius:10px; box-shadow:0 4px 8px rgba(0,0,0,0.1);"
  ),

  tags$p(
    "The circos diagram illustrates how different categories of clothing were exchanged at The Loop, 
     with arcs representing item types and connecting ribbons showing the flow of exchanges between them.",
    style="font-size:1.8rem; color:#2C3E50; line-height:1.8; margin-top:10px;"
        )
      ),
      
      # Column 3 – Visit Timing + Year-in-Review inspired by heat maping and dot plots
      tags$div(
        style="flex:1; min-width:350px; background-color:white; border-radius:10px;
               padding:25px; box-shadow:0 4px 10px rgba(0,0,0,0.1);",
        
        tags$h2("Popular Visit Time and Days",
                style="text-align:center; color:#2C3E50; font-family:Arial; 
                       font-size:2rem; margin-bottom:10px;"),
        
        # Interactive bubble chart as iframe
        tags$iframe(
          src="plots/top_slots_interactive.html",
          style="width:100%; height:600px; border:none; border-radius:10px; box-shadow:0 2px 6px rgba(0,0,0,0.1);"
        ),
        
        tags$p(
          "The bubble chart shows when visits to The Loop are most frequent across days of the week and times of day. 
           Larger, lighter bubbles indicate afternoon peak hours with the highest number of visits.",
          style="font-size:1.8rem; color:#2C3E50; line-height:1.8; margin-top:5px; margin-bottom:10px;"
        ),
        
       tags$div(
  style = "margin-top:10px; text-align:center;",
  tags$h3("Year in Review",
          style = "color:#2C3E50; font-family:'Arial Black',Arial; 
                   font-size:2rem; margin-bottom:10px;"),
  
  tags$table(
    style = "margin:auto; border-collapse:collapse; font-size:1.6rem; color:#2C3E50; width:90%;",
    
    # Centered header row
    tags$thead(
      tags$tr(
        tags$th("Category", style="border-bottom:3px solid #1E2A5E; padding:6px 20px; text-align:center;"),
        tags$th("Metric", style="border-bottom:3px solid #1E2A5E; padding:6px 20px; text-align:center;"),
        tags$th("Value", style="border-bottom:3px solid #1E2A5E; padding:6px 20px; text-align:center;")
      )
    ),
    
    tags$tbody(
      tags$tr(tags$td("Total Visits"), tags$td("Number of recorded visits"), tags$td("877")),
      tags$tr(tags$td("Average Experience Rating"), tags$td("Mean of all visitors"), tags$td("⭐ 4.8 / 5")),
      tags$tr(tags$td("Top Visitor Group"), tags$td("Demographic"), tags$td("Undergraduates (≈80%)")),
      tags$tr(tags$td("Donations"), tags$td("% of visits bringing donations"), tags$td("~30%")),
      tags$tr(tags$td("Most Exchanged Item Type"), tags$td("Category with most items"), tags$td("Tops (490 items)")),
      tags$tr(tags$td("Total Items Tracked"), tags$td("Sum across all categories"), tags$td("≈1,900 total pieces exchanged"))
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

# Save as index.html for GitHub Pages otherwise it will not generate.
htmltools::save_html(poster_layout, "index.html", background = "white")

# Preview locally before uploading
browseURL("index.html")
