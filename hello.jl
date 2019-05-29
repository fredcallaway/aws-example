using Distributed
ips = open("ips.txt") do f
    collect(eachline(f))
end

addprocs([(ip, :auto) for ip in ips], tunnel=true, topology=:master_worker)
@everywhere using Sockets
@everywhere using Distributions
pmap(1:30) do i
    sleep(0.2)
    println(i, "  from ", getipaddr())
end