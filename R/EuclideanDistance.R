#' A Euclidean Distance Finder
#'
#' This algorithm uses the Gram matrix to calculate
#' the pairwise Euclidean distance between the N
#' elements of data.mat. In this case, it will often
#' be used as a dissimilarity matrix.
#'
#' @param data.mat - An N x p matrix of data.
#' @param digits - The number of significant digits to return.
#'
#' @return distance.mat - An N x N pairwise distance matrix.
#' @export
#'
#' @examples
#' DIST(as.matrix(iris[,1:4]))
DIST <- function(data.mat, digits = 15) {
  ### Calculate Euclidean distance using the Gram matrix ###
  Gram.mat <- as.matrix(data.mat) %*% t(as.matrix(data.mat))
  ### Initialize output matrix
  N <- nrow(data.mat)
  distance.mat <- matrix(nrow = N, ncol = N)
  ### Calulate distances
  for (i in 1:N){
    for (j in 1:N){
      distance.mat[i,j] = sqrt(Gram.mat[i,i] -
                                 2*Gram.mat[i,j] +
                                 Gram.mat[j,j])
    }
  }
  ### Adjust to desired precision
  distance.mat <- round(distance.mat, digits)
  ### Fix row and column names
  row.names(distance.mat) <- row.names(data.mat)
  colnames(distance.mat) <- row.names(data.mat)
  return(distance.mat)
}
