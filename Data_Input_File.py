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
                Out_M1.append(k)
            else:
                print ('wrong input')
                break
    while len(Out_M1)<1024:
        Out_M1.append(0)
        
        
    
        

    for i in range(C2):
        for k in range(R2):
            if (mat2[k][i]>=-8191 and mat2[k][i]<=8191):#value check
                Out_M2.append(mat2[k][i])
            else:
                print ('wrong input')
                break
    while len(Out_M2)<2048:
        Out_M2.append(0)
    L=Out_M1+Out_M2            
    #print(len(L))
    
    
    textfile1 = open("last.txt", "w")
    for element in L:
        
        textfile1. write('%d\n' % element)
    textfile1. write('%d\n' % R1)
    textfile1. write('%d\n' % C1)
    textfile1. write('%d\n' % C2)
    textfile1. close()
    
else:
    print('Matrix is too large')
