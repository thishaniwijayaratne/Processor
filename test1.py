R1 = int(input("Enter the number of rows in mat1:"))
C1 = int(input("Enter the number of columns in mat1:"))
R2 = int(input("Enter the number of rows in mat2:"))
C2 = int(input("Enter the number of columns in mat2:"))
p=R1*C1
q=R2*C2
Out_M1=[]
Out_M2=[]
if (p<=1024 and q<=1024):#size check
    print("Enter the element in mat1")
    mat1 = [[int(input()) for x in range (C1)] for y in range(R1)]
    print("Enter the element in mat2")
    mat2 = [[int(input()) for x in range (C2)] for y in range(R2)]
    #print(mat1)
    #print(mat2)

    for i in mat1:
        for k in i:
            if (k>=-8191 and k<=8191):#value check
                Out_M1.append('{:032b}'.format(k))
            else:
                print ('wrong input')
                break
    

    for i in range(C2):
        for k in range(R2):
            if (mat2[k][i]>=-8191 and mat2[k][i]<=8191):#value check
                Out_M2.append('{:032b}'.format(mat2[k][i]))
            else:
                print ('wrong input')
                break
                
#print(Out_M1)
#print(Out_M2)
    
    
    textfile1 = open("1st_mat_file.txt", "w")
    for element in Out_M1:
        L1=''
        for digit in str(element):
            L1=L1+(str(digit) + "_")
        textfile1. write(L1[0:63])
        textfile1. write("\n")
        L1=''
    textfile1. close()
    textfile2 = open("2st_mat_file.txt", "w")
    for element in Out_M2:
        L2=''
        for digit in str(element):
            L2=L2+(str(digit) + "_")
        textfile2. write(L2[0:63])
        textfile2. write("\n")
        L2=''
    textfile2. close()
    
    textfile3 = open("3st_mat_file.txt", "w")
    L3=''
    for digit in str('{:032b}'.format(R1)):
        L3=L3+(str(digit) + "_")
    textfile3. write(L3[0:63])
    textfile3. write("\n")
    L3=''
    for digit in str('{:032b}'.format(C1)):
        L3=L3+(str(digit) + "_")
    textfile3. write(L3[0:63])
    textfile3. write("\n")
    for digit in str('{:032b}'.format(C1)):
        L3=L3+(str(digit) + "_")
    textfile3. write(L3[0:63])
    textfile3. write("\n")
    L3=''
    textfile3. close()
    
else:
    print('Matrix is too large')
