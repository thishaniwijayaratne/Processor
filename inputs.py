# A basic code for matrix input from user
# import numpy as np
  
R = int(input("Enter the number of rows:"))
C = int(input("Enter the number of columns:"))
  
# Initialize matrix
matrix = []
print("Enter the entries row-wise:")
  
# For user input
for i in range(R):          # A for loop for row entries
    a =[]
    for j in range(C):      # A for loop for column entries
        # This should have the entries which check whether each of the values enterred in the matrix are more than the val

         a.append(int(input())) #"Enter row",i, " column ",j," :"
    matrix.append(a)

print((matrix))

# For printing the matrix
# for i in range(R):
#     for j in range(C):
#         print(matrix[i][j], end = " ")
#     print()