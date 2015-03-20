package user

import (
	//"reflect"
	"log"
)

type User struct {
	id           int    `json:"id"`
	firstName    string `json:"first_name"`
	lastName     string `json:"last_name"`
	passwordHash string
}

func NewUser(properties interface{}) (newUser User, err error) {
	newUser = User{}
	log.Println(properties)
	/*
		reUser := reflect.ValueOf(&newUser).Elem()
		for k, v := range properties {
			reUser.Elem().FieldByName(k.name).Set(v)
		}
	*/
	return newUser, nil
}
