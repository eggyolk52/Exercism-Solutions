def saddle_points(matrix):
    if matrix == []:
        return []

    len_matrix = len(matrix)
    len_col = len(matrix[0])

    for row in range(1, len_matrix):
        if len_col != len(matrix[row]):
            raise ValueError("irregular matrix")

    result = []
    biggest_in_rows = get_biggest_in_rows(matrix)
    smallest_in_cols = get_smallest_in_cols(matrix)

    for row in range(len_matrix):
        for col in range(len(matrix[row])):
            tree = matrix[row][col]

            if tree == biggest_in_rows[row] and tree == smallest_in_cols[col]:
                result.append({"row": row+1, "column": col+1})

    return result

def get_biggest_in_rows(matrix):
    result = []

    for row in matrix:
        result.append(max(row))

    return result

def get_smallest_in_cols(matrix):
    result = []

    for col in range(len(matrix[0])):
        cols = []

        for row in range(len(matrix)):
            cols.append(matrix[row][col]) 

        result.append(min(cols))

    return result
