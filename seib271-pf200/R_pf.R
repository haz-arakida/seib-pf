####################################################################
# Particle Filter for SEIB-DGVM (resampling)
# authours: Hazuki Arakida (RIKEN) and Shin-Ichiro Shima (University of Hyogo)
# version 20190208
####################################################################

####settings####
num_ptl <- 8000

#inflation
inf1_1    <- 4
inf1_2    <- 1	
inf2      <- 4        #this is not used in this experiment 
inf3_1    <- 4
inf3_2    <- 4

#limitter
Pmaxf_low  <- 0 
Pmaxf_high <- 60
Pmaxg_low  <- 0
Pmaxg_high <- 15
Folf_low   <- 80      #this is not used in this experiment  
Folf_high  <- 180     #this is not used in this experiment 
Folg_low   <- 80      #this is not used in this experiment 
Folg_high  <- 180     #this is not used in this experiment 
Dorf_low   <- 200
Dorf_high  <- 300
Dorg_low   <- 200
Dorg_high  <- 300

sampled_id_list <- numeric(num_ptl)
noise_list      <- numeric(num_ptl)
firstid         <- numeric(num_ptl)

likelihood      <- read.table("likelihood.txt", col.names=F)
likelihood      <- likelihood[,1]
likelihoodsum   <- sum(likelihood)

parameter            <- array(data=NA, dim=c(num_ptl, 6))

para_noise         <- array(data=NA, dim=c(num_ptl, 6))
para_noise[,1] <- runif(num_ptl, min=-inf1_1, max=inf1_1) #Pmaxf
para_noise[,2] <- runif(num_ptl, min=-inf1_2, max=inf1_2) #Pmaxg
para_noise[,3] <- runif(num_ptl, min=-inf2,   max=inf2  ) #Folf  #this is not used in this experiment 
para_noise[,4] <- runif(num_ptl, min=-inf2,   max=inf2  ) #Folg  #this is not used in this experiment 
para_noise[,5] <- runif(num_ptl, min=-inf3_1, max=inf3_1) #Dolf
para_noise[,6] <- runif(num_ptl, min=-inf3_2, max=inf3_2) #Dolg

para_noise[,1] <- para_noise[,1] - mean(para_noise[,1])
para_noise[,2] <- para_noise[,2] - mean(para_noise[,2])
para_noise[,3] <- para_noise[,3] - mean(para_noise[,3]) #this is not used in this experiment 
para_noise[,4] <- para_noise[,4] - mean(para_noise[,4]) #this is not used in this experiment 
para_noise[,5] <- para_noise[,5] - mean(para_noise[,5])
para_noise[,6] <- para_noise[,6] - mean(para_noise[,6])

####data assimilation####

    ###resample & noise list
    sampled_id_list[1:num_ptl] <- sample(c(1:num_ptl), num_ptl, replace=T, prob=likelihood[1:num_ptl])
    noise_list[1:num_ptl] <- 1
    firstid[1:num_ptl] <- match(1:num_ptl, sampled_id_list[1:num_ptl], nomatch=1)
    noise_list[firstid[1:num_ptl]] <- 0

    parameter1<-read.csv("Parameterin.txt")
    parameter<- parameter1[sampled_id_list,]
       
    ###noise to parameter
    id_noise <- which(noise_list[] == 1)
    tmp_param <- parameter[id_noise,] + para_noise[id_noise,]

    ###apply upper/lower limiter
    id_pmaxf_low  <- which(tmp_param[, 1] < Pmaxf_low)
    tmp_param[id_pmaxf_low,  1] <- 2 * Pmaxf_low  - tmp_param[id_pmaxf_low,  1]
    id_pmaxf_high <- which(tmp_param[, 1] > Pmaxf_high)
    tmp_param[id_pmaxf_high, 1] <- 2 * Pmaxf_high - tmp_param[id_pmaxf_high, 1]
            
    id_pmaxg_low  <- which(tmp_param[, 2] < Pmaxg_low)
    tmp_param[id_pmaxg_low,  2] <- 2 * Pmaxg_low  - tmp_param[id_pmaxg_low,  2]
    id_pmaxg_high <- which(tmp_param[, 2] > Pmaxg_high)
    tmp_param[id_pmaxg_high, 2] <- 2 * Pmaxg_high - tmp_param[id_pmaxg_high, 2]

    #this is not used in this experiment          
    id_folf_low  <- which(tmp_param[, 3] < Folf_low)
    tmp_param[id_folf_low,  3] <- 2 * Folf_low  - tmp_param[id_folf_low,  3]
    id_folf_high <- which(tmp_param[, 3] > Folf_high)
    tmp_param[id_folf_high, 3] <- 2 * Folf_high - tmp_param[id_folf_high, 3]

    #this is not used in this experiment    
    id_folg_low  <- which(tmp_param[, 4] < Folg_low)
    tmp_param[id_folg_low,  4] <- 2 * Folg_low  - tmp_param[id_folg_low,  4]
    id_folg_high <- which(tmp_param[, 4] > Folg_high)
    tmp_param[id_folg_high, 4] <- 2 * Folg_high - tmp_param[id_folg_high, 4]

    id_dorf_low  <- which(tmp_param[, 5] < Dorf_low)
    tmp_param[id_dorf_low,  5] <- 2 * Dorf_low  - tmp_param[id_dorf_low,  5]
    id_dorf_high <- which(tmp_param[, 5] > Dorf_high)
    tmp_param[id_dorf_high, 5] <- 2 * Dorf_high - tmp_param[id_dorf_high, 5]
            
    id_dorg_low  <- which(tmp_param[, 6] < Dorg_low)
    tmp_param[id_dorg_low,  6] <- 2 * Dorg_low  - tmp_param[id_dorg_low,  6]
    id_dorg_high <- which(tmp_param[, 6] > Dorg_high)
    tmp_param[id_dorg_high, 6] <- 2 * Dorg_high - tmp_param[id_dorg_high, 6]

    parameter[id_noise,] <- tmp_param[]
  
    ###write data
      write.table(sampled_id_list, "sampled_id_list.txt", row.names=F, col.names=F)
      write.csv(parameter,"Parameterin.txt",row.names=FALSE)
      write.table(noise_list, "noise_list.txt", row.names=F, col.names=F)
