#----------Homework solution----------
counter <- 0
number <- 1000
value <- rnorm(number)

for(i in value)
  if(i >= -1 && i <= 1) {
    answer <- "Y"
    print(counter)
    counter <- counter + 1
  } else {
    answer <- "N"
  }

mean <- counter/number
mean