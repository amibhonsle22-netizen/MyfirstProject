a <- matrix(56)
a[1,1]
db1_var <- c(1, 2, 4)
typeof(db1_var)

db1_var <- c(1L, 2L, 4L)
typeof(db1_var)


dbl_var <- c(1, c(2, c(3,4)))
dbl_var2 <- c(1, 2, 3, 4)
dbl_var == dbl_var2

class(db1_var == db1_var2)

is. logical(db1_var == db1_var2)

dbl_var2 <- c(1L, 2L, 3L, 4)
is.integer(dbl_var2)
is.double(dbl_var2)

dbl_var2 <- c(1L, 2L, 3L, 4L)
is.integer(dbl_var2)
is.double(dbl_var2)

#Coercion
str(c("a" , 1))

x <- c(FALSE, FALSE, TRUE)
typeof(x)
as.numeric(x)
as.character(x)
typeof(sum(x))

#Lists
x <- list(1:3, "a", c(TRUE, FALSE, TRUE), c(2.3, 5.9))
str(x)
x[[1]][2]

x <- list(list(1, 2), c(3, 4))
y <- c(list(1, 2), c(3, 4))
x
y
str(x)
str(y)

