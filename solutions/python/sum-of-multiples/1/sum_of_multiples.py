def sum_of_multiples(limit, multiples):
    multiples_list = []

    for n in multiples:
        if n == 0:
            continue

        n_multiple = n

        while n_multiple < limit:
            multiples_list.append(n_multiple)
            n_multiple += n

    return sum(set(multiples_list))
