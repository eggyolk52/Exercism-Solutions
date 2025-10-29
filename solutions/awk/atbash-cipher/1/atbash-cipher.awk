BEGIN {
    alpha = "abcdefghijklmnopqrstuvwxyz"
    len = length(alpha)
    for (i = 1; i <= len; i++)
        cipher[substr(alpha, i, 1)] = substr(alpha, len - i + 1, 1)
    for (i = 0; i < 10; i++) cipher[i] = i
}

END {
    for (i = 1; i <= length($0) + 1; i++) {
        c = tolower(substr($0, i, 1))
        if (c in cipher) res = res cipher[c]
    }

    if (direction == "decode") {
        print res
    } else if (direction == "encode") {
        for (i = 1; i <= length(res) + 1; i++) {
            printf "%s", substr(res, i, 1)
            if (i < length(res) && i % 5 == 0) printf " "
        }
        printf "\n"
    }
}
