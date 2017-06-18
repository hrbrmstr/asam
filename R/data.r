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
#'   \item \code{DateOfOcc}: Date of incident occurrence (a \code{Date} object)
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
#' @note Last updated 2017-06-17
#' @format A \code{SpatialPointsDataFrame} with 12 variables and 7,767 observations
NULL


#' @title ASAM (Anti-shipping Activity Messages) Data (simple features)
#' @description This dataset contains data from the National Geospatial
#'              Intelligence Acency's Anti-shipping Activity Messages (ASAM)
#'              database. This include the locations and descriptive accounts
#'              of specific hostile acts against ships and mariners. The reports
#'              may be useful for recognition, prevention and avoidance of
#'              potential hostile activity.
#'
#' \itemize{
#'   \item \code{Reference}: ASAM Reference Number
#'   \item \code{DateOfOcc}: Date of incident occurrence (a \code{Date} object)
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
#' @name asam_sf
#' @seealso \code{\link{asam_refresh}} for updating the dataset,
#' @references \href{http://msi.nga.mil/NGAPortal/MSI.portal?_nfpb=true&_pageLabel=msi_portal_page_65}{ASAM home}
#' @usage data(asam_sf)
#' @note Last updated 2017-06-18
#' @format A simple feature collection with 7,767 features and 12 fields
NULL
