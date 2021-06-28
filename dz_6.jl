#Задача 1. 
function merge(A::Vector{T},B::Vector{T})::Vector{T} where T
    i = 1
    j = 1
    С = Vector{Int}(undef,length(A)+length(B))
    for it1 in 1:length(A)
        C[it1+it2-1] = A[it1]
        if (A[it1] < B[it2]) && (it2 < length(B)) #
            C[it1+it2-1] = B[it2]
            it2+=1
        end
    end
    return C
end
#Задача 2 
function sort_b_arr(V::Vector{T},b::Int64)::Vector{T} where T
    V1 = Vector{Int}(undef,0)
    V2 = Vector{Int}(undef,0)
    V3 = Vector{Int}(undef,0)
    for i in V
        if (i < b)
            push!(V1,i)
        elseif (i == b)
            push!(V2,i)
        elseif (i > b)
            push!(V3,i)
        end
    end
    return append!(append!(V1,V2),V3)
end
#Задача 3
function sort_(A::Vector{T},b::Int64)::Vector{T} where T
    V1 = Vector{Int}(undef,0)
    V2 = Vector{Int}(undef,0)
    for i in A
        if (i<=b)
            push!(V1,i)
        else
            push!(V2,i)
        end
    end
    return append!(V1,V2)
end