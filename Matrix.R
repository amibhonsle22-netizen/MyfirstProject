vec1 <- 1:10
vec2 <- seq(1,100,10)
vec3 <- seq(1,2,lenght.out=10)
matrix1 <- cbind(vec1,vec2,vec3)
sample <- c("sample1","sample2","sample3","sample4", "sample5", "sample6", "sample7", "sample8", "sample9","sample10")
df1 <- data.frame(cbind(sample, matrix))
typeof(df1)
df1
df1 <- data.frame(sample, matrix)
typeof(df1)
df1
