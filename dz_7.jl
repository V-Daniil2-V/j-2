#Задача 1. 
function pow(a, n::Integer)
    k, t, p = n, 1, a
    while k>0
        if (k%2 == 0)
            k?=2
            p*=p
        else
            k-=1
            t*=p
        end   
    end
return t
end
#Задача 3. 
function log(a::Real,x::Real,?::Real)
    z, t, y = x, 1, 0
while z > a || z < 1/a || t > ?   
    if z > a
        z /= a
        y += t # z^t = (z/a)^t * a^t
    elseif z < 1/a
        z *= a
        y -= t # z^t = (z*a)^t * a^-t
    else # t > ?
        t /= 2
        z *= z # z^t = (z*z)^(t/2)
    end
end
#Задача 4. 
function isprime(n::Int)::Bool
    d=2
    while (d*d<=n)
        if (n%d==0)
            return false
        end
        d+=1
    end
    return true
end
#Задача 5. 
function eratosphen(n::Integer)
    ser=fill(true,n)
    ser[1]=false
    k=2
    while k<n || k !== nothing
        ser[2k:k:end] .= false # но лучше: numser[k^2:k:end] .= false
        k=findnext(ser, k+1)
    end
    return findall(ser)
end
#Задача 6.
function factor(n)::Tuple
    if (isprime(n)) #если число простое
        return n,1
    end
    
    vector_delit = []
    vector_kratn = []
    
    del = 2
    n2=n
    k = 0
    
    while (del*del<=n && n2>1)
        if (isprime(del))
            if (n2%del == 0)
                push!(vector_delit,del)
                while (n2%del == 0)
                    n2 /= del
                    k += 1
                end
                push!(vector_kratn,k)
                k = 0
            end 
        end
        del += 1
    end
    if (n2 != 1)
        push!(vector_delit,Int(n2))
        push!(vector_kratn,1)
    end
    return vector_delit,vector_kratn
end
#Задача 7. 
function euler_function(n)
    if (isprime(n)) 
        return n-1
    else
        delit,kratn = factor(n) 
        res = 1
        for i in 1:length(delit)
            if (kratn[i] == 1)
                delit[i] -= 1
            else
                delit[i] = delit[i]^kratn[i] - delit[i]^(kratn[i]-1)
            end
            res *= delit[i]
        end
        return res
    end
end
#Задача 10 
function zerodivisors(n::Integer)::Vector
    v = [1]
    for i in 2:n
        if (gcd(n,i)==1) 
            push!(v,i)
        end
    end
    return v
end
#Задача 11. 
function allnilpotents(n::Integer)::StepRange{Int64,Int64}
    ans = []
    vect_del,d = factor(n) 
    m_group = 1
    for i in 1:length(vect_del)
        m_group *=vect_del[i] 
    end
    count = Int(n/m_group)
    for i in 1:count-1
        push!(ans,m_group*i)
    end
    return ans
end