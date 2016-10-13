options(rgl.useNULL=TRUE)

library(shiny)
library(ggplot2)

data <-read.table("kegg.enrich.txt",header=T,sep="\t")

colnames(data)<-c("ID","mNum","nNum","MNum","NNum","p_value","qvalue")

data$ID<-gsub("^\\s*\\d{5}\\s+","",data$ID,perl=T)

p<-ggplot(data)+
          geom_point(aes(x=(mNum/MNum)*100,y=ID,size=mNum,color=p_value)) +theme_bw()+
          theme(
            plot.title=element_text(face="bold",vjust=0.5),
            axis.title.x=element_text(face="bold",vjust=-0.2),
            axis.title.y=element_text(face="bold"),
            axis.text.y=element_text(hjust=1.0,colour="black"),
            axis.text.x=element_text(angle=0,colour="black")
          )+ggtitle("Statistics of KEGG Pathway Enrichment")+
          ylab("Pathway")+
          xlab("Percent(%)")

ggsave(file="kegg.pdf",height = 14,width = 7)
ggsave(file="kegg.png",height = 14,width = 7)
