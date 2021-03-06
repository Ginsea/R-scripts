options(rgl.useNULL=TRUE)
library(shiny)
library(ggplot2)
d <- read.table("go.txt",header=T,sep="\t")
d$Terms<-factor(d$Terms,unique(as.character(d$Terms)))
colnames(d) <-c("Ontology","Terms","mNum","nNum","MNum","NNum","pvalue","qvalue")
p <- ggplot(d)+geom_bar(aes(x=Terms,y=-log10(pvalue),fill=Ontology),stat="identity")+geom_text(aes(x=Terms,y=-log10(pvalue) + 0.02,label=d$mNum),size=7)+coord_flip()+xlab("GO Description")+ylab("-log10(P-value)")+labs(title="Go enrichment bar")
last_plot() + theme(plot.title = element_text(size = 25, colour = "blue",face="bold"),axis.title.x=element_text(size = 20, colour = "black"),axis.title.y=element_text(size=20),axis.text.y = element_text(size=15,colour = "black"),axis.text.x = element_text(size=25,colour = "black"),legend.title = element_text(size=15),legend.text = element_text(size=15))
ggsave(file="gobar.png",width=30,height=20)
ggsave(file="gobar.pdf",width=30,height=20)
