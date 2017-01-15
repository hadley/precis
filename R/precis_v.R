#' Succint summary of a vector
#'
#' @param x A vector
#' @param ... Other arguments potentially used by methods
#' @param width Maximum width for each line.
#' @return A character vector, with one entry for each line.
#' @export
#' @keywords internal
#' @examples
#' precis_v(mtcars[[1]])
precis_v <- function(x, ..., width = 60) {
  UseMethod("precis_v")
}

#' @export
precis_v.numeric <- function(x, ..., width = 60) {
  if (n_distinct(x) < 5) {
    return(show_distinct(x))
  }

  sum <- format(signif(stats::fivenum(x[is.finite(x)]), 3), width = 5)

   paste0(
    sum[1], " [", sum[2], " (", sum[3], ") ", sum[4], "] ", sum[5],
    n_na(x),
    n_inf(x)
   )
}

#' @export
precis_v.logical <- function(x, ..., width = 60) {
  show_distinct(x)
}

show_distinct <- function(x) {
  tbl <- table(x, useNA = "ifany")
  paste0(str_trunc(names(tbl), 20), " (", tbl, ")", collapse = " ")
}

n_na <- function(x) {
  n <- sum(is.na(x))
  if (n == 0)
    return("")

  paste0(" (", n, " NA)")
}

n_inf <- function(x) {
  n <- sum(is.infinite(x))

  if (n == 0)
    return("")

  paste0(" (", n, " Inf)")
}
