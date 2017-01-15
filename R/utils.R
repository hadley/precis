str_trunc <- function(x, width = 60) {
  n <- nchar(x, type = "width")

  x[n > width] <- paste0(substr(x, 1, width - 3), "...")
  x
}
