# Week 1: Initial Data Exploration ====
# Author: [tori sayles]
# Date: [30.02.26]

# Load packages ====
library('tidyverse')
library('here')
library('naniar')
library('janitor')
library('skimr')
# Load data ====
mosquito_egg_raw <- read_csv(here("data", "mosquito_egg_data.csv"),
                             name_repair = janitor::make_clean_names)

# Basic overview ====
glimpse(mosquito_egg_raw)
summary(mosquito_egg_raw)
skim(mosquito_egg_raw)

# React table====
# view interactive table of data
view(mosquito_egg_raw)


# Counts by site and treatment====

mosquito_egg_raw |> 
  group_by(site, treatment) |> 
  summarise(n = n())

# Observations ====
# Your observations (add as comments below):
# - What biological system is this? insect?
#   
# - What's being measured? the mass of female mosquitos compared to their age 
#   
# - How many observations?205
#   
# - Anything surprising? minimum body mass is -93 mg
#   
# - Any obvious problems?a few NA values is various columns there are 13 missing values in the collector column 
#


mosquito_egg_raw |> mutate(collection_date = as_date (collection_date))

# checking for duplicates using two methods 
mosquito_egg_raw |> 
  get_dupes()
# check for whole duplicate 
# rows in the data
mosquito_egg_raw |> 
  filter(duplicated(across(everything())))
sum() 

mosquito_egg_raw |> 
  summarise(
    n = n(),
    n_distinct(female_id)
  )

# Inspect duplicated rows
mosquito_egg_raw |> 
  filter(duplicated(mosquito_egg_raw))
# Keep only unduplicated data
mosquito_egg_raw |> 
  filter(!duplicated(mosquito_egg_raw))
