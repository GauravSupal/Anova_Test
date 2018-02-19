
library(XLConnect)
wb = loadWorkbook("C:\\Users\\Admin\\Desktop\\Work\\EarlyLifeProductivity_firstdraft_Copy.xlsx")
Tarapur_df = readWorksheet(wb, sheet = "Sheet1", header = TRUE)
View(Tarapur_df)


library(dplyr)

Tarapur_data <- slice(Tarapur_df,1:50)


Tarapur_data <- na.omit(Tarapur_data)
View(Tarapur_data)


attach(Tarapur_data)

Tarapur_data$X3month <- as.numeric(Tarapur_data$X3month)
Tarapur_data$X6month <- as.numeric(Tarapur_data$X6month)

summary(Tarapur_data)

Group1 <- Tarapur_data$X1month.
Group2 <- Tarapur_data$X3month
Group3 <- Tarapur_data$X6month

combined_grps <- data.frame(cbind(Group1,Group2,Group3)) # combined data set into single dataset
combined_grps

summary(combined_grps)


stacked_grps <- stack(combined_grps)
stacked_grps

Anova_Result <- aov(values ~ ind, data = stacked_grps)
summary(Anova_Result)
