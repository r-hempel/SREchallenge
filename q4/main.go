package main

import (
    "fmt"
    "os"	
)

func main() {
	// takes all command line arguments except the program name
	argsWithoutProg := os.Args[1:]

	//iterates over all command line arguments to print out all movie titles for the search queries
	for _, arg := range argsWithoutProg{		
		titles := movieResponse(arg)
		for i, t := range titles {
			fmt.Println(i, t)
		}
	}
}