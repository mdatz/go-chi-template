package main

import (
  "fmt"
  "net/http"
  "github.com/go-chi/chi/v5"
)

func main() {

  const port = 2077

  r := chi.NewRouter()
  r.Get("/", func(w http.ResponseWriter, r *http.Request) {
    w.Write([]byte("welcome"))
  })

  fmt.Printf("Server listening on port %v\n", port)
  http.ListenAndServe(fmt.Sprintf(":%v", port), r)
}
