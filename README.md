# seib-dgvm-pf
Data assimilation code for SEIB-DGVM, developed by Hazuki Arakida (RIKEN) and Shin-Ichiro Shima (University of Hyogo, RIKEN).

<ver.2>
- MAIN CODE
  seib271_pf200/scr/diff.txt<br>
    Modifications to SEIB-DGVM2.71.<br>
    Put the modificated SEIB-DGVM code in this directory.<br>
    Original SEIB-DGVM code is available at http://seib-dgvm.com/.<br>
    Main program: start_point.f90<br>
             
  seib271_pf200/R_pf.R, seib271-pf200/R_resample.sh<br>
    Resampling code for particle filter. R_resample.sh is called from start_point.f90.<br>

- INPUTS (need to be prepared) <br>
  seib271_pf200/data/co2_1750-2100_a1b.txt (from original SEIB-DGVM2.71 source code)　<br>
  seib271_pf200/data/land_prop.txt (from original SEIB-DGVM2.71 source code)  <br>
  seib271_pf200/scr/ptl.txt (particle number)<br>
  seib271_pf200/scr/da.txt (flag for data assimiation. DA:1, NODA:0 )<br>
  seib271_pf200/scr/daloop.txt (91 * (years for data assimilation))<br>
  seib271_pf200/scr/studysites.csv (4 * (site number), 1st line: latitude, 2nd line: longitude)<br>
  seib271_pf200/scr/site_start.txt (start site)<br>
  seib271_pf200/scr/site_end.txt (end site)<br>
  seib271_pf200/SITENUMBER/sd_lai.txt (365 * 4 years, NA=-9999)<br>
  seib271_pf200/SITENUMBER/obs_lai.txt　 (365 * 4 years, NA=-9999)<br>
  seib271_pf200/SITENUMBER/forcingdata.txt (365 * 20 years, csv)<br>
  seib271_pf200/SITENUMBER/Parameterin.txt (6 parameters. 4th and 5th are not used, csv)<br>
  seib271_pf200/SITENUMBER/forcing_flag.txt (forcing climate data with missing data: 0)<br>
  seib271_pf200/omitsites.csv (site number for skipping simulation)<br>

- Outputs (Spin-up)<br>
  at seib271_pf200/SITENUMBER/<br>
  spinup_out.bin should be renamed: spinup_in.bin for data assimilation/ without data assimilation experiment.
  
- Outputs (DA, NODA)<br>
  at seib271_pf200/SITENUMBER/<br>
  output000421.bin: estimated variables<br>
  parameterlog000421.bin: estimated parameters (only for DA)
  
Particle number should be changed: R_pf.R

