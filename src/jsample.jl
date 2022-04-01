ENV["PYTHON"] = "/usr/local/bin/python"
import Pkg
using Pkg
Pkg.add(["PyCall"])
Pkg.build(["PyCall"])
using PyCall

if PyVector(pyimport("sys")["path"])[1] != ""
    pushfirst!(PyVector(pyimport("sys")["path"]), "")
end

sample = pyimport("pysample")
total = sample.sum(10, 20)
println("total:", total)