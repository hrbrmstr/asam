<!-- README.md is generated from README.Rmd. Please edit that file -->
![](asam.png)

`asam` is an R package providing tools to access, download, update, process and visualize [Anti-shipping Activity Messages](http://msi.nga.mil/NGAPortal/MSI.portal?_nfpb=true&_pageLabel=msi_portal_page_65) (ASAM) Database Files

Anti-shipping Activity Messages (ASAM) include the locations and descriptive accounts of specific hostile acts against ships and mariners. The reports may be useful for recognition, prevention and avoidance of potential hostile activity. The 'asam' package provides a snapshot of the official ASAM database, utilities to update the local database and the official polygons defining the ASAM global regions and subregions.

The following functions are implemented:

-   `asam_refresh`: Refresh ASAM database
-   `asam_shp`: ASAM (Anti-shipping Activity Messages) Data (shapefile)
-   `asam_subregions`: Retrieve ASAM subregions polygons

The following data sets are included:

-   `data(asam_shp)` : Snapshot of the ASAM dataset
-   `system.file("geojson/asam.geojson", package="asam")` : Official ASAM regions & subregions shapefile

### News

-   Version 0.0.0.9000 released

### Installation

``` r
devtools::install_github("hrbrmstr/asam")
```

### Usage

``` r
library(asam)

# current verison
packageVersion("asam")
#> [1] '0.0.0.9000'
```

### Test Results

``` r
library(asam)
library(testthat)
library(sp)
library(ggplot2)
library(ggthemes)
#> Warning: replacing previous import by 'grid::arrow' when loading 'ggthemes'
#> Warning: replacing previous import by 'grid::unit' when loading 'ggthemes'
#> Warning: replacing previous import by 'scales::alpha' when loading 'ggthemes'

date()
#> [1] "Sat Sep 19 14:51:00 2015"
```

*See the subregion map*

``` r
subregions <- asam_subregions()
plot(subregions)
```

<img src="README-unnamed-chunk-6-1.png" title="" alt="" width="672" />

*Find all the incidents by pirates this year*

``` r
data(asam_shp)
pirates <- subset(asam_shp,
                  grepl("pirate", Aggressor, ignore.case=TRUE) &
                  format(DateOfOcc, "%Y") == "2015")
```

*and plot them*

``` r
subregions_map <- fortify(subregions)
#> Regions defined for each Polygons
world <- map_data("world")
pirate_pts <- data.frame(pirates)

gg <- ggplot()
gg <- gg + geom_map(data=world, map=world,
                    aes(x=long, y=lat, map_id=region),
                    color="black", fill="#e7e7e7", size=0.15)
gg <- gg + geom_map(data=subregions_map, map=subregions_map,
                    aes(x=long, y=lat, map_id=id),
                    color="white", fill="white", size=0.15, alpha=0)
gg <- gg + geom_point(data=pirate_pts, color="black", fill="yellow", 
                      aes(x=coords.x1, y=coords.x2), shape=21)
gg <- gg + xlim(-170, 170)
gg <- gg + ylim(-58, 75)
gg <- gg + coord_map("mollweide")
gg <- gg + theme_map()
gg <- gg + theme(panel.background=element_rect(fill="steelblue"))
gg
```

<img src="README-map-1.png" title="" alt="" width="960" />

``` r
test_dir("tests/")
#> testthat results ========================================================================================================
#> OK: 0 SKIPPED: 0 FAILED: 0
#> 
#> DONE
```

### Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
