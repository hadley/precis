#' Display a succinct summary of a data frame
#'
#' @param x A tabular structure like a data frame.
#' @inheritParams precis_v
#' @export
#' @examples
#' precis(mtcars)
precis <- function(x, ..., width = 60) {
  UseMethod("precis")
}

#' @export
precis.data.frame <- function(x, ..., width = 60) {
  precis <- lapply(x, precis_v, ...)
  names <- format(str_trunc(names(x), 20))
  types <- paste0("<", vapply(x, tibble::type_sum, character(1)), ">")

  add_blanks <- function(x, n) {
    c(x, rep("", n - 1))
  }
  lengths <- vapply(precis, length, integer(1))
  names <- unlist(Map(add_blanks, names, lengths))

  cat(paste0(names, " ", types, " ", unlist(precis), "\n"), sep = "")
  invisible(x)
}
