using Core: Matrix
#Задача 1 
function T1(n,x)
    sum = 1
    fact = 1
    for i in 1:n
        fact *= i
        if (i%2 == 0)
            sum += (((-1)^((i/2) % 2)) * (x^i))/fact
        end
    end
    return sum
end
#Задача 2 
function T2(x,?)
    sum,fact = 1,1
    i,a = 1,1
    while (abs(a) > ?)
        fact *= i
        if (i%2 == 0)
            a = (((-1)^((i/2)%2))*(x^i))/fact
            sum += a
        end
        i += 1
    end
    return sum
end
#Задача 5. 
function bessel(m,x)
    sum = 1/factorial(m)
    i,a = 1,1
    while (abs(a) > ?)
        a *= ((-1)/(i*(i+m)))*(x/2)*(x/2)
        sum += a
        i += 1
    end
    sum *= (x/2)^m
    return sum
end
#Задача 6
function linsolve(A::AbstractMatrix,b::AbstractVector)
    x=similar(b)
    for k in reverse(eachindex) 
        x[k] = (b[k]-sum((@view A[k,k+1:lastindex(A,2)]).*(@view x[k+1:lastindex(x)])))
    end
    return x
end
#Задача 7.
function convert!(A)
    for k in firstindex(A,1):lastindex(A,1)
        imax = argmax(abs, @view A[k:end,k])
        colon_to_zeros!(A,k,imax)
end

function colon_to_zeros(A,k,imax)
    if imax != k
        A[k,:], A[imax,:] = A[imax,:], A[k,:] 
    end
    for i in k+1:lastindex(A,1)
        if isappoxzero(A[i,k]) 
            continue
        end
        t=-A[i,k]/A[k,k]
        A[i,i:end] += t*(@view A[k,i:end])  
    end
end
