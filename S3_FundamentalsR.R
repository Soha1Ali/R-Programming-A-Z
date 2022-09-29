#----------Vectors----------

#Facts:
  #-Vectors can only contain one data type
  #-You can add, multiple, divide, etc vectors
  #-If you add, multiple, divide, etc vectors that aren't the same size, r will recycle the smaller vector
  #-If the two vectors are not multiples of each other, r will still recycle but return an error


#Combine function 
vector1 <- c(1,2,3,4)

is.numeric(vector1) #TRUE
is.integer(vector1) #FALSE

#Sequence function
seq(1,5) #Output: [1] 1 2 3 4 5
seq(1,10,2) #Output: [1] 1 3 5 7 9

#Replicate function
rep(1,5) #Output: [1] 1 1 1 1 1
rep("a", 5)
rep(vector1, 3)

#Extracting elements 
vector2 <- c("a", "b", "c", "d", "e")

vector2[1] #The first element
vector2[2:4] #All elements between the 2nd and 4th elements
vector2[-2] #Everything but the second element
vector2[c(2,5)] #Only the 2nd and 5th elements
vector2[c(-2,-5)] #Everything except the 2nd and 5th elements
vector2[-3:-5] #Everything except elements between the 3rd and 5th elements





