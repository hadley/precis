
<!-- README.md is generated from README.Rmd. Please edit that file -->
precis
======

[![Travis-CI Build Status](https://travis-ci.org/hadley/precis.svg?branch=master)](https://travis-ci.org/hadley/precis) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/precis)](https://cran.r-project.org/package=precis)

The precis package is designed to replace `base::summary()`

``` r
library(precis)

precis(mtcars)
#> data.frame [32 × 11] 
#> mpg  <dbl>  10.4 [ 15.4 ( 19.2)  22.8]  33.9
#> cyl  <dbl> 4 (11) 6 (7) 8 (14)
#> disp <dbl>  71.1 [121.0 (196.0) 334.0] 472.0
#> hp   <dbl>    52 [   96 (  123)   180]   335
#> drat <dbl>  2.76 [ 3.08 ( 3.70)  3.92]  4.93
#> wt   <dbl>  1.51 [ 2.54 ( 3.32)  3.65]  5.42
#> qsec <dbl>  14.5 [ 16.9 ( 17.7)  18.9]  22.9
#> vs   <dbl> 0 (18) 1 (14)
#> am   <dbl> 0 (19) 1 (13)
#> gear <dbl> 3 (15) 4 (12) 5 (5)
#> carb <dbl>     1 [    2 (    2)     4]     8

precis(ggplot2::diamonds)
#> A tibble: 53,940 × 10 
#> carat   <dbl>  0.20 [ 0.40 ( 0.70)  1.04]  5.01
#> cut     <ord> Fair (1610) Good (4906) Very Good (12082) Premium (13791) ...
#> color   <ord> D (6775) E (9797) F (9542) G (11292) ...
#> clarity <ord> I1 (741) SI2 (9194) SI1 (13065) VS2 (12258) ...
#> depth   <dbl>  43.0 [ 61.0 ( 61.8)  62.5]  79.0
#> table   <dbl>    43 [   56 (   57)    59]    95
#> price   <int>   326 [  950 ( 2400)  5320] 18800
#> x       <dbl>  0.00 [ 4.71 ( 5.70)  6.54] 10.70
#> y       <dbl>  0.00 [ 4.72 ( 5.71)  6.54] 58.90
#> z       <dbl>  0.00 [ 2.91 ( 3.53)  4.04] 31.80
```

Installation
------------

precis is not currently available on CRAN, but you can install it with:

``` r
# install.packages("devtools")
devtools::install_github("hadley/precis")
```
