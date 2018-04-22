library(plotKML)


files <- dir(pattern = "*\\.gpx")
file_length <- length(files)
index <- c()
latitude <- c()
longitude <- c()
for (i in 1:file_length) {
  
  route <- readGPX(files[i])
  location <- route$tracks[[1]][[1]]
  
  index <- c(index, rep(i, dim(location)[1]))
  latitude <- c(latitude, location$lat)
  longitude <- c(longitude, location$lon)
}
routes <- data.frame(cbind(index, latitude, longitude))

# Map
ids <- unique(index)
plot(routes$longitude, routes$latitude, type="n", axes=FALSE, xlab="", ylab="", main="", asp=1)
for (i in 1:length(ids)) {
  currRoute <- subset(routes, index==ids[i])
  lines(currRoute$longitude, currRoute$latitude, col="#00000020")
}