kegg <- read.csv("kegg.csv",header=TRUE)
x <- kegg$mNum -1 
m <- kegg$MNum
k <- kegg$nNum
n <- kegg$NNum - kegg$MNum
pvalue <- phyper(x,m,n,k,lower.tail = FALSE)
qvalue <- p.adjust(pvalue,method="BH")
mNum <- kegg$mNum
nNum <- kegg$nNum
MNum <- kegg$MNum
NNum <- kegg$NNum
Term <- kegg$KO
result <- cbind(mNum,nNum,MNum,NNum,pvalue,qvalue)
rownames(result) <- Term
write.table(result,file = "kegg.enrich.txt",sep = "\t")
