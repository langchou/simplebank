package util

import (
	"math/rand"
	"strings"
	"time"
)

var globalRand *rand.Rand

const alphabet = "abcdefghijklmnopqrstuvwxyz"

func init() {
	src := rand.NewSource(time.Now().UnixNano())

	globalRand = rand.New(src)

}

func RandomInt(min, max int64) int64 {
	return min + globalRand.Int63n(max-min+1)
}

func RandomString(n int) string {
	var sb strings.Builder
	k := len(alphabet)

	for i := 0; i < n; i++ {
		c := alphabet[globalRand.Intn(k)]
		sb.WriteByte(c)
	}
	return sb.String()
}

func RandomOwner() string {
	return RandomString(6)
}

func RandomMoney() int64 {
	return RandomInt(0, 1000)
}

func RandomCurrency() string {
	currencies := []string{"EUR", "USD", "RMB", "CAD"}
	return currencies[globalRand.Intn(len(currencies))]
}
