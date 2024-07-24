# Packages Loaded

library(readxl)
library(dplyr)
library(fs)
library(purrr)
library(data.table)
library(tidyr)
library(janitor)
library(stringr)
library(readr)

Data_Location <-"C:/Users/harle/OneDrive/Desktop/NHS Open Data R App/Data/Diagnostics_HB/diagnostics.csv" # File Path

Diagnostics_Data <- read.csv(Data_Location) # Read in Data

Diagnostics_Data_Cleanned <- Diagnostics_Data |> # Removing unrequired data on my end
  select(-NumberOnListQF) #Removing NumberOnListQF from file


###### Waiting Time Preparation pipping data through for waiting time critera

Diagnostics_Waiting_Time_0_7 <- Diagnostics_Data_Cleanned |> 
  filter(WaitingTime == "0-7 days") |> 
  mutate(WaitingTime = str_replace(WaitingTime, "0-7 days", "7 Days or under"))

Diagnostics_Waiting_Time_8_14 <- Diagnostics_Data_Cleanned|>
  filter(WaitingTime == "8-14 days") |> 
  mutate(WaitingTime = str_replace(WaitingTime, "8-14 days", "14 Days or under"))

Diagnostics_Waiting_Time_15_21 <- Diagnostics_Data_Cleanned|>
  filter(WaitingTime == "15-21 days") |> 
  mutate(WaitingTime = str_replace(WaitingTime, "15-21 days", "21 Days or under"))

Diagnostics_Waiting_Time_22_28 <- Diagnostics_Data_Cleanned|>
  filter(WaitingTime == "22-28 days") |> 
  mutate(WaitingTime = str_replace(WaitingTime, "22-28 days", "28 Days or under"))

Diagnostics_Waiting_Time_29_35 <- Diagnostics_Data_Cleanned|>
  filter(WaitingTime == "29-35 days") |> 
  mutate(WaitingTime = str_replace(WaitingTime, "29-35 days", "35 Days or under"))

Diagnostics_Waiting_Time_36_42 <- Diagnostics_Data_Cleanned|>
  filter(WaitingTime == "36-42 days") |> 
  mutate(WaitingTime = str_replace(WaitingTime, "36-42 days", "42 Days or under"))

Diagnostics_Waiting_Time_43_49 <- Diagnostics_Data_Cleanned|>
  filter(WaitingTime == "43-49 days") |> 
  mutate(WaitingTime = str_replace(WaitingTime, "43-49 days", "49 Days or under"))

Diagnostics_Waiting_Time_50_56 <- Diagnostics_Data_Cleanned|>
  filter(WaitingTime == "50-56 days") |> 
  mutate(WaitingTime = str_replace(WaitingTime, "50-56 days", "56 Days or under"))

###### Creating Summary Files for Future Dashboard Plotly Graphs and Maps
