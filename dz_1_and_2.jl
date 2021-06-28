using Core: Matrix
using Base: Integer
#задача 1 
function reverse_user!(v::Vector)::Vector
    len = length(v)
    for i in 1:div(len-1, 2, RoundDown) 
        v[i],v[len-i+1] = v[len-i+1],v[i] 
    end
    return v 
end

function reverse_user!(a, dims = 2)::Matrix 
    l = length(v)
    for i in 1:div(l-1, 2, RoundDown) 
        a[i],a[l-i+1] = a[l-i+1],a[i] 
    end
    return v
end
#задача 2 
function copy_user!(v::Vector)::Vector
    copy_zero_vect = zero(length(v)) 
    for i in 1:length(v)
        copy_zero_vect[i] = v[i] 
    end
    return copy_zero_vect
end

function copy_user!(a, dims = 2)::Matrix
    copy_zero_matrix = zeros(Int, length(a)) 
    for i in 1:length(a)
        copy_zero_matrix[i] = a[i] 
    end
    return copy_zero_matrix
end
#Задача 3 
function bubblesort!(v::Vector)::Vector
    len = length(v)
    for i in 1:len-1
        for j in 2:len    
            if v[j-1] > v[j]
                v[j-1],v[j] = v[j],v[j-1]
            end
        end
    end
    return v
end

bubblesort(v::Vector)::Vector = bubblesort!(deepcopy(v)) 

function bubblesortperm!(v::Vector)::Vector
    len = length(a)
    ind = collect(1:len) 
    for i in 1:len-1
        fl = false
        
        for j in 1:len-i
            if a[j]>a[j+1]
                a[j],a[j+1] = a[j+1],a[j]
                ind[j],ind[j+1] = ind[j+1],ind[j]
                fl = true
            end
        end
        
        if fl == false
            break
        end
    
    end
    return ind
end

bubblesortperm(v::Vector)::Vector=bubblesortperm!(deepcopy(a))

#Задача 4 
function bubblesort!(A::Matrix)::Matrix
    for i in size(A,2) 
        bubblesort!(@view A[:,i]) 
    end
    return A
end
bubblesort(A::Matrix)=bubblesort!(deepcopy(A))

function bubblesortperm!(A::Matrix)
    ind=Matrix{Int}(undef,size(A)) 
    for i in size(A,2)
        ind[:,i]=bubblesortperm!(@view A[:,i]) 
    end
#Задача 5
function sortkey!(key_values, a)
    ind = sort_bubble_perm!(key_values)
    return @view a[ind]
end
#Задача 7 
function insertsort!(a)
    len = length(a)
    for i in 2:len
        j = i - 1
        while j > 0 && a[j] > a[j+1]
            a[j+1],a[j] = a[j],a[j+1]
            j -= 1
        end 
    end
    return a    
end

insertsort(a) = insertsort!(copy(a))

function insertsortperm!(a)
    len = length(a)
    arr = []
    for i in 1:len
        push!(arr, i)
    end
    for i in 2:len
        j = i - 1
        while j > 0 && a[j] > a[j+1]
            a[j+1], a[j] = a[j], a[j+1]
            arr[j+1],arr[j] = arr[j],arr[j+1]
            j -= 1
        end 
    end
    return arr
end

insertsortperm(a) = insertsortperm!(copy(a))
#Задача 8 
insertsort!(A)=reduce(1:length(A))do _, k 
    while k>1 && A[k-1] > A[k]
        A[k-1], A[k] = A[k], A[k-1]
        k -= 1
    end
    return A
end