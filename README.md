# seib-pf
Data assimilation code for SEIB-DGVM, developed by Hazuki Arakida (RIKEN) and Shin-Ichiro Shima (University of Hyogo, RIKEN).

##### seib271_pf200 (particle filter ver.2) #####
- Main code<br>
  - seib271_pf200/scr/diff.txt<br>
    Modifications to SEIB-DGVM2.71.<br>
    Original SEIB-DGVM code is available at http://seib-dgvm.com/.<br>
    Put the modificated SEIB-DGVM code (--.f90) in this directory.<br>
    MPI compile, DA settings: start_point.f90<br>    
             
  - seib271_pf200/R_pf.R, seib271-pf200/R_resample.sh<br>
    Resampling code for particle filter. R_resample.sh is called from start_point.f90.<br>

- Inputs (need to be prepared) <br>
  seib271_pf200/data/co2_1750-2100_a1b.txt (from original SEIB-DGVM2.71 source code)　<br>
  seib271_pf200/data/land_prop.txt (from original SEIB-DGVM2.71 source code)  <br>
  seib271_pf200/scr/ptl.txt (particle numbers)<br>
  seib271_pf200/scr/da.txt (flag for data assimiation, spin-up:1, noDA:2, DA:3)<br>
  seib271_pf200/scr/daloop.txt (91 * (years for DA))<br>
  seib271_pf200/scr/studysites.csv (row:site numbers, col:4 -> 1st line: latitude, 2nd line: longitude)<br>
  seib271_pf200/scr/site_start.txt (start site)<br>
  seib271_pf200/scr/site_end.txt (end site)<br>
  seib271_pf200/SITENUMBER/sd_lai.txt (365 * 4 years, NA=-9999)<br>
  seib271_pf200/SITENUMBER/obs_lai.txt　 (365 * 4 years, NA=-9999)<br>
  seib271_pf200/SITENUMBER/forcingdata.txt (row:365 * 20 years, col:9 data, csv)<br>
  seib271_pf200/SITENUMBER/Parameterin.txt (row:particle numbers, col:6 parameters -> 4th and 5th are not used, csv)<br>
  seib271_pf200/SITENUMBER/forcing_flag.txt (forcing climate data with missing data: 0, without missing data: 1)<br>
  seib271_pf200/omitsites.csv (site number for skipping simulation)<br>

- Outputs (Spin-up)<br>
  at seib271_pf200/SITENUMBER/<br>
  spinup_out.bin
  -> should be renamed to "spinup_in.bin" for noDA and DA experiments.
  
- Outputs (DA, NODA)<br>
  at seib271_pf200/SITENUMBER/<br>
  output.bin: estimated variables<br>
  parameterlog.bin: estimated parameters (only for DA)


