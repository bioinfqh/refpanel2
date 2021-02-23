chooseCRANmirror(graphics=FALSE, ind=87)
install.packages("BiocManager")
#install.packages("BiocManager",repos='http://cran.us.r-project.org')
BiocManager::install("snpStats")

# Exit R
quit(save="yes")
