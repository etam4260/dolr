
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dolr

<!-- badges: start -->

[![Project Status: WIP - Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![R-CMD-check](https://github.com/etam4260/dolr/workflows/R-CMD-check/badge.svg)](https://github.com/etam4260/dolr/actions)
[![Codecov test
coverage](https://codecov.io/gh/etam4260/dolr/branch/main/graph/badge.svg)](https://codecov.io/gh/etam4260/dolr?branch=main)
[![cran
version](https://www.r-pkg.org/badges/version/dolr)](https://cran.r-project.org/package=dolr)
[![cran
checks](https://cranchecks.info/badges/worst/dolr)](https://cranchecks.info/pkgs/dolr)
[![rstudio mirror
downloads](https://cranlogs.r-pkg.org/badges/dolr?color=C9A115)](https://github.com/r-hub/cranlogs.app)
<!-- badges: end -->

![](https://github.com/etam4260/dolr/blob/main/man/figures/DOL.png?raw=true)

This package contains an interface to the US Department of Labor API in
R. The goal of this project is to provide an easy to use interface to
access various open source datasets provided by the DOL. The DOL is an
overarching department with various agencies under it. For example, one
of the most popular, the Bureau of Labor Statistics (BLS).

Although there already exists an R package for the BLS, this provides
datasets under the oversight of the DOL.

The US Department of Labor provides a web API located at
<https://developer.dol.gov/beginner/> where this library will pull data
from.

## Available Data

The APIs and datasets which this library interfaces with:

1.  Health and Safety
    -   Injuries and Illness
    -   Gulf Oil Spill
    -   DOL OSHA Compliance
    -   MSHA Employment Production
    -   Mine Violation
    -   Fatal Occupational Injuries
    -   DOL OSHA Enforcement
    -   Auto Workers
    -   Safety and Health
    -   Full Mine Information
    -   Basic Mine Information
    -   Mine Accident Injuries
    -   Mine Inspections
2.  Wage and Hour Divisions
    -   Farm Labor Contractor and Farm Labor
    -   Contractor Employee
    -   Wage and Hour Publication System
    -   WHD Compliance
3.  Expanding Growth Opportunities and Learning
    -   OIT Initial Claims
    -   OUI Initial Claims V1
    -   IPIA V1
    -   Quarterly Census Employment and Wage (CEW) V1
    -   Occupational Employment Statistics Survey (OES) V1
    -   Current Population Survey (CPS) V1
    -   Current Employment Statistics (CES) V1
    -   Consumer Price Indexes (CPI) V1
    -   2010 Workforce Investment Act V1
    -   2010 Occupational Employment Statistics V1
    -   BLS Numbers V1
4.  Other Datasets
    -   Sweat and Toil
    -   VETS4212
    -   VETS100
    -   API Metrics (per key)
    -   Research And Evaluation Inventory
    -   Geography
    -   Form
    -   Frequently Asked Questions (FAQ)
    -   API Metadata
    -   Agency

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("etam4260/dolr")
```

For more details on how to setup and utilize this package. Please go to
<https://etam4260.github.io/dolr/>. Select ???Setup??? in the navigation
bar.

## Contributors

-   Emmet Tam(<https://github.com/etam4260>)

## Disclaimers

-   This interface uses the DOL API but is not endorsed or certified by
    the DOL.
-   This is a WIP so please report any issues or bugs to:
    <https://github.com/etam4260/dolr/issues>
-   License: MIT
-   To get citation information for dolr in R, type citation(package =
    ???dolr???)
-   This is open source, so please fork and introduce some pull
    requests!
