% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/visualizations.R
\name{ff_plot_demo_line}
\alias{ff_plot_demo_line}
\title{Line Chart of Demographics}
\usage{
ff_plot_demo_line(
  data,
  demographic,
  y_axis_title,
  percent = F,
  dollar = F,
  color_palette = "Set 2"
)
}
\arguments{
\item{data}{Name of the dataframe with columns outlined above}

\item{demographic}{String in the `type` column that signifies the demographic}

\item{y_axis_title}{Title for y axis and tooltip}

\item{percent}{Boolean (TRUE / FALSE), whether estimate value is a percent; this will add percent labels to axis}

\item{dollar}{Boolean (TRUE / FALSE), whether estimate value is a dollar; this will add dollar labels to the axis}

\item{color_palette}{string representing the color palette to use, possible palettes are qualitative
palettes from the <a href="http://library http://colorspace.r-forge.r-project.org/reference/hcl_palettes.html">`colorspace` library</a>.}
}
\value{
line chart of the demographic for Forsyth County and all years
}
\description{
This function creates a line chart of the given demographic for Forsyth County.
}
\details{
The input dataset needs to have, at a minimum, columns of the following form and with the following names:
- year: year of the data
- geo_description: geography (needs Forsyth County as one of the geographies)
- type: general description of the demographic identifier (Race and Ethnicity, Total Population, etc)
- subtype: specific description of the demographic identifier (African American, Employment Rate, etc)
- estimate: value
}
\examples{
geographies <- c("Forsyth County, NC", "Guilford County, NC", "Durham County, NC",
                 "North Carolina", "United States")
years <- seq(2006, 2017, 1)

df <- data.frame(
    year = rep(years, each=length(geographies)),
    geo_description = rep(geographies, length(years)),
    type = "Total Population",
    subtype = "Employment Rate",
    stringsAsFactors = FALSE
)

df$estimate <- rnorm(nrow(df), mean = .5, sd = .15)

ff_plot_compare_line(data = df,
                    comparison_filter = "Total Population",
                    y_axis_title = "Employment Rate (\%)",
                    percent = T,
                    dollar = F,
                    geography_order = c("Forsyth County, NC", "Guilford County, NC", "Durham County, NC",
                                         "North Carolina", "United States"))
}
