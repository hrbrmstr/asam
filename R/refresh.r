#' @title Refresh ASAM database
#'
#' The \code{asam} pacakge comes with a snapshot of the official ASAM
#' database. This database is updated daily by the National Geospatial-Intelligence
#' Agency (NGIA) and this function provides a simple means to refresh it.
#'
#' @description \code{asam_refresh} will fetch the latest (the files are udated daily)
#'              ASAM shapefile database and overwrite the one installed with the package
#'              (or previously updated).
#' @return (invisible) \code{TRUE} or \code{FALSE} depending on the success of
#'         the retrieval.
#' @export
#' @rdname asam_refresh
#' @examples \dontrun{
#' asam_refresh()
#' }
asam_refresh <- function() {

  tryCatch({

    tmp_f <- tempfile("asam", fileext=".zip")
    on.exit({ unlink(tmp_f) })
    message("Refreshing ASAM database...")
    download.file("http://msi.nga.mil/MSISiteContent/StaticFiles/Files/ASAM_shp.zip",
                  tmp_f, quiet=TRUE)
    extr_f <- unzip(tmp_f, overwrite=TRUE, exdir=dirname(tmp_f))
    layer <- gsub("\\..*$", "", basename(extr_f[1]))

    asam_shp <- rgdal::readOGR(grep("shp", extr_f, value=TRUE),
                               layer, stringsAsFactors=FALSE, verbose=FALSE)

    asam_shp@data$DateOfOcc <- as.Date(asam_shp@data$DateOfOcc, "%Y/%m/%d")

    save(asam_shp, file=system.file("data/asam_shp.rda", package="asam"),
         compress = 'xz')

    asam_sf <- sf::read_sf(grep("shp", extr_f, value=TRUE), quiet=TRUE)

    save(asam_sf, file=system.file("data/asam_sf.rda", package="asam"),
         compress = 'xz')

    invisible(TRUE)

  }, error=function(err) {
    warning("ASAM database refresh unsuccessful.")
    invisible(FALSE)
  })

}
