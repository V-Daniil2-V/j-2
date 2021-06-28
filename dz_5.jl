#Задача 1
function evaldiffpoly(x,A)
    Q′′=0
    Q′=0
    Q=0
    for a in A
        Q′′=Q′′x+Q′
        Q′=Q′x+Q
        Q=Q*x+a
    end
    return Q, Q′,Q′′
end
#Задача 2
function evaldiffpoly(x,A)
    Q′′′=0
    Q′′=0
    Q′=0
    Q=0
    for a in A
        Q′′′=Q′′′x+Q′′
        Q′′=Q′′x+Q′
        Q′=Q′x+Q
        Q=Q*x+a
    end
    return Q, Q′,Q′′
end