using Core: Matrix
#Задача 1. 
function findallmax(a::AbstractVector)::AbstractVector{Int}
    i_max=Vector{Int}(undef,size(a))
    i_max[begin]=firstindex(a)
    n = firstindex(i_max)
    for i in firstindex(a)+1:lastindex(a)
        if A[i]>A[i_max[end]]
            i_max[begin]=i
            n = firstindex(i_max)
        elseif A[i]==A[i_max[end]]
            n+=1
            i_max[n]=i
        end
    end
    return resize!(i_max,n)
end
#Задача 2. 
function bubble_sort_improving_part_1(v::Vector)::Vector 
    len=length(v)
    ind = 1
    for i in ind:len-1
        for j in ind + 1:len
            
            if v[j-1] > v[j]
                v[j-1],v[j] = v[j],v[j-1]
            end
        
        end
        ind += 1
    end
    return v
end
#Задача 3. 
function bubble_sort_improving_part_2(v::Vector)::Vector
    right=lastindex(v)
    while (left < right)
        for i in right:-1:left+1
            if (v[i-1] > v[i])
                v[i-1],v[i] = v[i],v[i-1]
            end
        end
        left =+ 1
        for i in left+1:right
            if (v[i-1] > v[i])
                v[i-1],v[i] = v[i],v[i-1]
            end
        end
        right -= 1
    end
    return(v)
end
#Задача 5 
function slice(A::Vector{T},p::Vector{Int})::Vector{T} where T
    return A[p]
end
#Задача 6 
function permute_!(A::Vector{T},perm::Vector{Int})::Vector{T} where T
    temp = 0
    for i in perm
        if perm[i] != i
            temp = A[perm[i]]
            A[perm[i]] = A[i]
        end
    end
    return A
end
#Задача 7 
function deleteat!(V::Vector{T},at::Int)::Vector{T} where T
    answ_vector = Vector{Int}(undef,length(V)-1)
    i = 1
    j = 1
    while (i < length(V))
        if j != at
            answ_vector[i] = V[j]
            i += 1
        end
        j += 1
    end
    return answ_vector
end
function insertat!(V::Vector{T},at::Int,value::T)::Vector{T} where T
    answ_vector = Vector{Int}(undef,length(V)-1)
    i = 1
    j = 1
    while (at <= length(answ_vector))
        if j == at
            answ_vector[i] = value
            j -= 1
            at =- 1
        else
            answ_vector[i] = A[j]
        end
        j += 1
        i += 1
    end
    return answ_vector
end
