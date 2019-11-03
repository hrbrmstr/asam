.read_asam <- function(quiet = FALSE) {

  if (!quiet) message("Reading ASAM database (this may take a while)")
  res <- httr::GET("https://msi.nga.mil/api/publications/asam?filter=none&sort=date&output=xml")
  httr::stop_for_status(res)
  out <- readBin(httr::content(res, as = "raw", encoding = "UTF-8"), "character")
  out <- gsub("[^\u0009\u000a\u000d\u0020-\uD7FF\uE000-\uFFFD]", "", out)
  out <- XML::xmlParse(out)
  out <- XML::xmlToDataFrame(out, stringsAsFactors=FALSE)
  out[["date"]] <- as.Date(out[["date"]])
  out[["latitude"]] <- as.numeric(out[["latitude"]])
  out[["longitude"]] <- as.numeric(out[["longitude"]])
  class(out) <- c("tbl_df", "tbl", "data.frame")
  out

}

#' @title Read ASAM database
#'
#' The ASAM database is updated daily by the National Geospatial-Intelligence
#' Agency (NGIA) and this function provides a simple means to download it.
#'
#' @param quiet if `TRUE` no messages
#' @export
#' @rdname read_asam
#' @examples \dontrun{
#' read_asam()
#' }
read_asam <- memoise::memoise(.read_asam)
