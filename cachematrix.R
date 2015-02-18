## Put comments here that give an overall description of what your
## functions do

## I'm just following the pattern of the example, but applying it to a matrix 
## and focused on solving the inverse with the solve funtion

makeCacheMatrix <- function(x = matrix()) {
		m <<- NULL
		set <- function(y) {
			x <<- y
			m <<- NULL
		}
        	get <- function() x
        	setinv <- function(solve) m <<- solve
        	getinv <- function() m
        	list(set = set, get = get,
             	setinv = setinv,
             	getinv = getinv)
}


## Once the matrix is cached, we can just run the inverse calculation as made
## with the vector's mean

cacheinv <- function(x, ...) {
        m <- x$getinv()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinv(m)
        m
}