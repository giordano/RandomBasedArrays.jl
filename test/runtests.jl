using RandomBasedArrays
using Random, Test

@testset "RandomBasedArrays.jl" begin
    Random.seed!(1)
    p = reshape(collect(1:6), 2, 3)
    A = RandomBasedArray(p)
    @test parent(A) === p
    @test parent(A) == [1 3 5; 2 4 6]
    @test size(A) === size(p)
    @test A[42] == 1
    @test A[-35] == 1
    @test A[4,0] == 6
    A[-314] = 0
    @test parent(A) == [1 3 5; 2 0 6]
    A[0,0] = 42
    @test parent(A) == [1 3 5; 42 0 6]
    @test repr(A) == "[3 1 5; 5 5 1]"
end
