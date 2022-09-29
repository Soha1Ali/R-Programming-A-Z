#----------Logical operators----------
4 < 5 
10 > 100
4 == 5
4 != 5

# == 
# != 
# <
# >
# <= 
# >= 
# !

# &
# isTRUE(x)

#----------While loop----------
while(FALSE){
  print("Hello")
}

counter <- 1
while(counter < 12){
  print(counter)
  counter <- counter + 1 
}

#For loop

for(i in 1:5){
  print("Hello")
}

#----------If statements----------

#Nested
rm(answer)
x <- rnorm(1)
if(x > 1) {
  answer <- "Greater than 1"
} else{
  if(x >= -1){
    answer <- "Between -1 and 1"
  } else{
    answer <- "Less than -1"
  }
}

#Chaining
rm(answer)
x <- rnorm(1)
if(x > 1) {
  answer <- "Greater than 1"
} else if(x >= -1){
  answer <- "Between -1 and 1"
} else{
  answer <- "Less than -1"
}










