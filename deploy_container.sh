#!/bin/bash
set -o errexit -o nounset
addToDrat(){
  PKG_REPO=$PWD

  cd ..; mkdir drat; cd drat

  ## Set up Repo parameters
  git init
  git config user.name "Marc A. Suchard"
  git config user.email "msuchard@ucla.edu"
  git config --global push.default simple

  ## Get drat repo
  git remote add upstream "https://$GH_TOKEN@github.com/OHDSI/drat.git"
  git fetch upstream 2>err.txt
  git checkout gh-pages

  ## Install drat
  echo 'R_LIBS=~/Rlib' > .Renviron
  Rscript -e "if(!require('drat')) install.packages('drat')"
  
  ## Get file names
  PKG_NAME=$(Rscript -e 'cat(paste0(devtools::as.package(".")$package))')
  PKG_TARBALL=$(Rscript -e 'pkg <- devtools::as.package("."); cat(paste0(pkg$package,"_",pkg$version,".tar.gz"))')  
  
  ## Deploy
  Rscript -e "drat::insertPackage('$PKG_REPO/$PKG_TARBALL', \
    repodir = '.', \
    commit='Travis update: build $TRAVIS_BUILD_NUMBER')"
  git push

}
addToDrat
