## Question 4 readme
* as per the requirements this go-tool sends a request to https://jsonmock.hackerrank.com/api/movies/search/?Title=*movie-title* where movie title can be passed individually as command line argument. It was not part of the requirements to pass the query via command line argument, but this will make it easier to test multiple queries
* Usage:
    * Run `go run main.go moviedb.go <your-movie-titles>` to execute the request using the the passed movie titles.
    * You can pass either multiple single command line arguments to search for multiple movie titles (e.g. `go run main.go moviedb.go Spiderman Waterworld` returns two requests for the query `[...]?Title=Spiderman` and `[...]?Title=Waterworld`) or wrap it in Quotation Marks to search for movie titles that consist of several words (e.g. `go run main.go moviedb.go Spiderman "Harry Potter"`)
