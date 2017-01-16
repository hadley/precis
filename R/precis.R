#' Display a succinct summary of a data frame
#'
#' @param x A tabular structure like a data frame.
#' @inheritParams precis_v
#' @export
#' @examples
#' precis(mtcars)
#' precis(mtcars, histogram = TRUE)
precis <- function(x, ..., width = 60) {
  UseMethod("precis")
}

#' @export
precis.data.frame <- function(x, ..., width = 60) {
  out <- tibble::tibble(
    name = names(x),
    type = vapply(x, tibble::type_sum, character(1)),
    precis = vapply(x, precis_v, ..., FUN.VALUE = character(1))
  )
  attr(out, "obj_sum") <- tibble::obj_sum(x)
  class(out) <- c("precis", "tbl_df", "tbl", "data.frame")
  out
}

globalVariables(".")

#' @export
precis.grouped_df <- function(x, ..., width = 60) {
  out <- dplyr::do(x, precis(., ..., width = width))
  out <- dplyr::ungroup(out)
  out <- dplyr::arrange_(out, ~name)
  out <- dplyr::select_(out, ~name, ~dplyr::everything())

  attr(out, "obj_sum") <- tibble::obj_sum(x)
  class(out) <- c("precis", "tbl_df", "tbl", "data.frame")
  out
}

#' @export
print.precis <- function(x, ...) {
  cat("# ", attr(x, "obj_sum"), "\n", sep = "")

  tm <- tibble::trunc_mat(x, n = Inf)
  print(tm$table)

  invisible(x)
}
