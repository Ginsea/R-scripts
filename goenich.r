go <- read.csv("Molecular_Function.csv",header=TRUE,)
x <- go$mNum -1 
m <- go$MNum
k <- go$nNum
n <- go$NNum - go$MNum
pvalue <- phyper(x,m,n,k,lower.tail = FALSE)
qvalue <- p.adjust(pvalue,method="BH")
mNum <- go$mNum
nNum <- go$nNum
MNum <- go$MNum
NNum <- go$NNum
Term <- go$Terms
result <- cbind(mNum,nNum,MNum,NNum,pvalue,qvalue)
rownames(result) <- Term
write.table(result,file = "MF.go.txt",sep = "\t")
