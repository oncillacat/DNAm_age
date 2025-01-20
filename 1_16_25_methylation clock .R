#3_13 methylation clock attampt2 
library(sesame)
library(ggplot2)
load("pD_Methyl.Rdata")

idat_dir = 'IDAT'
betas = openSesame(idat_dir, func = getBetas, mask = F)
setwd("mDNA_clocks")
anno_1 <- readRDS("Clock_Zhou347.rds")

DNAmAge <- NA
exp <- data.frame(id = colnames(betas),DNAmage = NA) 
for (i in 1:24) {
  DNAmAge <- predictAge(betas[,i],anno_1)
  exp$DNAmage[i] <- DNAmAge
}

pD$DNAmAge <- exp$DNAmage
View(exp_C57)

pD$group <- as.factor(pD$group)
ggplot(pD,aes(x=group,y=DNAmAge)) + geom_boxplot(fill=  "gray" )+ geom_jitter()+
  theme_bw()+
  theme(panel.grid.major.x = element_blank())

