include("graph.jl")
include("edgecore.jl")
using LinearAlgebra


fname = open("filename.txt", "r")
str   = readline(fname)
n     = parse(Int, str)
eta   = 0.8;
for i = 1 : n
    str = readline(fname)
    str = split(str)
    G   = get_graph(str[1])
    #fout = open(string("data/","finnal.ans"),"a")
    #println("Now running file:",str[1],"with eps=",ep);
    for k= 1 : 3
        ep = 0.1*k;
        println("Now running file:",str[1],"with eps=",ep);
        fout = open(string("data/","time.ans"),"a");
        print(fout,str[1]," ");
        greed = gre(G,G.k ,ep,eta,fout);
        println(fout," ");
        println("gre=",greed);
        close(fout);
    end
    fout = open(string("data/","time.ans"),"a");
    print(fout,str[1]," ");
    println("Now running file:",str[1]," exactly");
    exact=exa(G,G.k,eta,fout);
    println("exa=",exact);
    close(fout);
end

close(fname)
