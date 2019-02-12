# seib-dgvm-pf
Data assimilation code for SEIB-DGVM, developed by Hazuki Arakida (RIKEN) and Shin-Ichiro Shima (University of Hyogo, RIKEN).

seib271_pf200/scr/diff.txt
  Modifications to SEIB-DGVM2.71.
  Put the modificated SEIB-DGVM code in this directory.
  Original SEIB-DGVM code is available at http://seib-dgvm.com/.
  Main program: start_point.f90
             
seib271_pf200/R_pf.R, seib271-pf200/R_resample.sh
  Resampling code for particle filter. R_resample.sh is called from start_point.f90.

Input files (need to be prepared) 
  seib271_pf200/data/co2_1750-2100_a1b.txt (from original SEIB-DGVM2.71 source code)
  seib271_pf200/data/land_prop.txt (from original SEIB-DGVM2.71 source code)  
  seib271_pf200/scr/ptl.txt (particle number)
  seib271_pf200/scr/da.txt (flag for data assimiation. DA:1, NODA:0 )
  seib271_pf200/scr/daloop.txt (91 * (years for data assimilation))
  seib271_pf200/scr/studysites.csv (4 * (site number), 1st line: latitude, 2nd line: longitude)
  seib271_pf200/scr/site_start.txt (start site)
  seib271_pf200/scr/site_end.txt (end site)
  seib271_pf200/SITENUMBER/sd_lai.txt (365 * 4 years, NA=-9999)
  seib271_pf200/SITENUMBER/obs_lai.txt　 (365 * 4 years, NA=-9999)
  seib271_pf200/SITENUMBER/forcingdata.txt (365 * 20 years, csv)
  seib271_pf200/SITENUMBER/Parameterin.txt (6 parameters. 4th and 5th are not used, csv)
  seib271_pf200/SITENUMBER/forcing_flag.txt (forcing climate data with missing data: 0)
  seib271_pf200/omitsites.csv (site number for skipping simulation)

Output (Spin-up)
  at seib271_pf200/SITENUMBER/
  spinup_out.bin should be renamed: spinup_in.bin for data assimilation/ without data assimilation experiment.
  
Output (DA, NODA)
  at seib271_pf200/SITENUMBER/
  output000421.bin
  parameterlog000421.bin
  
Particle number should be changed: R_pf.R

