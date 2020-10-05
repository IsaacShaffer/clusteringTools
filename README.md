# clustering-tools

Some simple tools for clustering

## Installation

devtools::install_github("tdhock/LOPART")

## Usage

For spectral clustering with radial kernel, the main function is:

```r
iris_demo <- SPECC_RK(RADIAL_KERNEL(DIST(as.matrix(iris[,1:4]))),
                      3, 70)
```

The results for such a use look like:

```
> iris_demo
K-means clustering with 3 clusters of sizes 50, 48, 52

Cluster means:
          [,1]        [,2]       [,3]
1  0.005038687  0.11343578 0.08164966
2  0.088160471 -0.05719074 0.08164966
3 -0.085003231 -0.04905044 0.08164966

Clustering vector:
  [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
 [48] 1 1 1 3 2 3 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3 2 2 2 2 2 3 2 2 3 2 2 2 2 2 2 2
 [95] 2 2 2 2 2 2 3 3 3 3 3 3 2 3 3 3 3 3 3 3 3 3 3 3 3 2 3 2 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 2 3 3
[142] 3 3 3 3 3 3 3 3 3

Within cluster sum of squares by cluster:
[1] 0.03341224 0.13228867 0.15874168
 (between_SS / total_SS =  83.8 %)

Available components:

[1] "cluster"      "centers"      "totss"        "withinss"     "tot.withinss" "betweenss"   
[7] "size"         "iter"         "ifault"
```

They can be used in conjunction with other clustering assessment tools like `pdfCluster::adj.rand.index`:

```{r}
> pdfCluster::adj.rand.index(iris_demo$cluster, iris[,5])

[1] 0.8176016
```

