package util

import (
	"crypto/rand"
	"encoding/base64"
	"github.com/pion/randutil"
	"math"
)

func RandomBigAlphaString(l int) string {
	s, _ := randutil.GenerateCryptoRandomString(l, "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
	return s
}

func RandomBase64String(l int) string {
	buff := make([]byte, int(math.Ceil(float64(l)/float64(1.33333333333))))
	_, _ = rand.Read(buff)
	str := base64.RawURLEncoding.EncodeToString(buff)
	return str[:l] // strip 1 extra character we get from odd length results
}
