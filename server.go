package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"strconv"
)

type serverConfig struct {
	Env  string
	Port int64
	Host string

	TLSPort         int64
	TLSHost         string
	TLSCertFilePath string
	TLSKeyFilePath  string
}

var App serverConfig = serverConfig{Port: 8080, Host: "localhost", Env: "development"}

func initApp() {
	if port := os.Getenv("DH_PORT"); port != "" {
		App.Port, _ = strconv.ParseInt(port, 10, 64)
	}

	if host := os.Getenv("DH_HOST"); host != "" {
		App.Host = host
	}

	if env := os.Getenv("DH_ENV"); env != "" {
		App.Env = env
	}

	if tlsPort := os.Getenv("DH_TLS_PORT"); tlsPort != "" {
		App.TLSPort, _ = strconv.ParseInt(tlsPort, 10, 64)
	}

	if tlsHost := os.Getenv("DH_TLS_HOST"); tlsHost != "" {
		App.TLSHost = tlsHost
	}

	if tlsCertFilePath := os.Getenv("DH_TLS_CERT"); tlsCertFilePath != "" {
		App.TLSCertFilePath = tlsCertFilePath
	}

	if tlsKeyFilePath := os.Getenv("DH_TLS_KEY"); tlsKeyFilePath != "" {
		App.TLSKeyFilePath = tlsKeyFilePath
	}
}

func main() {
	initApp()

	log.Println("[DragonHoard Setttings Initialized]", App)

	var prettyUrl, url string

	if App.TLSPort > 0 {

		url = fmt.Sprintf("%v:%v", App.TLSHost, App.TLSPort)
		prettyUrl = fmt.Sprintf("https://%v", url)

		log.Println("[Spinning DragonHoard Secure]", prettyUrl)
		err := http.ListenAndServeTLS(url, App.TLSCertFilePath, App.TLSKeyFilePath, nil)
		if err != nil {
			log.Fatal(err)
		}
	} else {
		url = fmt.Sprintf("%v:%v", App.Host, App.Port)
		prettyUrl = fmt.Sprintf("http://%v", url)

		log.Println("[Spinning DragonHoard InSecure]", prettyUrl)
		err := http.ListenAndServe(url, nil)
		if err != nil {
			log.Fatal(err)
		}
	}
}
