package util

const (
	USD = "USD"
	RMB = "RMB"
	CAD = "CAD"
)

func IsSupportedCurrency(currency string) bool {
	switch currency {
	case USD, RMB, CAD:
		return true
	default:
		return false
	}
}
