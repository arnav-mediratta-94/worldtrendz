#Setting up envoirnment variables
stats <- read.csv("P2-Section5-Homework-Data.csv")
#vectors for country code, life expectancy for 1960 and 2013 are imported from R file Section5-Homework-Vectors.R

#Verifying the data frame
str(stats)
summary(stats)

#Split file imported stats by year
filter = stats$Year == 1960
stats1960 = stats[filter,]
filter = stats$Year == 2013
stats2013 = stats[filter,]
rm(filter,stats)

#Adding the vectors imported from the R file to data frame
LifeExpectancy1960 = data.frame(Code = Country_Code, Life.Expectancy = Life_Expectancy_At_Birth_1960)
LifeExpectancy2013 = data.frame(Code = Country_Code, Life.Expectancy = Life_Expectancy_At_Birth_2013)

rm(Country_Code,Life_Expectancy_At_Birth_1960,Life_Expectancy_At_Birth_2013)
otherStats

#Merge data Life expectancy data of 1960 with stats of 1960
data1960 <- merge(stats1960,LifeExpectancy1960, by.x = "Country.Code", by.y = "Code")
data2013 <- merge(stats2013,LifeExpectancy2013, by.x = "Country.Code", by.y = "Code")

#Plot Graph for Life Expectancy vs Fertility Rate in 1960
qplot(data = data1960, x = Fertility.Rate, y = Life.Expectancy, color = Region, size = I(3), alpha = I(0.6), main = "Life Expectancy vs Fertility Rate 1960")
qplot(data = data2013, x = Fertility.Rate, y = Life.Expectancy, color = Region, size = I(3), alpha = I(0.6), main = "Life Expectancy vs Fertility Rate 2013")

# Insights 
# Regions with higher life expectancy have lower fertility rates