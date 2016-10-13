library(ggplot2)
data <- read.table("exon_num.txt",header=FALSE,sep="\t")
p <- ggplot(data,aes(x=data$V1,y=data$V2,fill=data$V1)) + geom_boxplot() + theme_bw()
p + labs(title = "Boxplot for exon numbers") + xlab("Class") + ylab("Exon Numbers") + 
  theme(axis.title.x = element_text(size = 18,colour = "black"),axis.title.y = element_text(size=18,colour = "black"),
        axis.text.x = element_text(size = 18,colour = "black"),axis.text.y = element_text(size=18,colour = "black"),
        plot.title = element_text(size=18,color="black"),panel.grid=element_blank(),legend.title=element_text(color="black",size = 18),
        legend.text = element_text(color="black",size=18)) + guides(fill = guide_legend(title="Class"))
ggsave("exon_boxplot.png",width=4.5,height = 5)
