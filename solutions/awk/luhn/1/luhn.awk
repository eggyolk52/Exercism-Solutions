END {
    gsub(" ", "")
    if (length($0) < 2) { print "false"; exit }
    if ($0 !~ /^[0-9]+$/) { print "false"; exit }

    for (i = length($0); i > 0; i--) {
        cnt++
        mult = cnt % 2 == 0 ? 2 : 1
        n = substr($0, i, 1) * mult
        sum += n > 9 ? n - 9 : n
    }

    print sum % 10 == 0 ? "true" : "false"
}
