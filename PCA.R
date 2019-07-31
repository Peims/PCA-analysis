
library(gmodels)
inname = "pca1.txt"      
outname = "PCA.pdf" 
expr <- read.table(inname, header=T, row.names=1,sep="\t")
data <- t(expr)  
data.pca <- fast.prcomp(data,retx=T,scale=T,center=T)

library(ggplot2)
pdata<- data.frame('pca1'=data.pca$x[,1],'pca2'=data.pca$x[,2])
library(tibble)
library(ggrepel)
pdata<-rownames_to_column(pdata,'sample')
dev.off()
ggplot(pdata)+geom_point(aes(x=pca1,y=pca2,color=sample),show.legend=FALSE)+
  geom_hline(yintercept=0,lty=4,lwd=0.6,alpha=0.8)+
  geom_vline(xintercept=0,lty=4,lwd=0.6,alpha=0.8)+
  labs(title="PCA")+
  theme(plot.title = element_text(hjust = 0.5))#+
  #geom_text(data=pdata, aes(label=sample,x=pca1,y=pca2),col="black",alpha = 0.8)
  #geom_text_repel(data=pdata, aes(label=sample,x=pca1,y=pca2),col="black",alpha = 0.8)

