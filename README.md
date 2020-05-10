# RandomBasedArrays

[![Build Status](https://travis-ci.com/giordano/RandomBasedArrays.jl.svg?branch=master)](https://travis-ci.com/giordano/RandomBasedArrays.jl)
[![Build Status](https://ci.appveyor.com/api/projects/status/github/giordano/RandomBasedArrays.jl?svg=true)](https://ci.appveyor.com/project/giordano/RandomBasedArrays-jl)
[![Codecov](https://codecov.io/gh/giordano/RandomBasedArrays.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/giordano/RandomBasedArrays.jl)
[![Coveralls](https://coveralls.io/repos/github/giordano/RandomBasedArrays.jl/badge.svg?branch=master)](https://coveralls.io/github/giordano/RandomBasedArrays.jl?branch=master)

## Introduction

![image](https://imgs.xkcd.com/comics/donald_knuth.png)

*Image credit: "[xkcd: Donald Knuth](https://xkcd.com/163/)" ([CC-BY-NC
2.5](https://creativecommons.org/licenses/by-nc/2.5/))*

`RandomBasedArrays.jl` is a hassle-free package in the Julia programming
language for dealing with arrays: every time you access an element of an array,
the first index is random, so you don’t have to remember whether Julia uses 0-
or 1-based indexing: you simply cannot ever know what the initial element will
be.

## Installation

The latest version of `RandomBasedArrays.jl` is available for Julia v1.0 and
later releases, and can be installed with [Julia built-in package
manager](https://julialang.github.io/Pkg.jl/stable/).  In a Julia session, after
entering the package manager mode with `]`, run the command

```julia
pkg> add RandomBasedArrays
```


## Usage

```julia
julia> using RandomBasedArrays

julia> A = RandomBasedArray(reshape(collect(1:25), 5, 5))
5×5 Array{Int64,2}:
 15   7   4   2   6
  7  10  10   9  18
  8   7  16   6  13
  2  21  17  13   2
 22   6  18  19  20

julia> A
5×5 Array{Int64,2}:
 15   3   6  12   8
 20   3   6  22   7
 22   2  20  15   7
 18  22  16   1   3
  1   5   6   6  13

julia> A
5×5 Array{Int64,2}:
  8  14   2  18   1
  7  17   8  19   4
 25  17  15   8  15
  6  19  10  23  23
  7   8   1  22  25

julia> A[-35]
6

julia> A[-35]
9

julia> A[-35]
4

julia> A[28,-19] = 42
42

julia> A
5×5 Array{Int64,2}:
 13  16   3  25   9
 23  20  16  18   1
  5  17  21   6   8
  5   3  42  10  13
 25   6  23   4  11

julia> A
5×5 Array{Int64,2}:
  9  25  25   3   3
  4  14   9   7  18
 22  14  13  21   2
 11  12  19  14  19
 19   2  21   2  21

julia> A
5×5 Array{Int64,2}:
 14  42  21  21  25
 14   8  24  13  17
  6   4  23  12   4
 12   6  19  11   8
  6  12   2  18   3
```

## Related projects

* [`OffsetArrays.jl`](https://github.com/JuliaArrays/OffsetArrays.jl):
  Fortran-like arrays with arbitrary, zero or negative starting indices
* [`TwoBasedIndexing.jl`](https://github.com/simonster/TwoBasedIndexing.jl):
  Two-based indexing

## License

The `RandomBasedArrays.jl` package is licensed under the MIT "Expat" License.
The original author is Mosè Giordano.
