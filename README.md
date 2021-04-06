
<!-- README.md is generated from README.Rmd. Please edit that file -->

# droneland

<!-- badges: start -->

[![R-CMD-check](https://github.com/softloud/droneland/workflows/R-CMD-check/badge.svg)](https://github.com/softloud/droneland/actions)
<!-- badges: end -->

The goal of droneland is to calculate the area of land captured by a
drone image.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("softloud/droneland")
```

## Example

Suppose we have a drone image of 7952 x 5304 pixels taken from 200
metres with a camera angled at 25 degrees with a vertical field of view
of 38 degrees and a horizontal field of view of 54 degrees. Then the
area of land captured, in metres, is

``` r
library(droneland)

drone_image_area(
  camera_angle = 25,
  vertical_fov = 38,
  horizontal_fov = 44,
  height = 200,
  pixel_row = 7952,
  pixel_col = 5304
)
#> [1] 4250.316
```

## Diagrams of angles and derivations

Check [my derivations](https://www.overleaf.com/read/twnpsndycrgw),
please and thank you :)

In the derivations there are diagrams to check what angles to input.
