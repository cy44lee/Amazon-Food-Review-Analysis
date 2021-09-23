library(readxl)
df_top <- read_excel("OneDrive - UC Irvine/BANA 277/Final Project/df_top.xlsx")

df_top$helpfulness_score[df_top$helpfulness_score >=0.5 ] <- 1
df_top$helpfulness_score[df_top$helpfulness_score <0.5 ] <- 0

library(janitor)
tabyl(df_top, TextBlob_Analysis)

glm1 <- glm(helpfulness_score ~ Score + Length_of_review + polarity + subjectivity ,
                data=df_top, family=binomial())
summary(glm)

glm2 <- glm(helpfulness_score ~ Score + Length_of_review + polarity,
           data=df_top, family=binomial())
summary(glm2)

