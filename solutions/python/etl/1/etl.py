def transform(legacy_data):
    data = {}
    for k in legacy_data:
        for v in legacy_data[k]:
            data[v.lower()] = k

    return data