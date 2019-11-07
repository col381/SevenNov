library(tidyverse)
tidy <- read_csv("tidy.csv")

# step 1 after loading tidy verse and ready library, below removes blank rows and 
# names headers
tidy <- tidy[!apply(is.na(tidy) | tidy == "", 1, all),]%>%
  rename(ElementNo = X1)%>%
  rename(Cost_Element = X2)%>%
  rename(ClusterNo = X3)%>%
  rename(Cluster = X4)%>%
  rename(Definition = X5)%>%
  rename(ProjName = X6)%>%
  rename(CM_Actual = X7)%>%
  rename(YTD_Plan = X8)%>%
  rename(YTD_Actual = X9)%>%
  rename(YTD_Variance = X10)%>%
  rename(YTD_Commitment= X11)%>%
  rename(FY_Plan = X12)%>%
  rename(FY_Actual = X13)%>%
  rename(FY_Variance = X14)%>%
  rename(FY_Commitment = X15)%>%
  rename(WOL_Plan = X16)%>%
  rename(WOL_Actual = X17)%>%
  rename(WOL_Variance = X18)%>%
  rename(WOL_Commitment = X19)
  

# remove rows 1 and 2
tidy2 <- tidy[-c(1, 2), ]

step2 <- tidy2 %>%
  mutate(Operating = recode(Cost_Element,`Travel` = "Other Operating",`TOTAL REVENUE`="External Revenue"))%>%
  mutate(Initiative = recode(Cluster, 
                             `Brent Henderson` = "Environmental & Biological",
                             `Chen Cai`  = "Transport and Logistics",
                             `Gavin Walker` = "Data Science Application",
                             `Lachlan Hetherton` = "Industrial Transformation",
                             `Mahesh Prakash` = "Natural Hazards and Infrastructure",
                             `Zili Zhu` = "Risklab",
                             `Paul Cleary` = "Industrial Device Optimisation",
                             `Simon Harrison` = "Digital Human",
                             `Cecile Paris` = "Group",
                             `Gary Delaney` = "Group",
                             `Melanie Ayre` = "Group",
                             `Klara Verbyla` = "Group",
                             `Peter Toscas` = "Group",
                             `Richard Nock` = "Group",
                             `Kimberley Clayfield` = "Other",
                             `Not assigned` = "Other",
                             `Petra Kuhnert` = "Other"))

