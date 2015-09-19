#' Retrieve ASAM subregions polygons
#'
#' Returns the official ASAM Subregions polygons as a \code{SpatialPolygonsDataFrame}.
#'
#' There are 9 ASAM global regions and 52 ASAM global subregions. These
#' are referenced in \code{REGION} and \code{SUBREGION} fields in the
#' returned object.
#'
#' @return \code{SpatialPolygonsDataFrame}
#' @export
#' @examples
#' subregions <- asam_subregions()
#' plot(subregions)
asam_subregions <- function() {

  readOGR(system.file("geojson/asam.geojson", package="asam"),
          "OGRGeoJSON", stringsAsFactors=FALSE, verbose=FALSE)

}

