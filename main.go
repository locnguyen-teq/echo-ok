package main

import (
	"encoding/json"
	"fmt"
	"net/http"

	"log"

	"github.com/labstack/echo/v4"
)

type Data struct {
	ResponseType string `json:"response_type"`
	Text         string `json:"text"`
	Username     string `json:"username"`
	ChannelId    string `json:"channel_id"`
	IconURL      string `json:"icon_url"`
	Type         string `json:"type"`
	GotoLocation string `json:"goto_location"`
	TriggerId    string `json:"trigger_id"`
}

func main() {
	// value := os.Args[1]
	// Echo instance
	e := echo.New()

	// Routes
	e.GET("/echo/ok", func(context echo.Context) error {
		return context.JSON(http.StatusOK, Data{})
	})

	// Routes
	e.POST("/a", func(context echo.Context) error {
		// fmt.Printf("context.Request(): %v\n", context.Request().Header)
		context.Request().ParseForm()
		fmt.Printf("context.Request(): %v\n", context.Request().PostForm)
		return context.JSON(http.StatusOK, Data{
			ResponseType: "in_channel",
			Text:         "arm",
		})
	})

	// Start server
	e.Logger.Fatal(e.Start(":1323"))
}

func GetJSONRawBody(c echo.Context) interface{} {

	var jsonBody interface{}
	err := json.NewDecoder(c.Request().Body).Decode(&jsonBody)
	if err != nil {

		log.Println(err)
		return nil
	}

	return jsonBody
}
