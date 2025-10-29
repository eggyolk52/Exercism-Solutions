package secret

var codes = []string{
	"wink",
	"double blink",
	"close your eyes",
	"jump",
	"reverse",
}

func Handshake(code uint) []string {
	res := []string{}
	for i := 0; i < len(codes); i++ {
		if isAction(i, code) {
			if codes[i] == "reverse" {
				res = reverse(res)
			} else {
				res = append(res, codes[i])
			}
		}
	}

	return res
}

func isAction(bar int, code uint) bool {
	return ((1 << bar) & code) > 0
}

func reverse(arr []string) []string {
	if len(arr) < 2 {
		return arr
	}

	res := []string{}
	for i := 0; i < len(arr); i++ {
		res = append(res, arr[len(arr)-1-i])
	}

	return res
}
