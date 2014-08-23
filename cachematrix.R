## We have to write a function which caches the inverse of a matrix 


## This function will create a list containing a function to 
## 1. set the value of a matrix 
## 2. get the value of a matrix 
## 3. set the inverse value of a matrix 
## 4. get the inverse value of a matrix 

makeCacheMatrix <- function(x = matrix()) {
            i <- NULL
            set <- function(y){
                    x <<- y
                    i <<- NULL
            }
            get <- function() x
            setinverse <- function(inverse) i <<- inverse 
            getinverse <- function() i
            list(set=set,get=get,setinverse=setinverse,
                 getinverse=getinverse)
}


## The following function creates the inverse of a matrix created with the above function.
## However it first checks whther the inverse exists in the cache or not.If yes , then it 
## it returns the cache value else it computes the inverse and returns the calculated 
## inverse of  the inverteble matrix.It also caches the inverse in the setinverse function so 
## that the  next time you calculate the inverse of the matrix , it gets the cached value


cacheSolve <- function(x, ...) {
                print(x)
                print(class(x))
                i <- x$getinverse()
                if(!is.null(i)){
                    message("getting cached data")
                    return(i)
                }
                matrix <- x$get()
                i <- solve(matrix)
                x$setinverse(i)
                i
        ## Return a matrix that is the inverse of 'x'
}
