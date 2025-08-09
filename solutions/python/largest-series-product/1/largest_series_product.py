def largest_product(series, size):
    if len(series) < size:
        raise ValueError("span must be smaller than string length")
    elif size < 0:
        raise ValueError("span must not be negative")
    elif not series.isdigit():
        raise ValueError("digits input must only contain digits")

    series_list = []
    product_list = []

    for i in range(len(series) - (size - 1)):
        series_list.append(series[i:i + size])

    for str in series_list:
        product = 1
        for char in str:
            product *= int(char)
        product_list.append(product)

    return max(product_list)