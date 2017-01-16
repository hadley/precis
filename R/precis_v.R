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
precis_v.numeric <- function(x, ..., histogram = FALSE, width = 60) {

  if (!histogram && n_distinct(x) < 5) {
    return(show_distinct(x))
  }

  x_finite <- x[is.finite(x)]
  if (histogram) {
    rng <- format(signif(range(x_finite), 3), width = 5)
    dist <- paste0(rng[1], " ", histospark(x_finite, width = 15), " ", rng[2])
  } else {
    sum <- format(signif(stats::fivenum(x_finite), 3), width = 5)
    dist <- paste0(sum[1], " [", sum[2], " (", sum[3], ") ", sum[4], "] ", sum[5])
  }
   paste0(dist, n_na(x), n_inf(x))
}

#' @export
precis_v.logical <- function(x, ..., width = 60) {
  show_distinct(x)
}

#' @export
precis_v.character <- function(x, ..., width = 60) {
  show_distinct(x, sort = TRUE)
}

#' @export
precis_v.factor <- function(x, ..., width = 60) {
  show_distinct(x, sort = TRUE)
}

#' @export
precis_v.ordered <- function(x, ..., width = 60) {
  show_distinct(x)
}

#' @export
precis_v.default <- function(x, ..., width = 60) {
  ""
}

#' @export
precis_v.list <- function(x, ..., width = 60) {
  types <- paste0("<", vapply(x, tibble::obj_sum, character(1)), ">")
  show_distinct(types, sort = TRUE)
}

show_distinct <- function(x, max_n = 4, sort = FALSE) {
  tbl <- table(x, useNA = "ifany")

  if (sort) {
    tbl <- sort(tbl)
  }
  extra <- length(tbl) > max_n
  if (extra) {
    tbl <- tbl[seq_len(max_n)]
  }

  nms <- names(tbl)

  paste0(
    paste0(str_trunc(nms, 20), " (", tbl, ")", collapse = " "),
    if (extra) " ..."
  )
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
