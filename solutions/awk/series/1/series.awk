END {
    if (length($0) == 0) {
        print "series cannot be empty"
        exit 1
    } else if (len > length($0) || len < 1) {
        print "invalid length"
        exit 1
    }

    for (i=1; i<=(length($0) - len + 1); i++)
        res = res substr($0, i, len) " "

    print substr(res, 1, length(res) - 1)
}
