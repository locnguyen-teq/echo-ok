package main

import (
	"net/http"

	"github.com/labstack/echo/v4"
)

func main() {
	// value := os.Args[1]
	// Echo instance
	e := echo.New()

	// Routes
	e.GET("/echo/ok", func(context echo.Context) error {
		return context.JSON(http.StatusOK, "ok")
	})

	// Start server
	e.Logger.Fatal(e.Start(":1323"))
}
