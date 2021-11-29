# Title     : Install Packages
# Objective : Install Packages
# Created by: Think
# Created on: 15/11/2021

InstallPackages <- function (){

  packages <- c('tidyverse', 'data.table', 'ggplot2', 'rmarkdown', 'rstatix', 'latex2exp', 'tufte')

  # Install
  .install <- function(x){
    if (!require(x, character.only = TRUE)) {
      install.packages(x, dependencies = TRUE)
      if (x == 'rmarkdown') {tinytex::install_tinytex()}
    }
  }
  lapply(packages, .install)

  # Activate
  .activate <- function (x){
    library(x, character.only = TRUE)
    if (x == 'rmarkdown') {library(tinytex)}
  }
  lapply(packages[!(packages %in% c('tidyverse', 'healthcareai', 'equatiomatic'))], .activate)

  # Active libraries
  sessionInfo()

}
