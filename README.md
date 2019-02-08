# seib-dgvm-pf
Data assimilation code for SEIB-DGVM, developed by Hazuki Arakida (RIKEN) and Shin-Ichiro Shima (University of Hyogo, RIKEN).

seib271_pf200/scr/diff.txt
  Modifications to SEIB-DGVM2.71:
  Original SEIB-DGVM code is available at http://seib-dgvm.com/.
  Main program: start_point.f90 
             
seib271_pf200/R_pf.R
seib271-pf200/R_resample.sh
  Resampling code for particle filter. R_resample.sh is called from main program.

Input files (need to be prepared) 
  seib271_pf200/SITENUMBER/sd_lai.txt (365 * 4 years)
  seib271_pf200/SITENUMBER/obs_lai.txt
  seib271_pf200/SITENUMBER/forcingdata.txt (365 * 20 days)
  seib271_pf200/SITENUMBER/Parameterin.txt (6 parameters. 4th and 5th are not used)
  seib271_pf200/SITENUMBER/forcing_flag.txt (which include missing data: 1)

Output (Spin-up)
  at seib271_pf200/SITENUMBER/
  
omitsites.csv
