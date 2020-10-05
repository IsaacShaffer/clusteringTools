#' Spectral Clustering using a Radial Kernel
#'
#'
#'
#' @param data.mat - An N x p data matrix.
#' @param centers - The number of cluster centers returned.
#' @param scale - A scale factor for the radial kernel function.
#'
#' @return kmeans output - TODO update this
#' @export
#'
#' @examples
#' iris_demo <- SPECC_RK(RADIAL_KERNEL(DIST(as.matrix(iris[,1:4]))),
#'                       3, 70)
#' library(pdfCluster)
#' pdfCluster::adj.rand.index(iris_demo$cluster, iris[,5])

SPECC_RK <- function(data.mat, centers, scale = 1) {
  requireNamespace("data.table")
  N <- nrow(data.mat)
  distance.mat <- DIST(data.mat)
  #### Convert Euclidian distances to similarities ########
  #### via radial-kernel gram. Set weights equal to #######
  #### similarities.  #####################################
  W.mat <- RADIAL_KERNEL(distance.mat, c = scale)
  #### Compute the diagnol degree matrix. #################
  G.mat <- diag(rowSums(W.mat))
  #### Calculate a NORMALIZED graph Laplacian  ############
  norm_L.mat <- diag(N) - solve(G.mat) %*% W.mat
  #### Calculate eigen values and vectors  ################
  Z <- eigen(norm_L.mat)
  #### Find the eigen value cutoff. Yes... There are ######
  #### faster ways (that do not involve sorting) ##########
  eigen_val_cutoff <- sort(abs(Re(Z$values)))[centers]
  #### Select eigen vector components that correspond #####
  #### with least eigen values.
  cluster.mat <- Z$vectors[,which(abs(Re(Z$values)) <= eigen_val_cutoff)]
  kmeans_results <- stats::kmeans(cluster.mat, centers = centers)
  return(kmeans_results)
}

