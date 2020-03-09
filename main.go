package main

import (
	"context"
	"log"
	"os"
	"os/signal"
	"syscall"
	"time"
)



func main() {
	log.Println("App Start")

	//go websocket.Server(*wsport)
	waitForShutdown()
}

func waitForShutdown() {
	interruptChan := make(chan os.Signal, 1)
	signal.Notify(interruptChan, os.Interrupt, syscall.SIGINT, syscall.SIGTERM)

	// Block until we receive our signal.
	<-interruptChan

	// Create a deadline to wait for.
	_, cancel := context.WithTimeout(context.Background(), time.Second*10)
	defer cancel()

	//Handler Shutdown
	//srv.Shutdown(ctx)

	log.Println("Shutting down")
	os.Exit(0)
}