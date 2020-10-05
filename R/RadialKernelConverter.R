#' Radial Kernel Generator
#'
#' Converts a Euclidean Distance (dissimilarity) matrix into a
#' similarity matrix for spectral analysis.
#'
#' @param euclidian_distance.mat - A Eclidean distance matrix
#' @param c - A scale factor
#'
#' @return RMG.mat
#' @export
#'
#' @examples
#' RADIAL_KERNEL(as.matrix(DIST(iris[,1:4])))
RADIAL_KERNEL <- function(euclidian_distance.mat, c = 1) {

  stopifnot(dim(euclidian_distance.mat)[1]==dim(euclidian_distance.mat)[2])
  ## Some comments
  N <- nrow(euclidian_distance.mat)
  RKG.mat <- matrix(0, nrow = N, ncol = N)
  for (i in 1:N){
    for (j in 1:N){
      RKG.mat[i,j] = exp(-euclidian_distance.mat[i,j]^2/c)
    }
  }

  return(RKG.mat)
}
