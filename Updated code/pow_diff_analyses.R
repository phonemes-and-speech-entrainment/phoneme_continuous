rm(list=ls())

setwd('/Volumes/SAMSUNG/Neural_entrainment_to_native_and_foreign_speech/Epoched data/Data analysis/Power')

library(car)
idatalang <- read.csv("idata_pow_diff.csv")
datalang_delta <- read.csv("pow_diff_delta.csv")
language_deltaBind <- cbind(datalang_delta$EnglishStrong, datalang_delta$EnglishWeak, datalang_delta$RussianStrong, datalang_delta$RussianWeak)
language_deltaModel <- lm(language_deltaBind ~ 1)
analysis1 <- Anova(language_deltaModel, idata = idatalang, idesign = ~Language * Sharpness)
print(summary(analysis1, multivariate=FALSE))

itc_delta_ttests=read.csv("pow_diff_delta_ttests.csv")
print(pairwise.t.test(itc_delta_ttests$PowerDifference, itc_delta_ttests$Condition, p.adj = "none", paired = TRUE))

datalang_theta <- read.csv("pow_diff_theta.csv")
language_thetaBind <- cbind(datalang_theta$EnglishStrong, datalang_theta$EnglishWeak, datalang_theta$RussianStrong, datalang_theta$RussianWeak)
language_thetaModel <- lm(language_thetaBind ~ 1)
analysis2 <- Anova(language_thetaModel, idata = idatalang, idesign = ~Language * Sharpness)
print(summary(analysis2, multivariate=FALSE))

itc_theta_ttests=read.csv("pow_diff_theta_ttests.csv")
print(pairwise.t.test(itc_theta_ttests$PowerDifference, itc_theta_ttests$Condition, p.adj = "none", paired = TRUE))

datalang_alpha <- read.csv("pow_diff_alpha.csv")
language_alphaBind <- cbind(datalang_alpha$EnglishStrong, datalang_alpha$EnglishWeak, datalang_alpha$RussianStrong, datalang_alpha$RussianWeak)
language_alphaModel <- lm(language_alphaBind ~ 1)
analysis3 <- Anova(language_alphaModel, idata = idatalang, idesign = ~Language * Sharpness)
print(summary(analysis3, multivariate=FALSE))

itc_alpha_ttests=read.csv("pow_diff_alpha_ttests.csv")
print(pairwise.t.test(itc_alpha_ttests$PowerDifference, itc_alpha_ttests$Condition, p.adj = "none", paired = TRUE))

