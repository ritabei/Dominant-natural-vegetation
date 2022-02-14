# R (version 4.1.0) code for building of the decision trees in the paper:
# 'Identifying climate thresholds for dominant natural vegetation types 
# at the global scale using machine learning: Average climate versus extremes'
# by Rita Beigaite, 2022
#---------------------------------------------------------------------------#

# Loading packages
library('dplyr')
library(caret)
library('rpart.plot')
library('RColorBrewer')
library(rpart)

# Reading current climate and vegetation data_current
data_current <- read.csv2('BIOCLIM_CEI_MODIS.csv')

# Finding a dominant vegetation type in each grid cell
modis_dominant <- apply(data_current[,c('c1', 'c2', 'c3', 'c4', 'c5', 'c6', 'c7',
                                'c8', 'c9', 'c10', 'c11', 'c15', 'c16')],
                        1, function(x) {which.max(x)})



# Converting modis_dominant variable into a factor
modis_dominant <- factor(modis_dominant, levels=1:13, 
                         labels = c('ENF','EBF','DNF','DBF','MF',
                                    'ClosedShrubland','OpenShrubland',
                                     'WoodySavanna','Savanna','Grassland',
                                     'Wetland','SnowAndIce','Barren' ))

# Adding dominant class column to the initial data_current.frame
data_current <- cbind(data_current, modis_dominant)



# Reading future climate data

data_future_rcp26_50 <- read.csv2('future_rcp26_50.csv')
data_future_rcp26_70 <- read.csv2('future_rcp26_70.csv')

data_future_rcp45_50 <- read.csv2('future_rcp45_50.csv')
data_future_rcp45_70 <- read.csv2('future_rcp45_70.csv')

data_future_rcp85_50 <- read.csv2('future_rcp85_50.csv')
data_future_rcp85_70 <- read.csv2('future_rcp85_70.csv')



#############################################################################
# AVERAGE DECISION TREE
#############################################################################

### Building decision tree model###
#---------------------------------#

# Selecting columns for extreme model training
train_extreme <- data_current %>% 
        select('bio1', 'bio2', 'bio3', 'bio5', 'bio6', 'bio8', 'bio9',
               'bio10', 'bio11', 'bio12', 'bio13', 'bio14',
               'bio16', 'bio17', 'bio18', 'bio19', 'modis_dominant')


# Training decision tree on full data_current set
average.model <- rpart(modis_dominant ~., data = train_average,
                       method = 'class',
                       parms=list(split='gini'),
                       control = rpart.control(cp = 0.005))

# Plotting the resulting decision tree
prp(average.model, faclen=0, nn = F, extra=100,under=T,roundint=FALSE)


### Making current classification predictions by the tree###
#----------------------------------------------------------#

pred_current <- predict(average.model, data_current,
                        type = c("class"))


### Making future predictions###
#---------------------------------#


pred_rcp26_50 <- predict(average.model, data_future_rcp26_50,
                        type = c("class"))

pred_rcp26_70 <- predict(average.model, data_future_rcp26_70,
                        type = c("class"))

pred_rcp45_50 <- predict(average.model, data_future_rcp45_50,
                        type = c("class"))

pred_rcp45_70 <- predict(average.model, data_future_rcp45_70,
                        type = c("class"))

pred_rcp85_50 <- predict(average.model, data_future_rcp85_50,
                        type = c("class"))

pred_rcp85_70 <- predict(average.model, data_future_rcp85_70,
                        type = c("class"))


#############################################################################
# EXTREME DECISION TREE
#############################################################################

### Building decision tree model###
#---------------------------------#

# Selecting columns for extreme model training
train_extreme <- data_current %>% 
        select('bio1', 'bio2','bio3', 'bio5', 'bio6', 'bio8', 'bio9',
               'bio10', 'bio11', 'bio12', 'bio13', 'bio14',
               'bio16', 'bio17', 'bio18', 'bio19', 'CDD', 'CSDI', 'CWD',
               'DTR', 'FD', 'GSL', 'ID', 'PRCPTOT', 'R10mm', 'R1mm',
               'R20mm', 'R95p', 'R99p', 'Rx1day', 'Rx5day', 'SDII', 'SU',
               'TN10p', 'TN90p', 'TNn', 'TNx', 'TR', 'TX10p',
               'TX90p', 'TXn', 'TXx', 'WSDI', 'modis_dominant')


# Training decision tree on full data_current set
extreme.model <- rpart(modis_dominant ~., data = train_extreme,
                       method = 'class',
                       parms=list(split='gini'),
                       control = rpart.control(cp = 0.005))

# Plotting the resulting decision tree
prp(extreme.model, faclen=0, nn = F, extra=100,under=T,roundint=FALSE)




### Making current classification predictions by the tree###
#----------------------------------------------------------#

pred_current <- predict(extreme.model, data_current,
                        type = c("class"))


### Making future predictions###
#---------------------------------#


pred_rcp26_50 <- predict(extreme.model, data_future_rcp26_50,
                        type = c("class"))

pred_rcp26_70 <- predict(extreme.model, data_future_rcp26_70,
                        type = c("class"))

pred_rcp45_50 <- predict(extreme.model, data_future_rcp45_50,
                        type = c("class"))

pred_rcp45_70 <- predict(extreme.model, data_future_rcp45_70,
                        type = c("class"))

pred_rcp85_50 <- predict(extreme.model, data_future_rcp85_50,
                        type = c("class"))

pred_rcp85_70 <- predict(extreme.model, data_future_rcp85_70,
                        type = c("class"))

