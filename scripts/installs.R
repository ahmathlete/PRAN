# This script makes sure the desired packages can be installed or updated

remotes::install_github(c(
  "ahmathlete/idps",
  "ahmathlete/rWRF",
  "ahmathlete/KlimaKonformC3"
), dependencies = TRUE, upgrade = "never")
