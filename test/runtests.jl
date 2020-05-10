using RandomBasedArrays
using StableRNGs, Test

@testset "RandomBasedArrays.jl" begin
    rng = StableRNG(42)
    p = reshape(collect(1:6), 2, 3)
    A = RandomBasedArray(p, rng)
    @test parent(A) === p
    @test parent(A) == [1 3 5; 2 4 6]
    @test size(A) === size(p)
    @test A[42] == 2
    @test A[-35] == 1
    @test A[4,0] == 5
    A[-314] = 0
    @test parent(A) == [0 3 5; 2 4 6]
    A[0,0] = 42
    @test parent(A) == [42 3 5; 2 4 6]
    @test occursin(r"2×3 Array{Int[2346]+,2}:\n 42 +6 +3\n +6 +3 +42", repr("text/plain", A))
end
