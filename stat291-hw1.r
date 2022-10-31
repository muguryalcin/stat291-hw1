# QUESTION 1

# Create the following matrix in R.
## [,1] [,2] [,3]
## [1,] 2.91 1.09 3.420
## [2,] 0.70 0.50 2.330
## [3,] 0.09 0.32 1.220
## [4,] 1.25 2.00 2.333
## [5,] 1.01 1.98 0.340

q1_matrix <- matrix(rbind(
    c(2.91, 1.09, 3.420),
    c(0.70, 0.50, 2.330),
    c(0.09, 0.32, 1.220),
    c(1.25, 2.00, 2.333),
    c(1.01, 1.98, 0.340)
), nrow = 5, ncol = 3)
q1_matrix

# Assign the names of the columns of the matrix given in part a) as "COL1", "COL2", and "COL3", respectively. Then print the new matrix.
colnames(q1_matrix) <- c("COL1", "COL2", "COL3") # Setting column names
q1_matrix

# Select the element in the 1st column and 5th row of the matrix given in part a.
q1_matrix[5, 1] # 1st column of 5th row

# Select the elements in the 2nd column of the matrix given in part a.
q1_matrix[, 2] # 2nd column

# Take the natural logarithm of the elements of this matrix.
log(q1_matrix)

# Round off the elements of the matrix given in part (e) up to 2 digits. Assign the name log_mat to the resulted matrix. Then print log_mat.
log_mat <- round(log(q1_matrix), 2)
log_mat

# Take the transpose of the matrix in part (f).
t(log_mat)

# Multiply the matrix in part (f) with the one you obtained in part (g).
log_mat %*% t(log_mat)

# Create a new square matrix (named sqr_mat) by omitting the third and fourth rows of the matrix given in part a. Print sqr_mat.
sqr_mat <- q1_matrix[-c(3, 4), ]
sqr_mat

# Multiply the matrix given in part (i) with its inverse. Round the elements of the resulted matrix up to 2 digits.
round(solve(sqr_mat) %*% sqr_mat,2)

# Change the number in the 1st row and 1st column of the matrix in part a with the value 3.1. Print the matrix again.
q1_matrix[1, 1] <- 3.1
q1_matrix

# QUESTION 2

# Create the following object in R. Assign the name “my_object”.

## $mymat
## [,1] [,2]
## [1,] 0 6
## [2,] 1 7
## [3,] 2 8
##
## $identity
## [,1] [,2]
## [1,] 1 0
## [2,] 0 1
##
## [[3]]
## [1] "S291" "S292"

my_object <- list(
    mymat = matrix(c(0, 1, 2, 6, 7, 8), nrow = 3, ncol = 2),
    identity = diag(2),
    c("S291", "S292")
)
my_object

# Extract the second element of x
my_object[[2]]

# Extract element named identity.
my_object$identity

# Extract first row of the second element.
my_object[[2]][1, ]

# Create a sub list of the first and the third elements.
my_object[c(1, 3)]

# Change the numbers in the first column of the mymat object as follows: (1,2,3)
my_object$mymat[, 1] <- c(1, 2, 3)
my_object

# QUESTION 3

# Suppose that you have age, weight, sex (M=Male, F=Female) and tobacco (Y=smoker,N=non-smoker) information of 12 subjects.

# Create the following data frame in R.
##   age weight sex tobacco
## 1 47 119 M Y
## 2 56 76 M Y
## 3 46 53 M Y
## 4 70 58 M Y
## 5 82 65 M N
## 6 32 43 F N
## 7 45 95 F N
## 8 39 56 F N
## 9 21 71 F N
## 10 18 42 F N
## 11 27 61 F N
## 12 58 72 F N

age_data <- c(47, 56, 46, 70, 82, 32, 45, 39, 21, 18, 27, 58)
weight_data <- c(119, 76, 53, 58, 65, 43, 95, 56, 71, 42, 61, 72)
sex_data <- c("M", "M", "M", "M", "M", "F", "F", "F", "F", "F", "F", "F")
tobacco_data <- c("Y", "Y", "Y", "Y", "N", "N", "N", "N", "N", "N", "N", "N")
data <- data.frame(age = age_data, weight = weight_data, sex = sex_data, tobacco = tobacco_data)
data
# Check the dimension of your data.
dim(data)

# What is the class of age variable?
class(data$age)

# Create a new data frame including only sex and tobacco. Print the resulted data frame.
data2 <- data[, c("sex", "tobacco")]
data2

# Pick the subjects with "age" higher than or equal to 47 in this data set.
data[data$age >= 47, ]

# Pick the observations for male subjects only.
data[data$sex == "M",  ]

# Obtain the weight and age information for subjects whose ages are higher than the mean age.
data[data$age > mean(data$age), c("weight", "age")]

# Pick only the "age" values of the subjects that have "weight" less than or equal to 82, and "tobacco"="Y" in this data set.
data[data$weight <= 82 & data$tobacco == "Y", "age"]