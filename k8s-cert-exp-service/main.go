package main

import (
	"bytes"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/sfreiberg/simplessh"
)

func main() {
	client, err := simplessh.ConnectWithPassword("192.168.33.71", "vagrant", "vagrant")
	if err != nil {
		panic(err)
	}

	defer client.Close()

	output, err := client.Exec("sudo kubeadm certs check-expiration | tail -n +4")
	if err != nil {
		panic(err)
	}

	r := gin.Default()

	r.GET("/", func(c *gin.Context) {
		c.String(http.StatusOK, bytes.NewBuffer(output).String())
	})

	r.Run(":8080")
}
