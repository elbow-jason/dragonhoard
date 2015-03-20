package user

import (
	//"reflect"
	"testing"
)

func TestNewUser(t *testing.T) {
	options := struct{ firstName, lastName string }{"Michael", "Christenson II"}
	newUser, err := NewUser(options)
	if err != nil {
		t.Fatalf("An error occurred while creating a newUser: %+v", err)
	}
	t.Log(newUser)

	//reOptions := reflect.ValueOf(&options)

}
