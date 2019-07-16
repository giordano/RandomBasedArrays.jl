module RandomBasedArrays

export RandomBasedArray

struct RandomBasedArray{T,N,P<:AbstractArray} <: AbstractArray{T,N}
    parent::P
end
RandomBasedArray(p::P) where {T,N,P<:AbstractArray{T,N}} =
    RandomBasedArray{T,N,P}(p)

index(p::AbstractArray) = rand(eachindex(p))

Base.parent(A::RandomBasedArray) = A.parent
Base.size(A::RandomBasedArray) = size(parent(A))
Base.getindex(A::RandomBasedArray, ::Int) =
    @inbounds getindex(parent(A), index(parent(A)))
Base.getindex(A::RandomBasedArray{T,N}, ::Vararg{Int,N}) where {T,N} =
    getindex(parent(A), Base._ind2sub(parent(A), index(parent(A)))...)
Base.setindex!(A::RandomBasedArray, v, ::Int) =
    @inbounds setindex!(parent(A), v, index(parent(A)))
Base.setindex!(A::RandomBasedArray{T,N}, v, ::Vararg{Int,N}) where {T,N} =
    setindex!(parent(A), v, Base._ind2sub(parent(A), index(parent(A)))...)
# Show a fixed copy of the array, otherwise the alignment algorithm would get
# crazy trying to show a "mutating" array
Base.show(io::IO, m::MIME"text/plain", A::RandomBasedArray) = show(io, m, copy(A))

end # module
