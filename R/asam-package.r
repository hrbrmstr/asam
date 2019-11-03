#' Read and work with Anti-shipping Activity Messages (ASAM) database files
#'
#' Anti-shipping Activity Messages ('ASAM') include the locations and
#' descriptive accounts of specific hostile acts against ships and mariners.
#' The reports may be useful for recognition, prevention and avoidance of
#' potential hostile activity. Tools are provided to download the official 'ASAM'
#' database along with a geojson version of the official polygons defining the
#' 'ASAM' global regions and subregions. Data is from <https://msi.nga.mil/Piracy>
#'
#' @md
#' @name asam
#' @docType package
#' @author Bob Rudis (bob@@rud.is)
#' @import sf
#' @importFrom memoise memoise
#' @importFrom httr GET content
#' @importFrom XML xmlParse xmlToDataFrame
#' @importFrom utils download.file unzip
"_PACKAGE"
