## Functions to answer Programming Assignment 2 of R Programming.
## Goal is to write a pair of functions that cache the inverse of a matrix.

## First function - makecacheMatrix - creates a special "matrix" object.
## The object will be able to cache it's inverse.
## Defines variables and functions in parent environment. 
## Sets them so they can be accessed elsewhere.

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function (y) {
                x <<- y
                m <<- NULL
        }
        get <- function () {
                x    
        }
        setinverse <- function(inverse) {
                m <<- inverse 
        }
        getinverse <- function() {
                m
        }
        list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## Second function computes the inverse of the special "matrix" returned by first function.
## Will return the inverse from the cache if solved. 
## If nothing has been cached, it will calculate, cache and return the inverse.

cacheSolve <- function(x, ...) {
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached inverse")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}
