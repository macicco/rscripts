# =================================================================
#
#-- By station comparison of cdeg
#   (as a measure of quality)
#
#-- Author: Peter Campbell-Burns, UKMON
#-- Version 1.0, 12/12/2015
#
#-- Shared under the Creative Common  Non Commercial Sharealike 
#   License V4.0 (www.creativecommons.org/licebses/by-nc-sa/4.0/)
#
#
# =================================================================


Idx=0

MainTitle = paste("Average linearity error (cdeg)",Streamname)
SubTitle  = DataSet

statcount   <- table(ms$X_ID1)
statcount   = as.data.frame(statcount)
stationlist <- statcount$Var1 
stationlist <- sort(stationlist)

# Select and configure the output device
select_dev(Outfile, Otype=output_type, wd= paper_width, ht=paper_height, pp=paper_orientation)
Plot_Rows = 3
Plot_Cols = 4
oldpar <- par(mfrow=c(Plot_Rows,Plot_Cols))
par(mar=c(2.5,1,1.8,1), oma=c(1,1,3,1))

for (x in stationlist)    
{
    Idx = Idx + 1
    tmp <- subset(ms, ms$X_ID1 == x)

    # Only plot where station data exists
    if (nrow(tmp)) {
      h = hist(tmp$X_cdeg,
          main = x,
          xlab = "cdeg (degrees)",
          ylab = "Counts",
          cex.main = 0.8,
          cex.axis = 0.8,
          xlim = range(0,0.06),
          breaks=20,
          border=FALSE,
          plot = TRUE,
          freq=TRUE,col="blue")
      }
}

par(oldpar)
par(mfrow=c(1,1))

rm(Plot_Rows)
rm(Plot_Cols)
rm(statcount)
rm(stationlist)
rm(tmp)
rm(h)
    
