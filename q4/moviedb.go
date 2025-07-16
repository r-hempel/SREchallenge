package main

import (
	"encoding/json"
	"io/ioutil"
	"log"
	"net/http"
	"net/url"
	"sort"
	"strconv"	
	
)

//can be extended with the remaining data fields if required (Year, imdbID)
type data struct {
	Title string `json: "Title"`
}

//can be extended with the remaining data fields if required (page, per_page)
type MovieResponse struct {
	Total      int     `json: "total"`
	TotalPages int     `json:"total_pages"`
	Data       []data `json: "data"`
}

func movieResponse(query string) []string {
	//url.QueryEscape is required to transform passed string to url search queries (e.g. blank space to %20)
	query = url.QueryEscape(query)

	//executes the get-request and stores the response in the result var
	result := request("https://jsonmock.hackerrank.com/api/movies/search?Title=" + query)

	//stores the number of totalPages be able to repeat the request for all pages
	totalPages := result.TotalPages
	
	//as this slice is used by ref it must be initialized first
	var titles []string

	//the avoid the need of querying page 1 again, this function is already called before the following loop.
	//titles is called by ref to increase efficiency
	extractTitles(&result.Data, &titles)

	//iterate through the following pages, if present
	for page := 2; page <= totalPages; page++ {
		result = request("https://jsonmock.hackerrank.com/api/movies/search?Title=" + query + "&page=" + strconv.Itoa(page))	
		extractTitles(&result.Data, &titles)
	}

	//sort results for each search query in ascending order
	sort.Strings(titles)

	return titles
}

//sends an http get request to the URL passed as PARAM and returns the body
func request(url string) MovieResponse {
	//send response to passed url 
	resp, err := http.Get(url)
	if err != nil {
		log.Fatalf("Failed to send request: %v", err)
	}
	defer resp.Body.Close() //as per the go documentation this is a requirement: https://pkg.go.dev/net/http

	//extract the response body to var body
	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		log.Fatalf("Failed to read response body: %v", err)
	}

	//as this var is used by ref it must be initialized first
	var result MovieResponse
	//parse json content to struct var
	if err := json.Unmarshal(body, &result); err != nil {
		log.Fatalf("Failed to parse JSON: %v", err)
	}

	return result
}

//extracts the titles from the response body and stores it into a separate slice to enable paginating.
//implemented by ref to improve execution time
func extractTitles(data *[]data, titles *[]string) {
	for _, title := range *data {
		*titles = append(*titles, title.Title)
	}
}
