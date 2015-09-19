#' @title Refresh ASAM database
#' @description \code{asam_refresh} will fetch the latest (the files are udated daily)
#'              ASAM shapefile database and overwrite the one installed with the package
#'              (or previously updated).
#' @export
#' @rdname asam_refresh
asam_refresh <- function() {

  tmp_f <- tempfile("asam", fileext=".zip")
  download.file("http://msi.nga.mil/MSISiteContent/StaticFiles/Files/ASAM_shp.zip",
                tmp_f)
  extr_f <- unzip(tmp_f, overwrite=TRUE, exdir=dirname(tmp_f))
  layer <- gsub("\\..*$", "", basename(extr_f[1]))

  asam_shp <- readOGR(grep("shp", extr_f, value=TRUE), layer, stringsAsFactors=FALSE)

  save(asam_shp, file=system.file("data/asam_shp.rda",
                                  package="asam"),
       compress = 'xz')

  invisible(TRUE)

}

#' @title ASAM (Anti-shipping Activity Messages) Data (shapefile)
#' @description This dataset contains data from the National Geospatial
#'              Intelligence Acency's Anti-shipping Activity Messages (ASAM)
#'              database. This include the locations and descriptive accounts
#'              of specific hostile acts against ships and mariners. The reports
#'              may be useful for recognition, prevention and avoidance of
#'              potential hostile activity.
#'
#' \itemize{
#'   \item \code{Reference}: ASAM Reference Number
#'   \item \code{DateOfOcc}: Date of incident occurrence
#'   \item \code{SubReg}: Geographical Subregion. See
#'         \url{http://fas.org/irp/world/para/docs/geol_geo.htm} for a map of
#'         the boundaries for these locations or the \code{\link{asam_subregions}}
#'         function in this package.
#'   \item \code{Aggressor}: Who was the aggressor
#'   \item \code{Descript}: Description of the anti-shipping activity
#'   \item \code{Desc1}: Description of the anti-shipping activity
#'   \item \code{Desc2}: Description of the anti-shipping activity
#'   \item \code{Desc3}: Description of the anti-shipping activity
#'   \item \code{Desc4}: Description of the anti-shipping activity
#'   \item \code{Desc5}: Description of the anti-shipping activity
#'   \item \code{Desc6}: Description of the anti-shipping activity
#' }
#' @docType data
#' @keywords datasets
#' @name asam_shp
#' @seealso \code{\link{asam_refresh}} for updating the dataset,
#' @references \href{http://msi.nga.mil/NGAPortal/MSI.portal?_nfpb=true&_pageLabel=msi_portal_page_65}{ASAM home}
#' @usage data(asam_shp)
#' @note Last updated 2015-07-31
#' @format A \code{SpatialPointsDataFrame} with 12 variables and 7,107 observations
NULL
