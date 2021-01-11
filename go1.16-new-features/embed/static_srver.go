package main

import (
	"embed"
	"net/http"
)

func main() {
	//go:embed assets/*
	var assets embed.FS

	fs := http.FileServer(http.FS(assets))
	println("server listen on port: 8080")
	if err := http.ListenAndServe(":8080", fs); err != nil {
		panic(err)
	}
}
