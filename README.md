
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Signed
by](https://img.shields.io/badge/Keybase-Verified-brightgreen.svg)](https://keybase.io/hrbrmstr)
![Signed commit
%](https://img.shields.io/badge/Signed_Commits-100%25-lightgrey.svg)
[![Linux build
Status](https://travis-ci.org/hrbrmstr/asam.svg?branch=master)](https://travis-ci.org/hrbrmstr/asam)
[![Coverage
Status](https://codecov.io/gh/hrbrmstr/asam/branch/master/graph/badge.svg)](https://codecov.io/gh/hrbrmstr/asam)
![Minimal R
Version](https://img.shields.io/badge/R%3E%3D-3.2.0-blue.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

![](asam.png)

# asam

Read and work with Anti-shipping Activity Messages (ASAM) database files

## Description

Anti-shipping Activity Messages (‘ASAM’) include the locations and
descriptive accounts of specific hostile acts against ships and
mariners. The reports may be useful for recognition, prevention and
avoidance of potential hostile activity. Tools are provided to download
the official ‘ASAM’ database along with a geojson version of the
official polygons defining the ‘ASAM’ global regions and subregions.
Data is from <https://msi.nga.mil/Piracy>

## What’s Inside The Tin

The following functions are implemented:

  - `asam_subregions`: Retrieve ASAM subregions polygons
  - `read_asam`: Read ASAM database The ASAM database is updated daily
    by the National Geospatial-Intelligence Agency (NGIA) and this
    function provides a simple means to download it.

## Installation

``` r
remotes::install_git("https://git.rud.is/hrbrmstr/asam.git")
# or
remotes::install_git("https://git.sr.ht/~hrbrmstr/asam")
# or
remotes::install_gitlab("hrbrmstr/asam")
# or
remotes::install_bitbucket("hrbrmstr/asam")
# or
remotes::install_github("hrbrmstr/asam")
```

NOTE: To use the ‘remotes’ install options you will need to have the
[{remotes} package](https://github.com/r-lib/remotes) installed.

## Usage

``` r
library(asam)

# current version
packageVersion("asam")
## [1] '0.2.0'
```

``` r
library(asam)
library(tidyverse)

date()
## [1] "Mon Nov  4 07:57:06 2019"
```

*See the subregion map*

``` r
subregions <- asam_subregions()

subregions
## Simple feature collection with 58 features and 6 fields
## geometry type:  POLYGON
## dimension:      XY
## bbox:           xmin: -180 ymin: -90 xmax: 180 ymax: 90
## epsg (SRID):    4326
## proj4string:    +proj=longlat +datum=WGS84 +no_defs
## First 10 features:
##    OBJECTID ID SUBREGION REGION Shape_Leng Shape_Area                       geometry
## 1         1  1        83      8  275.90637 4513.12768 POLYGON ((-180 -26.98819, -...
## 2         2  2        19      1  144.08198 1216.84278 POLYGON ((-180 17.9181, -18...
## 3         3  3        17      1   66.67966  248.73010 POLYGON ((-150 45, -150 52,...
## 4         4  4        18      1  116.55910  692.64299 POLYGON ((-123.4279 50.3571...
## 5         5  5        21      2  123.27130  672.56328 POLYGON ((-116 32.75, -105....
## 6         6  6        28      2   70.84287  180.14091 POLYGON ((-105.4171 28.9852...
## 7         7  7        27      2   25.87120   37.47341 POLYGON ((-86 23.5, -79.600...
## 8         8  8        11      1  107.27366  504.85999 POLYGON ((-116 32.75, -107....
## 9         9  9        26      2   80.53508  219.35296 POLYGON ((-74.25001 32.9353...
## 10       10 10        25      2   89.06587  450.16167 POLYGON ((-64.00001 34.7272...

suppressWarnings(plot(select(subregions, geometry)))
```

<img src="man/figures/README-subregions-1.png" width="672" />

*Find all the incidents by pirates this year*

``` r
asam <- read_asam()

asam
## # A tibble: 7,843 x 9
##    reference date       latitude longitude navArea subreg hostility      victim    description                          
##    <chr>     <date>        <dbl>     <dbl> <chr>   <chr>  <chr>          <chr>     <chr>                                
##  1 2019-73   2019-09-30     1.04    104.   XI      71     Five Armed ro… Bulk Car… , SINGAPORE STRAITS. DECK CREW ON RO…
##  2 2019-72   2019-09-28     5.33    120.   XI      92     Two High-spee… Bulk Car… AROUND 12NM NW OF TAWI-TAWI ISLAND, …
##  3 2019-75   2019-09-23     6.28      3.23 II      57     <NA>           <NA>      On September 23rd a duty watchman on…
##  4 2019-74   2019-09-23     5.46    119.   XI      72     Seven people … two fish… TWO FISHING BOATS SAILED TOWARDS TAM…
##  5 2019-76   2019-09-16     9.42    -13.7  II      51     Four armed ro… Tanker    On September 16th four robbers armed…
##  6 2019-71   2019-07-21     2.92    105.   XI      71     PIRATES        BULK CAR… INDONESIA: On 21 July, seven pirates…
##  7 2019-70   2019-07-21     8.47    -13.5  II      51     ROBBERS        CONTAINE… SIERRA LEONE: On 21 July, five robbe…
##  8 2019-68   2019-07-16     1.17    104.   XI      71     ROBBERS        TUG       INDONESIA: On 16 July, robbers board…
##  9 2019-69   2019-07-13     9.59    -79.5  IV      26     PIRATES        PLEASURE… PANAMA: On 13 July, a monohull with …
## 10 2019-67   2019-07-13     2.97      4.67 II      57     PIRATES        CARGO SH… NIGERIA: On 13 July, pirates boarded…
## # … with 7,833 more rows

filter(asam, grepl("pirate", hostility, ignore.case=TRUE), lubridate::year(date) == lubridate::year(Sys.Date())) 
## # A tibble: 31 x 9
##    reference date       latitude longitude navArea subreg hostility victim     description                              
##    <chr>     <date>        <dbl>     <dbl> <chr>   <chr>  <chr>     <chr>      <chr>                                    
##  1 2019-71   2019-07-21   2.92      105.   XI      71     PIRATES   BULK CARR… INDONESIA: On 21 July, seven pirates arm…
##  2 2019-69   2019-07-13   9.59      -79.5  IV      26     PIRATES   PLEASURE … PANAMA: On 13 July, a monohull with two …
##  3 2019-67   2019-07-13   2.97        4.67 II      57     PIRATES   CARGO SHIP NIGERIA: On 13 July, pirates boarded the…
##  4 2019-65   2019-07-01  12.9        43.2  IX      62     PIRATES   MERCHANT … RED SEA: On 1 July, a merchant vessel un…
##  5 2019-57   2019-06-03   4.23        7.1  II      57     PIRATES   SPEEDBOATS NIGERIA: On 3 June, five Port Harcourt-b…
##  6 2019-56   2019-05-31   0.0500    -51.0  V       24     PIRATES   BULK CARR… BRAZIL: On 31 May, six persons armed wit…
##  7 2019-46   2019-05-12   6.00        1.27 II      57     PIRATES   CHEMICAL … TOGO: On 12 May, armed persons boarded a…
##  8 2019-53   2019-05-05   3.          7.83 II      57     PIRATES   SEMI-SUB … EQUATORIAL GUINEA: On 5 May, the semi-su…
##  9 2019-52   2019-05-05   3.07        7.98 II      57     PIRATES   TUG BOAT   EQUATORIAL GUINEA: On 5 May, pirates hij…
## 10 2019-40   2019-04-24  -0.483      48.6  VIII    61     Pirates   Multiple … INDIAN OCEAN: On 21 April, fishing vesse…
## # … with 21 more rows
```

## asam Metrics

| Lang | \# Files |  (%) | LoC | (%) | Blank lines |  (%) | \# Lines |  (%) |
| :--- | -------: | ---: | --: | --: | ----------: | ---: | -------: | ---: |
| R    |        5 | 0.83 |  26 | 0.6 |           7 | 0.21 |       52 | 0.58 |
| Rmd  |        1 | 0.17 |  17 | 0.4 |          26 | 0.79 |       37 | 0.42 |

## Code of Conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.
