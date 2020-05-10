module RandomBasedArrays

using Random

export RandomBasedArray

const _default_rng = if VERSION < v"1.3"
    () -> Random.GLOBAL_RNG
else
    Random.default_rng
end

struct RandomBasedArray{T,N,P<:AbstractArray,R<:AbstractRNG} <: AbstractArray{T,N}
    parent::P
    rng::R
end
RandomBasedArray(p::P, rng::R = _default_rng()) where {T,N,P<:AbstractArray{T,N},R<:AbstractRNG} =
    RandomBasedArray{T,N,P,R}(p, rng)

index(A::RandomBasedArray) = rand(A.rng, eachindex(parent(A)))

Base.parent(A::RandomBasedArray) = A.parent
Base.size(A::RandomBasedArray) = size(parent(A))
Base.getindex(A::RandomBasedArray, ::Int) =
    @inbounds getindex(parent(A), index(A))
Base.getindex(A::RandomBasedArray{T,N}, ::Vararg{Int,N}) where {T,N} =
    getindex(parent(A), Base._ind2sub(parent(A), index(A))...)
Base.setindex!(A::RandomBasedArray, v, ::Int) =
    @inbounds setindex!(parent(A), v, index(A))
Base.setindex!(A::RandomBasedArray{T,N}, v, ::Vararg{Int,N}) where {T,N} =
    setindex!(parent(A), v, Base._ind2sub(parent(A), index(A))...)
Base.show(io::IO, m::MIME"text/plain", A::RandomBasedArray) = show(io, m, copy(A))

end # module
