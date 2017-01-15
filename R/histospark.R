sparks <- c("\u2581", "\u2582", "\u2583", "\u2585", "\u2587")

histospark <- function(x, width = 10) {
  bins <- graphics::hist(x, breaks = width, plot = FALSE)

  factor <- cut(
    bins$counts / max(bins$counts),
    breaks = seq(0, 1, length = length(sparks) + 1),
    labels = sparks,
    include.lowest = TRUE
  )

  paste0(factor, collapse = "")
}
