END {
    if ("T" !~ $0) $2 = "00 00 00"
    gsub("[-T:]", " ")
    print strftime("%FT%T", mktime($0, "utc") + 10^9, "utc")
}

