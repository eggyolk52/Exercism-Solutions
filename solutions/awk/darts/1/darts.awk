END {
    x = $1
    y = $2
    d = sqrt(x^2 + y^2)

    if (d <= 1) print 10
    else if (d <= 5) print 5
    else if (d <= 10) print 1
    else print 0
}
