# This script installs packages that will be cached (e.g. package imports suggests depends...)
# The goal is to install and cache (automatically) dependent libraries that do not update frequently

# available packages: remotes, drat (from dipterix/drat-1) and BiocManager

# IMPORTANT: this script only run once (results will be cached)

BiocManager::install("rhdf5",
  update = FALSE,
  type = "source"
)
remotes::install_cran(
  c(
    "roxygen2",
    "devtools",
    "ncdf4",
    "terra",
    "bitops",
    "RCurl"
  ),
  dependencies = TRUE,
  upgrade = "never"
)

# check if windows
if (grepl("windows", tolower(Sys.info()["sysname"]))) {
  # Windows system detected

  R_Version <- paste0(R.version$major, ".", substr(R.version$minor, 1, 1))

  install.packages(paste0(
    "https://cran.r-project.org/bin/windows/contrib/",
    R_Version,
    "/RCurl_1.98-1.12.zip"
  ), repos = NULL, type = "source")
} else {
  # Non-Windows system detected
  remotes::install_cran(
    c(
      "RCurl"
    ),
    dependencies = TRUE,
    upgrade = "never"
  )
}
