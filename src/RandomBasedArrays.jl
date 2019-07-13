module RandomBasedArrays

export RandomBasedArray

struct RandomBasedArray{T,N} <: AbstractArray{T,N}
    parent::Array{T,N}
end

index(p::Array) = rand(eachindex(p))

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
