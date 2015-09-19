#' Retrieve ASAM subregions polygons
#'
#' Returns the official ASAM Subregions polygons as a \code{SpatialPolygonsDataFrame}.
#'
#' There are 9 ASAM global regions and 52 ASAM global subregions. These
#' are referenced in \code{REGION} and \code{SUBREGION} fields in the
#' returned object.
#'
#' What is a region/subregion? The world is divided into nine regions;
#' each corresponding to the geographic limits of one of the nine regions in
#' the National Imagery and Mapping Agency (NIMA) Catalog of Hydrographic
#' Products.As shown in the graphic below, each Region is further divided
#' into numbered Subregions. The first digit of all five-digit chart numbers
#' indicates the geographic region while the first two digits of all five-digit
#' chart numbers refer to the geographic subregion.
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

