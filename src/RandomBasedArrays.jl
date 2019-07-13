module RandomBasedArrays

export RandomBasedArray

struct RandomBasedArray{T,N,P<:AbstractArray} <: AbstractArray{T,N}
    parent::P
end
RandomBasedArray(p::P) where {T,N,P<:AbstractArray{T,N}} =
    RandomBasedArray{T,N,P}(p)

index(p::AbstractArray) = rand(eachindex(p))

Base.parent(A::RandomBasedArray) = A.parent
Base.size(A::RandomBasedArray) = size(A.parent)
Base.getindex(A::RandomBasedArray, ::Int) =
    @inbounds getindex(A.parent, index(A.parent))
Base.getindex(A::RandomBasedArray{T,N}, ::Vararg{Int,N}) where {T,N} =
    getindex(A.parent, Base._ind2sub(A.parent, index(A.parent))...)
Base.setindex!(A::RandomBasedArray, v, ::Int) =
    @inbounds setindex!(A.parent, v, index(A.parent))
Base.setindex!(A::RandomBasedArray{T,N}, v, ::Vararg{Int,N}) where {T,N} =
    setindex!(A.parent, v, Base._ind2sub(A.parent, index(A.parent))...)
# Show a fixed copy of the array, otherwise the alignment algorithm would get
# crazy trying to show a "mutating" array
Base.show(io::IO, m::MIME"text/plain", A::RandomBasedArray) = show(io, m, copy(A))

end # module
