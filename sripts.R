pollutantmean <- function(directory, pollutant, id = 1:332){
        
}

path <- "C:/Users/JAX/R_workdir/datasciencecoursera/specdata/"
fileslong <- list.files(path=path, pattern="*.csv", full.names = TRUE)
filesshort <- list.files(path=path, pattern="*.csv")


for (file in fileslong){
        
        # if the merged dataset doesn't exist, create it
        if (!exists("dataset")){
                dataset <- read.table(file, header=TRUE, sep=",")
        }
        
        # if the merged dataset does exist, append to it
        if (exists("dataset")){
                temp_dataset <-read.table(file, header=TRUE, sep=",")
                dataset<-rbind(dataset, temp_dataset)
                rm(temp_dataset)
        }
        
}

for (file in fileslong){
      if (!exists("fileslong[file]")){ next()
        } else {rm("fileslong[file]")}
        
