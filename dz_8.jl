#Задача 3
function quicsort!(a)
    if isempty(a)
        return a
    end
    a, i, j = partsort!(a,a[begin]) 
    quicsort!(@viev a[begin:i])
    quicsort!(@viev a[j+1:end])
    return a
end
#Задача 4
function dfs(start_ver::T, graph::ConnectList{T}) where T

    function dfs!(v)
        println(v) 
        mark[v]=true 
        for u in graph[v]
            if !mark[u]
                dfs!(u)
            end
        end
    end

    n=length(graph)
    mark=zeros(Bool, n)

    dfs!(start_ver)
end