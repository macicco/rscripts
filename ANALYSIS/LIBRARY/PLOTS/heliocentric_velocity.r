#------------------------------------------------------
#
#-- Distribution of Heleiocentric Velocity
#
#-- Author: Peter Campbell-Burns, UKMON
#-- Version 1.0, 12/12/2015
#
#-- Shared under the Creative Common  Non Commercial Sharealike 
#   License V4.0 (www.creativecommons.org/licebses/by-nc-sa/4.0/)
#
#------------------------------------------------------
par(mai=c(1.0,1.0,0.5,0.5))

prange = 100
if (max(mu$X_vs) < prange) prange = max(mu$X_vs) 

tmp <- mu[mu$X_vs <= prange,]


if (nrow(tmp) > 0) {
  
  # Select and configure the output device
  select_dev(Outfile, Otype=output_type, wd= paper_width, ht=paper_height, pp=paper_orientation)
  
  bins=seq(0,prange+10,by=0.5)
  hist(tmp$X_vs,
       breaks=bins, 
       col="blue", 
       xlab="Velocity (km/s)", 
       ylab="count", 
       main=paste("Heliocentric Velocity Frequency Plot",Streamname),
       sub=DataSet)
        rm(bins)
}
# Tidy up

  rm(tmp)
  