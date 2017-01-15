str_trunc <- function(x, width = 60) {
  n <- nchar(x, type = "width")

  x[n > width] <- paste0(substr(x, 1, width - 3), "...")
  x
}

# For better performance with large vectors could supply optional max
# and could write C++ to terminate early once that was reached
n_distinct <- function(x) {
  length(unique(x))
}
