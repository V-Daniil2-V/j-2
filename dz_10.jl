#Задача 1.
function newton(r::Function, x; ?_x = 1e-8, ?_y = 1e-8, nmaxiter = 20)
    x_k = x
    i = 0
    while (i <= nmaxiter && (abs(x_k-x) > ?_x || x_k == x))
        x = x_k
        x_k = x - r(x)
        i+=1
    end
    if (i > nmaxiter)
        return nothing
    else
        return x_k
    end
end
#Задача 2. 
newton(x->(x-cos(x))/(1+sin(x)), 0.5)
#Задача 3. 
newton(ff::Tuple{Function,Function}, x; ?_x=1e-8, ?_y=1e-8, nmaxiter=20) = newton(x->ff[1](x)/ff[2](x), x; ?_x, ?_y, nmaxiter)
#Задача 4. 
newton((x->x-cos(x), x->1+sin(x)), 0.5) 
#Задача 5. 
newton(ff, x; ?_x=1e-8, ?_y=1e-8, nmaxiter=20) = newton(x->(y=ff(x); y[1]/y[2]), x; ?_x, ?_y, nmaxiter)
#Задача 6. 
newton(x->(x-cos(x),1+sin(x)), 0.5) 
#Задача 7.
newton(polinom_coeff::Vector{Number}, x; ?_x=1e-8, ?_y=1e-8, nmaxiter=20) = newton(x->(y=evaldiffpoly(x, polynom_coeff); y[1]/y[2]), x; ?_x, ?_y, nmaxiter)

function evaldiffpoly(x,polynom_coeff)
    Q?=0
    Q=0
    for a in polinom_coeff
        Q?=Q?x+Q
        Q=Q*x+a
    end
    return Q, Q?
end