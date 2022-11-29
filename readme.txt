The data is colected from the following sources:

-WorldClim - Global Climate Data repository at
--https://www.worldclim.org/data/worldclim21.html 
--http://www.worldclim.com/cmip5_10m

-Canadian Centre for Climate Modelling and Analysis repository at 
--https://crd-data-donnees-rdc.ec.gc.ca/CCCMA/products/CLIMDEX/CMIP5/
--https://climate-modelling.canada.ca/climatemodeldata/climdex/ 

-Moderate Resolution Imaging Spectroradiometer repository at 
--doi.org/10.5067/MODIS/MCD12C1.006


#########################################################################

-Data file BOCLIM_CEI_MODIS.csv contains BIOCLIM, CEI and MODIS variables
 used in the study as well as Latitude (lat) and Longitude (lon)
 coordinates of each observation.
-- Columns named bio1 - bio19 are BIOCLIM variables used in the study.
-- Columns named CDD - WSDI are CLIMDEX variables.
-- Columns named c1 - c16 are MODIS land cover classes. 
   Here c1 = Evergreen Needleleaf Forest, c2 = Evergreen Broadleaf Forest,
   c3 = Deciduous Needleleaf Forest, c4 = Deciduous Broadleaf Forest,
   c5 = Mixed Forest, c6 = Closed Shrubland, c7 = Open Shrubland,
   c8 = Woody Savanna, c9 = Savanna, c10 = Grassland, c11 = Wetland,
   c15 = Snow and Ice, c16 = Desert


-Data files future_rcpx_y.cvs contains future projections of both BIOCLIM
  and CLIMDEX variables.
Here x represents RCP scenarios: 2.6, 4.5 and 8.5 respectively 
and y represents either 50 or 70 years ahead projection.
-- Columns named bio1 - bio19 are BIOCLIM variables used in the study.
-- Columns named CDD - WSDI are CLIMDEX variables.


* More detailed description of the data and the variables can be found
  in the paper. 
