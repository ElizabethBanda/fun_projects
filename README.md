### This project creates an interactive poster that visualizes data from The Loop using genomics related plots.

view the poster: https://elizabethbanda.github.io/fun_projects/
  
The poster combines interactive charts, static plots, and summary tables to explore three key questions:
Who uses The Loop, when do they visit, and what do they exchange?

Below are the required packages before running the code.  
library(plotly)       # For interactive charts  
library(ggplot2)      # For data visualization  
library(htmltools)    # For HTML structure and layout  
library(htmlwidgets)  # For embedding interactive plots  

## Overview 
The following R script code will assemble the images into a three-column HTML poster layout.

Each column highlights a different dimension of The Loop’s data:
- Visitor Demographics: A microbiome inspired abundance chart showing visit patterns across campus groups.
- Clothing Flow: A Circos diagram visualizing clothing exchange patterns between item types.
- Visit Timing + Summary Table: A bubble chart with heat map color scheme for peak visit hours and a “Year in Review” summary.

## Notes on Design
- Uses accessible fonts (Arial and Arial Black) and high-contrast color palettes.
- Includes alt text–like descriptions for accessibility.
- Layout built with htmltools::tagList() for flexibility and modularity.

## Output

Running this code produces an interactive HTML poster in your Viewer pane (or browser) featuring:
- Hover tooltips for interactivity
- A clean three-column layout
- Descriptive text and a summary table
  
### A template can be found in this repository.
